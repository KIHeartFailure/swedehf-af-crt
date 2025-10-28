# Comorbidities -----------------------------------------------------------

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "hypertension",
  diakod = " I1[0-5]",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "diabetes",
  diakod = " E1[0-4]",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  type = "com",
  name = "ihd",
  diakod = " 41[0-4]| I2[0-5]| Z951| Z955",
  opkod = " FNA| FNB| FNC| FND| FNE| FNF| FNH| FNG",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "pci",
  opkod = " FNG",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  type = "com",
  name = "cabg",
  diakod = " Z951| Z955",
  opkod = " FNA| FNB| FNC| FND| FNE| FNF| FNH",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "pad",
  diakod = " I7[0-3]",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)


rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af",
  diakod = " 427D| I48",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_perm",
  diakod = " I482",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_parox",
  diakod = " I480",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_pers",
  diakod = " I481",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)


rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af5yr",
  stoptime = -5 * 365.25,
  diakod = " 427D| I48",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_perm5yr",
  stoptime = -5 * 365.25,
  diakod = " I482",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_parox5yr",
  stoptime = -5 * 365.25,
  diakod = " I480",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_pers5yr",
  stoptime = -5 * 365.25,
  diakod = " I481",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)


rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af1yr",
  stoptime = -365,
  diakod = " 427D| I48",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_perm1yr",
  stoptime = -365,
  diakod = " I482",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_parox1yr",
  stoptime = -365,
  diakod = " I480",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "af_pers1yr",
  stoptime = -365,
  diakod = " I481",
  warnings = FALSE,
  meta_reg = "NPR",
  valsclass = "fac"
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "stroke",
  diakod = " 43[0-4]| 438| I6[0-4]| I69[0-4]",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "valvular",
  diakod = " I0[5-8]| I3[4-9]| Q22| Q23[0-3]| Q23[0-3]| Q23[5-9]| Z95[2-4]",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "copd",
  diakod = " J4[0-4]",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "liver",
  diakod = " B18| I85| I864| I982| K70| K710| K711| K71[3-7]| K7[2-4]| K760| K76[2-9]",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  evar = ekod_all,
  type = "com",
  name = "renal",
  ekod = "Y841",
  diakod = " N18| N19| Z491| Z492| T824| Z490| Z992| I120| I130| I131| I132| N085| M103| E122| E112| E132| E102| E142| R944| N0[2-4]| N0[6-8]| N25| N11| N1[4-6]| Q61[1-3]| Q6[0-4]| K767",
  opkod = " DR014| DR016| DR020| DR012| DR013| DR024| TJA33| TJA35| DR055| DR056| DR060| DR061| QF006",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "dementia",
  diakod = " F0[0-4]| R54",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "com",
  name = "cancer3y",
  diakod = " C",
  stoptime = -3 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  type = "com",
  name = "muscoloskeletal3y",
  diakod = " M",
  stoptime = -3 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = DIA_all,
  opvar = OP_all,
  type = "com",
  name = "bleed",
  diakod = " S064| S065| S066| I850| I983| K226| K250| K252| K254| K256| K260| K262| K264| K266| K270| K272| K274| K276| K280| K284| K286| K290| K625| K661| K920| K921| K922| H431| N02| R04| R58| T810| D629",
  opkod = " DR029",
  stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "icd",
  opkod = " FPG",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "pm",
  opkod = " FPE| FPF| DF013| ZXG40| ZXG50| TFP00",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "afablation",
  opkod = " FPB32| DF003| DF001",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "com",
  name = "cardioversion",
  opkod = " DF026| DF027",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)

# outcomes

rsdata <- create_sosvar(
  sosdata = patregrsdata %>% filter(sos_source == "sv"),
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "out",
  name = "hosphf",
  diakod = global_hficd,
  censdate = censdtm,
  valsclass = "fac",
  warnings = FALSE
)


rsdata <- create_sosvar(
  sosdata = patregrsdata %>% filter(sos_source == "sv"),
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "out",
  name = "hosppneumonia",
  diakod = " J09| J1[0-8]",
  censdate = censdtm,
  valsclass = "fac",
  warnings = FALSE
)

rsdata <- create_sosvar(
  sosdata = patregrsdata %>% filter(sos_source == "sv"),
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "out",
  name = "hospgutractinfection",
  diakod = " N10| N11| N12| N136| N30| N33| N34| N370| N390| N41| N45| N481| N482| N49| N51| N7",
  censdate = censdtm,
  valsclass = "fac",
  warnings = FALSE
)

rsdata <- create_sosvar(
  sosdata = patregrsdata %>% filter(sos_source == "sv"),
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "out",
  name = "hosptrauma",
  diakod = " S| T0| T1[0-4]",
  censdate = censdtm,
  valsclass = "fac",
  warnings = FALSE
)

rsdata <- create_sosvar(
  sosdata = patregrsdata %>% filter(sos_source == "sv"),
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "out",
  name = "counthosphf",
  diakod = global_hficd,
  noof = TRUE,
  censdate = censdtm,
  valsclass = "num",
  warnings = FALSE
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "out",
  name = "hisablation",
  opkod = " FPB20| FPB22| FPE00| FPE20",
  censdate = censdtm,
  valsclass = "fac",
  warnings = FALSE
)

rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "out",
  name = "afablation",
  opkod = " FPB32| DF003| DF001",
  censdate = censdtm,
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- create_sosvar(
  sosdata = patregrsdata,
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  opvar = OP_all,
  type = "out",
  name = "cardioversion",
  censdate = censdtm,
  opkod = " DF026| DF027",
  # stoptime = -5 * 365.25,
  valsclass = "fac",
  warnings = FALSE
)
rsdata <- rsdata %>%
  mutate(censdtm_sens = pmin(censdtm, ymd("2022-08-31")))

rsdata <- create_sosvar(
  sosdata = patregrsdata %>% filter(sos_source == "sv"),
  cohortdata = rsdata,
  patid = lopnr,
  indexdate = indexdtm,
  sosdate = INDATUM,
  diavar = HDIA,
  type = "out",
  name = "counthosphf_sens",
  diakod = global_hficd,
  noof = TRUE,
  censdate = censdtm_sens,
  valsclass = "num",
  warnings = FALSE
)

rsdata <- rsdata %>%
  select(-censdtm_sens)

outcommeta <- metaout
rm(metaout)

# Cause of death ----------------------------------------------------------

rsdata <- rsdata %>%
  mutate(
    sos_out_death = ynfac(ifelse(censdtm == sos_deathdtm & !is.na(sos_deathdtm), 1, 0)),
    sos_outtime_death = as.numeric(censdtm - indexdtm),
    sos_deathcause = if_else(sos_out_death == "No", NA_character_, sos_deathcause)
  )

rsdata <- create_deathvar(
  cohortdata = rsdata,
  indexdate = indexdtm,
  censdate = censdtm,
  deathdate = sos_deathdtm,
  name = "cv",
  orsakvar = sos_deathcause,
  orsakkod = "I|J81|K761|R570|G45",
  valsclass = "fac",
  warnings = FALSE
)

deathmeta <- metaout
rm(metaout)
