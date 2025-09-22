# Project specific packages, functions and settings -----------------------

source(here::here("setup/setup.R"))

# Load data ---------------------------------------------------------------

load(here(shfdbpath, "data/v422/rsdata422.RData"))
load(file = paste0(shfdbpath, "/data/", datadate, "/patregrsdata.RData"))
load(paste0(shfdbpath, "/data/", datadate, "/rawData_scb.RData"))
icdpm <- read_sas(paste0(shfdbpath, "/raw-data/SOS/20220908/komp ICDPMreg regstockholm/sos_result.sas7bdat"))

# Meta data ect -----------------------------------------------------------

metavars <- read.xlsx(here(shfdbpath, "metadata/meta_variables.xlsx"))
load(here(paste0(shfdbpath, "data/v422/meta_statreport.RData")))

# Munge data --------------------------------------------------------------

source(here("munge/01-vars.R"))
source(here("munge/02-pop-selection.R"))
source(here("munge/03-scb-socioec.R"))
source(here("munge/04-npr-comorb.R"))
source(here("munge/05-pdr-meds.R"))
source(here("munge/06-fix-vars.R"))

# Cache/save data ---------------------------------------------------------

save(
  file = here("data/clean-data/data.RData"),
  list = c(
    "rsdata",
    "flow",
    "tabvars",
    "metalm",
    "outcommeta",
    "deathmeta"
  )
)

write_dta(rsdata,
          path = here(paste0("data/clean-data/rsdata422_crt_", Sys.Date(), ".dta")),
          version = 14
)

# create workbook to write tables to Excel
wb <- openxlsx::createWorkbook()
openxlsx::addWorksheet(wb, sheet = "Information")
openxlsx::writeData(wb, sheet = "Information", x = "Tables in xlsx format for tables in DM report: CRT", rowNames = FALSE, keepNA = FALSE)
openxlsx::saveWorkbook(wb,
  file = here::here("output/tabs/tables.xlsx"),
  overwrite = TRUE
)
