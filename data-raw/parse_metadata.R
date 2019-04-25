
metadata=readr::read_tsv("data-raw/mapping_metadata.txt")

metadata %>%
  select(4,6,7,9,10,11,12) %>%
  mutate(samplenr = samplenr %>% as.character()) %>%
  mutate(Subject = Subject %>% as.character()) -> sample_metadata

usethis::use_data(sample_metadata, overwrite = TRUE)
