library(dplyr)

# metadata=readr::read_tsv("data-raw/mapping_metadata.txt")
#
# metadata %>%
#   select(4,6,7,9,10,11,12) %>%
#   mutate(samplenr = samplenr %>% as.character()) %>%
#   mutate(Subject = Subject %>% as.character()) -> sample_metadata


readxl::read_xlsx("data-raw/qPCR/Tolérance_qPCR_Bilan repro_version170804_final.xlsx") %>%
  select(visit,target,Moyenne,Groupe) %>%
  mutate(Moyenne = ifelse(Moyenne %in%  grep("<",Moyenne,value = TRUE),NA,Moyenne )    ) %>%
  mutate(Moyenne = as.numeric(Moyenne)) %>%
  dplyr::rename(Mean="Moyenne", Group="Groupe") -> qPCR

usethis::use_data(qPCR)
