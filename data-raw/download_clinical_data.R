# download clinical data



url_clinical_data="https://danone-my.sharepoint.com/:u:/p/julien_tap/EQxKDIPuFTlDn4V3XtWhV9wBD9i58g4w1fhRCmL3mX5pIA?e=z0oUCH&download=1"
download.file(url_clinical_data, destfile="inst/sas/lab.sas7bdat")

url_clinical_data_sas="https://danone-my.sharepoint.com/:u:/p/julien_tap/EaUTIDZeW0BOsR4jCyozZFYB_U01l-8KWK-bRVFJyFhrWA?e=bMIslC&download=1"

download.file(url_clinical_data_sas, destfile="inst/sas/formats.sas7bdat")



library(haven)
clinical = read_sas("inst/sas/labbecker20101014.sas7bdat")

library(reshape2)
library(dplyr)

clinical=
  clinical %>%
    select(SUBJID,VISIT,SAMPLID,LBSTRESN1,LBTEST) %>%
    group_by(SUBJID,VISIT,SAMPLID,LBTEST) %>%
    summarise(LBSTRESN1=mean(LBSTRESN1)) %>%
    dcast(SUBJID+VISIT+SAMPLID~LBTEST)


devtools::use_data(clinical)



