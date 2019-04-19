library(readr)
library(dplyr)


## CAZY

cazy=readr::read_tsv("data-raw/annotations/cazy.txt",col_names = FALSE )

cazy %>%
  select(1,3) %>%
  rename(cazy_family="X1",gene_name="X3") %>%
  mutate(cazy_family = cazy_family %>% gsub(".hmm","",.)) -> cazy

usethis::use_data(cazy, overwrite = TRUE)


## KEGG

kegg=readr::read_tsv("data-raw/annotations/KEGG.txt",col_names = FALSE )


kegg %>%
  rename(gene_name="X1",KO="X2") -> kegg

usethis::use_data(kegg, overwrite = TRUE)




## OG

og=readr::read_tsv("data-raw/annotations/OG_select.txt",col_names = FALSE )


og %>%
  rename(gene_name="X1",OG="X2",OG_annot="X3") -> og

usethis::use_data(og, overwrite = TRUE)







## MSP tax



MSP_tax = readxl::read_excel("data-raw/msp2018_tolerance/MSP_taxonomy.xlsx", sheet=4)


MSP_tax %>%
  rename(MSP_ID = "...1") %>%
  select(MSP_ID,species,genus,family,order,class,phylum,superkingdom) -> MSP_tax

usethis::use_data(MSP_tax, overwrite=TRUE)


















