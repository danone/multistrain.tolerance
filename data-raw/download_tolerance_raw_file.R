
# generate link file to OneDrive and download using wget or download.file()

url1="\"https://danone-my.sharepoint.com/:u:/p/julien_tap/ERsg8WjaviRFhcAbClUwVRcBWSF7gcANqwCTDcb3i72TmQ?e=qIisWR&download=1\""

system(paste("wget",url1, "-O data-raw/msp2018_tolerance/Lifeseq_non-redundant_augmented-catalog_lite.genes_length.tsv"), show.output.on.console = FALSE, wait = FALSE)


url2="\"https://danone-my.sharepoint.com/:t:/p/julien_tap/ETSGzBPmV41AkNPYCEFAqh4BuZB4EsKQDuSAwatfmJb_vQ?e=BapaHS&download=1\""

system(paste("wget",url2, "-O data-raw/msp2018_tolerance/Lifeseq_non-redundant_augmented-catalog.fasta.clstr"), show.output.on.console = FALSE, wait = FALSE)


url3="\"https://danone-my.sharepoint.com/:u:/p/julien_tap/EcHWJcIz909Ppu0fR5cEyKoBL-vAol3h_Gni8tNDMWSjgA?e=DdCLAf&download=1\""

system(paste("wget",url3, "-O data-raw/msp2018_tolerance/IGC.1661MSP.tsv"), show.output.on.console = FALSE, wait = FALSE)

url4="\"https://danone-my.sharepoint.com/:t:/p/julien_tap/EWm7fIWD-zhGovAFyv7lzF8BWP2h-LrIk6rZOmJpC_7z6w?e=9bNUgX&download=1\""
system(paste("wget",url4, "-O data-raw/mapping_metadata.txt"))
