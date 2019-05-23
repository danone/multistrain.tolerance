
UWUNIFRAC_URL = "https://danone-my.sharepoint.com/:t:/p/julien_tap/EZUxLx7z8FZMp01pGysk4w4BNosuP7d_iGG_e9BonpxOUg?download=1"


system(paste("wget", UWUNIFRAC_URL, "-O inst/distance/unweighted_unifrac_dm.txt"), ignore.stdout = TRUE, ignore.stderr = TRUE, wait = FALSE)



WUNIFRAC_URL = "https://danone-my.sharepoint.com/:t:/p/julien_tap/EZNaXeo4pOlHgpDejJ5LZdYBdHX_E-nLS4fIfCEHtkHDGQ?download=1"



system(paste("wget", WUNIFRAC_URL, "-O inst/distance/weighted_unifrac_dm.txt"), ignore.stdout = TRUE, ignore.stderr = TRUE, wait = FALSE)
