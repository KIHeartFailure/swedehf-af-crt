rsdata <- rsdata %>%
  mutate(sos_com_af_type = factor(case_when(
    sos_com_af == "No" ~ NA_real_,
    sos_com_af_perm == "Yes" ~ 1,
    sos_com_af_pers == "Yes" ~ 2,
    sos_com_af_parox == "Yes" ~ 3,
    TRUE ~ 4
  ), levels = 1:4, labels = c("Permanent", "Persistent", "Paroxysmal", "Unknown/Unclassified"))) %>%
  select(-sos_com_af_parox, -sos_com_af_perm, -sos_com_af_pers, -sos_deathdtm, -shf_ef_cat)
