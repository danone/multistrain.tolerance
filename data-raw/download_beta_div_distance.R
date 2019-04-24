
UNIFRAC_URL = "https://danone-my.sharepoint.com/:t:/p/julien_tap/EZNaXeo4pOlHgpDejJ5LZdYBrFt2uQrrffDn_qwEGR0Xrg?download=1"


system(paste("wget", UWUNIFRAC_URL, "-O inst/distance/weighted_unifrac_dm.txt"), ignore.stdout = TRUE, ignore.stderr = TRUE, wait = FALSE)

