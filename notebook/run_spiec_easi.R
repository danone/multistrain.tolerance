library(dplyr)
library(SpiecEasi)
devtools::load_all(reset = FALSE)

data("MSP_abundance_matrix_rounded")


MSP_abundance_matrix_rounded %>%
  tibble::rownames_to_column("msp") %>%
  mutate_if(is.numeric, function(x) x/sum(x)) %>%
  tibble::column_to_rownames("msp") %>%
  BiotypeR::noise.removal(percent=1) %>% rownames() -> msp_select

msp_select = union(msp_select,c("msp_lrhamnosus","msp_1025"))


MSP_abundance_matrix_rounded[msp_select,] %>% t %>%
  spiec.easi(., method='mb', lambda.min.ratio=1e-2,
             nlambda=20, pulsar.params=list(rep.num=20, ncores=32)) -> MSP_spiec_easi
