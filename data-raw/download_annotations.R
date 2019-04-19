
## CAZY

url_cazy="\"https://danone-my.sharepoint.com/:t:/p/julien_tap/EZgtu8WiG65BvKhTgoumaN8B_ogN8_JFXzwe7yWYEAg91g?e=iVXKPg&download=1\""


#download.file(url_cazy,destfile = "data-raw/cazy.txt")


system(paste("wget",url_cazy, "-O data-raw/annotations/cazy.txt"), show.output.on.console = FALSE)


## KEGG

url_KEGG="\"https://danone-my.sharepoint.com/:t:/p/julien_tap/EQSWhTN-LzNBowGOtIc5jNcB1uaPAoInUZUYWU35u_SzHQ?e=qu5Pje&download=1\""


system(paste("wget",url_KEGG, "-O data-raw/annotations/KEGG.txt"), ignore.stdout = TRUE, ignore.stderr = TRUE, wait = FALSE)



## eggNOG


url_eggnog = "\"https://danone-my.sharepoint.com/:t:/p/julien_tap/EXZnBV51L2dPiQrz1d23cTsBtBzju3ubxMfzm7sL1QtmCA?e=OECwwZ&download=1\""

system(paste("wget",url_eggnog, "-O data-raw/annotations/OG.txt"), ignore.stdout = TRUE, ignore.stderr = TRUE, wait = FALSE)


system("cut -f 1,10,13 data-raw/annotations/OG.txt > data-raw/annotations/OG_select.txt")






