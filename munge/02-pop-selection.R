flow <- flow[c(1:8, 10), 1:2]
names(flow) <- c("Criteria", "N")

flow <- flow %>%
  mutate(Criteria = if_else(
    Criteria == "Exclude posts with with index date > 2023-12-31 (SwedeHF)/2021-12-31 (NPR HF, Controls)",
    "Exclude posts with with index date > 2023-12-31", Criteria
  ))

flow <- flow %>%
  mutate(
    Ncrt = NA,
    Ncontrol = NA
  ) %>%
  add_row(
    Criteria = "General inclusion/exclusion criteria",
    N = NA, .before = 1
  )
flow <- flow %>%
  add_row(
    Criteria = "Project specific inclusion/exclusion criteria",
    N = NA
  )

rsdata <- rsdata422 %>%
  mutate(sos_deathdtm = if_else(sos_out_death == "Yes", shf_indexdtm + sos_outtime_death, NA_Date_)) %>%
  select(
    lopnr, shf_indexdtm, shf_centre, shf_followuphfunit, shf_followuplocation, shf_sex, sos_durationhf, shf_ef_cat, shf_ef, shf_qrs, shf_lbbb, shf_bpsys,
    shf_bpdia, shf_map, shf_heartrate, shf_gfrckdepi, shf_ntprobnp, shf_nyha, censdtm, shf_ekg, sos_deathdtm, sos_deathcause
  ) %>%
  filter(!is.na(shf_ef_cat))
flow <- flow %>%
  add_row(
    Criteria = "Exclude posts with missing EF",
    N = nrow(rsdata)
  )

rsdata <- rsdata %>%
  filter(shf_ef_cat == "HFrEF")
flow <- flow %>%
  add_row(
    Criteria = "Include posts with HFrEF",
    N = nrow(rsdata)
  )

# crt only
crtdata <- icdpm %>%
  filter(EVENTTYPE == "Intervention" & !PATIENTTYPE %in% c("null", "ILR") &
    INTERVENTYIONTASKTYPE == "Implantation" &
    DEVICETYPE %in% c("Pacemaker", "ICD") &
    (CRT %in% c(1, 2) | MODE == "DDDR+CRT")) %>%
  mutate(crt_type = factor(if_else(DEVICETYPE %in% c("Pacemaker"), 1, 2), levels = 1:2, labels = c("CRT-P", "CRT-D"))) %>%
  select(LopNr, EVENTDATE, crt_type) %>%
  distinct() %>%
  group_by(LopNr) %>%
  arrange(EVENTDATE, desc(crt_type)) %>%
  slice(1) %>%
  ungroup() %>%
  rename(
    lopnr = LopNr,
    crtdtm = EVENTDATE
  )

icdpmdata <- icdpm %>%
  filter(EVENTTYPE == "Intervention" & !PATIENTTYPE %in% c("null", "ILR") &
    INTERVENTYIONTASKTYPE == "Implantation" &
    DEVICETYPE %in% c("Pacemaker", "ICD", "ICD-elektrod", "Pacemakerelektrod")) %>%
  select(LopNr, EVENTDATE, DEVICETYPE) %>%
  distinct() %>%
  group_by(LopNr, DEVICETYPE) %>%
  arrange(EVENTDATE) %>%
  slice(1) %>%
  ungroup() %>%
  rename(
    lopnr = LopNr
  )

rsdata <- left_join(rsdata, crtdata, by = "lopnr") %>%
  mutate(
    time_crt_shf = as.numeric(crtdtm - shf_indexdtm),
    crt = case_when(
      is.na(time_crt_shf) ~ 0,
      time_crt_shf >= -365 & time_crt_shf <= 30 ~ 1,
      TRUE ~ 0
    ),
    indexdtm = if_else(crt == 1, crtdtm, shf_indexdtm),
    indexyear = year(indexdtm),
    sos_durationhf = if_else(crt == 1, sos_durationhf + time_crt_shf, sos_durationhf),
    control = case_when(
      is.na(shf_qrs) ~ 0,
      shf_qrs >= 150 ~ 1,
      TRUE ~ 0
    ),
    crt = if_else(crt == 0 & control == 0, NA, crt),
    crt_type = if_else(crt == 1, crt_type, NA)
  ) %>%
  select(-shf_indexdtm)

rsdata <- rsdata %>%
  filter(!is.na(crt)) %>%
  select(-control)

flow <- flow %>%
  add_row(
    Criteria = "Fullfills criteria for CRT, first CRT post in ICD/PM Registry and SwedeHF post within 1 year prior to 30 days after CRT",
    Ncrt = nrow(rsdata %>% filter(crt == 1))
  )

flow <- flow %>%
  add_row(
    Criteria = "Fullfills criteria for control, QRS >= 150",
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )


# prior icd pm
icdpmdata2 <- left_join(rsdata %>% select(lopnr, indexdtm, crt),
  icdpmdata,
  by = "lopnr"
) %>%
  filter(EVENTDATE < indexdtm) %>%
  mutate(
    icdpm_com_pm = if_else(DEVICETYPE %in% c("Pacemaker", "Pacemakerelektrod"), 1, 0),
    icdpm_com_icd = if_else(DEVICETYPE %in% c("ICD", "ICD-elektrod"), 1, 0),
  ) %>%
  select(-EVENTDATE, -DEVICETYPE)

rsdata <- left_join(rsdata,
  icdpmdata2 %>%
    filter(icdpm_com_pm == 1) %>%
    select(-icdpm_com_icd) %>%
    distinct(),
  by = c("lopnr", "indexdtm", "crt")
) %>%
  mutate(icdpm_com_pm = ynfac(replace_na(icdpm_com_pm, 0)))

rsdata <- left_join(rsdata,
  icdpmdata2 %>%
    filter(icdpm_com_icd == 1) %>%
    select(-icdpm_com_pm) %>%
    distinct(),
  by = c("lopnr", "indexdtm", "crt")
) %>%
  mutate(icdpm_com_icd = ynfac(replace_na(icdpm_com_icd, 0)))

rsdata <- rsdata %>%
  filter(indexdtm >= ymd("2014-01-01"))
flow <- flow %>%
  add_row(
    Criteria = "Include posts >= 2014-01-01",
    Ncrt = nrow(rsdata %>% filter(crt == 1)),
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )

rsdata <- rsdata %>%
  filter(indexdtm <= ymd("2022-08-31"))
flow <- flow %>%
  add_row(
    Criteria = "Include posts <= 2022-08-31 (data available from the ICD/PM Registry)",
    Ncrt = nrow(rsdata %>% filter(crt == 1)),
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )

rsdata <- rsdata %>%
  filter(sos_durationhf >= 182)
flow <- flow %>%
  add_row(
    Criteria = "Include posts with HF duration in the NPR > 6 months",
    Ncrt = nrow(rsdata %>% filter(crt == 1)),
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  add_unique = crt,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "exclude",
  opkod = " FPB20| FPB22| FPE00| FPE20",
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- rsdata %>%
  filter(sos_com_exclude == "No") %>%
  select(-sos_com_exclude)
flow <- flow %>%
  add_row(
    Criteria = "Exclude posts with FPB20,FPB22, FPE00 and FPE20 prior to or at index",
    Ncrt = nrow(rsdata %>% filter(crt == 1)),
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )


rsdata <- rsdata %>%
  mutate(keep = case_when(
    crt == 1 ~ 1,
    is.na(time_crt_shf) ~ 1,
    time_crt_shf < 0 ~ 0,
    time_crt_shf > 610 ~ 1,
    TRUE ~ 1
  )) %>%
  filter(keep == 1) %>%
  select(-keep)
flow <- flow %>%
  add_row(
    Criteria = "Include control posts without CRT prior to or up until 30 days after index",
    Ncrt = nrow(rsdata %>% filter(crt == 1)),
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )

rsdatacontrol <- rsdata %>%
  filter(crt == 0) %>%
  group_by(lopnr) %>%
  arrange(indexdtm) %>%
  slice(1) %>%
  ungroup()

rsdatacrt <- rsdata %>%
  filter(crt == 1) %>%
  group_by(lopnr) %>%
  arrange(abs(time_crt_shf)) %>%
  slice(1) %>%
  ungroup()

rsdata <- bind_rows(rsdatacontrol, rsdatacrt)

rsdata <- rsdata %>%
  group_by(lopnr) %>%
  arrange(indexdtm) %>%
  slice(1) %>%
  ungroup()

flow <- flow %>%
  add_row(
    Criteria = "First patient of first post (control), closest post (CRT) / patient",
    Ncrt = nrow(rsdata %>% filter(crt == 1)),
    Ncontrol = nrow(rsdata %>% filter(crt == 0))
  )
