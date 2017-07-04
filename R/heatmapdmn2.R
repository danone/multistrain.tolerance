heatmapdmn2 =
function (count, fit1, fitN, ntaxa = 30, ..., transform = sqrt,
          lblwidth = 0.2 * nrow(count), col = heat.colors(256), marges = c(1, 0, 1, 0))
{
  p1 <- fitted(fit1, scale = TRUE)
  pN <- fitted(fitN, scale = TRUE)
  diff <- rowSums(abs(pN - as.vector(p1)))
  taxa <- rev(head(order(diff, decreasing = TRUE), ntaxa))
  pN <- pN[taxa, ]
  cl <- mixture(fitN, assign = TRUE)
  ncl <- length(unique(cl))
  nms <- names(cl)
  grp <- factor(cl, levels = as.character(seq(1, ncl)))
  idx <- split(nms, grp)
  mwd <- 0.15 * length(cl)/ncl
  wd <- c(unlist(Map(c, lapply(idx, length), mwd), use.names = FALSE),
          lblwidth)
  layout(matrix(seq(1, 2 * ncl + 1), nrow = 1), widths = wd)
  op <- par(no.readonly = TRUE)
  on.exit(par(op), add = TRUE)
  par(mar = marges)
  for (i in seq_along(idx)) {
    image(transform(count[idx[[i]], taxa, drop = FALSE]),
          col = col, xaxt = "n", yaxt = "n")
    image(t(transform(pN[, i, drop = FALSE])), col = col,
          xaxt = "n", yaxt = "n")
  }
  xat <- (seq_len(nrow(pN)) - 1)/(nrow(pN) - 1)
  axis(4, xat, labels = rownames(pN) %>% stringr::str_split("; ", simplify=TRUE) %>% .[,6], las = 1)
}

