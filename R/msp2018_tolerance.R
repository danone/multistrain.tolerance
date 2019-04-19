library(readr)
library(foreach)
library(doMC)
registerDoMC(detectCores())


ac_lifeseq = read_tsv('msp2018_tolerance/Lifeseq_non-redundant_augmented-catalog.fasta.clstr.txt')

msp2018 = read_tsv("msp2018_tolerance/IGC.1661MSP.tsv")

# msp_name module_name gene_id                                          gene_name
# <chr>       <chr>   <int>                                              <chr>
#   1 msp_0001        core   49726 159268001-stool1_revised_scaffold2795_1_gene123456
# 2 msp_0001        core  596352 159268001-stool2_revised_scaffold25897_1_gene17563
# 3 msp_0001        core   26489 159268001-stool2_revised_scaffold29829_1_gene14363
# 4 msp_0001        core  957615      764487809-stool2_revised_C884597_1_gene165835
# 5 msp_0001        core   22751  764487809-stool2_revised_scaffold5776_3_gene12972
# 6 msp_0001        core   84076 159268001-stool1_revised_scaffold47312_1_gene55062

head(ac_lifeseq)
ac_lifeseq$id = gsub("\\|MetaHIT", "",ac_lifeseq$id)

msp2018$clstr=ac_lifeseq$clstr[match(msp2018$gene_name, ac_lifeseq$id)]
head(msp2018)

ac_lifeseq=subset(ac_lifeseq, clstr_rep==1)

msp2018$gene_name=ac_lifeseq$id[match(msp2018$clstr,ac_lifeseq$clstr)]

msp2018=msp2018[,-5]

genes_metadata = read_tsv('msp2018_tolerance/Lifeseq_non-redundant_augmented-catalog_lite.genes_length.tsv')

msp2018$gene_length=genes_metadata$gene_length[match(msp2018$gene_name,genes_metadata$gene_name)]
msp2018$gene_id=match(msp2018$gene_name,genes_metadata$gene_name)
head(msp2018)
msp2018_tolerance_catalog_table = msp2018
save(msp2018_tolerance_catalog_table, file="msp2018_tolerance_catalog_table.rda")

head(msp2018_tolerance_catalog_table)

msp2018=subset(msp2018, module_name=='core')
msp2018core_tolerance_catalog_table = msp2018
save(msp2018core_tolerance_catalog_table, file="msp2018core_tolerance_catalog_table.rda")

msps2018_names=unique(msp2018$msp_name)

msp2018_list=foreach(cur_msp_name=msps2018_names) %dopar%
{
  as.character(subset(msp2018, msp_name==cur_msp_name)$gene_id)
  #subset(msp, msp_name==cur_msp_name)$gene_name
}
names(msp2018_list)=msps2018_names
msp2018_tolerance_catalog = msp2018_list
save(msp2018_tolerance_catalog, file="msp2018_tolerance_catalog_list.rda")

head(msp2018_tolerance_catalog)
