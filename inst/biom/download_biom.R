

#download BIOM file

url_biom="https://danone-my.sharepoint.com/:u:/p/julien_tap/EbOvQaDjWa1KmEBURwc1odIBc0fqzmxdP2E_ClCz8ZOifg?e=P0rL2D&download=1"
download.file(url_biom, destfile="inst/biom/tolerance.biom")



url_biom = "\"https://danone-my.sharepoint.com/:u:/p/julien_tap/EbOvQaDjWa1KmEBURwc1odIBc0fqzmxdP2E_ClCz8ZOifg?e=P0rL2D&download=1\""

system(paste("wget",url_biom, "-O inst/biom/tolerance.biom"))
