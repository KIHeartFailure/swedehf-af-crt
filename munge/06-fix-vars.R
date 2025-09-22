rsdata <- rsdata %>%
  mutate(sos_com_af_type = factor(case_when(
    sos_com_af == "No" ~ NA_real_,
    sos_com_af_perm == "Yes" ~ 1,
    sos_com_af_pers == "Yes" ~ 2,
    sos_com_af_parox == "Yes" ~ 3,
    TRUE ~ 4
  ), levels = 1:4, labels = c("Permanent", "Persistent", "Paroxysmal", "Unknown/Unclassified"))) %>%
  select(-sos_com_af_parox, -sos_com_af_perm, -sos_com_af_pers, -sos_deathdtm, -shf_ef_cat)


rsdata <- rsdata %>%
  mutate(sos_com_af_type5yr = factor(case_when(
    sos_com_af5yr == "No" ~ NA_real_,
    sos_com_af_perm5yr == "Yes" ~ 1,
    sos_com_af_pers5yr == "Yes" ~ 2,
    sos_com_af_parox5yr == "Yes" ~ 3,
    TRUE ~ 4
  ), levels = 1:4, labels = c("Permanent", "Persistent", "Paroxysmal", "Unknown/Unclassified"))) %>%
  select(-sos_com_af_parox5yr, -sos_com_af_perm5yr, -sos_com_af_pers5yr)


rsdata <- rsdata %>%
  mutate(sos_com_af_type1yr = factor(case_when(
    sos_com_af1yr == "No" ~ NA_real_,
    sos_com_af_perm1yr == "Yes" ~ 1,
    sos_com_af_pers1yr == "Yes" ~ 2,
    sos_com_af_parox1yr == "Yes" ~ 3,
    TRUE ~ 4
  ), levels = 1:4, labels = c("Permanent", "Persistent", "Paroxysmal", "Unknown/Unclassified"))) %>%
  select(-sos_com_af_parox1yr, -sos_com_af_perm1yr, -sos_com_af_pers1yr)
