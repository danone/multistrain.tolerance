# test figure qPCR tolerance

library(readr)
library(foreach)
library(momr)
library(reshape)
library(ggplot2)
library(plotly)
library(reshape2)
library(momr)
library(prettyR)
library(ggplot2)
library(reshape)
library(scales)
library(gridExtra)
library(sqldf)
require(grid)
library(Hmisc)
library(gplots)
library(vegan)
library(cowplot)
require(grid)
library(gridExtra)
library(gplots)
library(ggpubr)

install.packages("viridis") 
library(viridis)


data= read.csv2("~/actineo_paper/Tolerance_qPCR_Bilan_repro_version170804_final_modif260419.csv")

str(data)

df_metadata = data.frame(data[,c("Product","target", "Time.points",  "Mean")])
m.df_metadata = melt(df_metadata)


# ggboxplot(m.df_metadata, x = "Time.points", y = "value",
#               color="Product",
#               add = "jitter",
#               ylab ="log10 16S copies number per g of feces",
#               xlab = "Days",
#               ggtheme = theme_pubr()) +
#   theme(legend.position = 'bottom')+
#   scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="black", face="bold")) +
#   theme(strip.background = element_rect(colour="white", fill="white", linetype="solid"))+
# theme(axis.title.x = element_text(color="black", face="bold", size=13),
#       axis.title.y = element_text(color="black", size=13, face="bold"),
#       axis.text.y = element_text(color="black", size=10, face="bold"),
#       axis.text.x = element_text(color="black", size=10, face="bold"),
#       legend.text = element_text(color="black", size=10, face="bold"),
#       legend.title = element_text(color="black", size=13, face="bold")) 
# 
# 
# 
# ggboxplot(m.df_metadata, x = "Time.points", y = "value",
#               color="Product",
#               add = "jitter",
#               ylab ="log10 16S copies number per g of feces",
#               xlab = "Days",
#               ggtheme = theme_pubr()) +
#   theme(legend.position = 'bottom')+
#   scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=13, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) 



m.df_metadata  <- transform(m.df_metadata, target = factor(target, labels=c("Lactobacillus paracasei CNCM I-1518", "Lactobacillus paracasei CNCM I-3689", "Lactobacillus rhamnosus CNCM I-3690"), ordered =TRUE))

ggboxplot(m.df_metadata, x = "Time.points", y = "value",
          color="Product",
          add = "jitter",
          ylab ="log10 gene copies number/g feces",
          xlab = "Days",
          ggtheme = theme_pubr()) +
  theme(legend.position = 'bottom')+
  scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))



## les genes sont différents pour les 3 souches

library(wesanderson)

#DN_114001 = Lactobacillus paracasei CNCM I-1518

data= read.csv2("~/actineo_paper/Tolerance_qPCR_Bilan_repro_version170804_final_modif260419.csv")
data$target = as.character(data$target)
data_1518 = data %>% filter(target == "DN_114001")

df_data_1518 = data.frame(data_1518[,c("Product","target", "Time.points",  "Mean")])
m.df_data_1518 = melt(df_data_1518)
m.df_data_1518  <- transform(m.df_data_1518, target = factor(target, labels=c("Lactobacillus paracasei CNCM I-1518"), ordered =TRUE))


p1=
  ggboxplot(m.df_data_1518, x = "Time.points", y = "value",
          color="Product",
          fill="Product",
          alpha=0.5,
          add = "jitter",
          ylab ="log10 CRISPR gene copies number/g feces",
          xlab = "Days",
          palette=c("#66CCFF", "#3399FF", "#FF9999", "#FF0033"),
          ggtheme = theme_pubr()) +
  theme(legend.position = "right")+
  # scale_color_viridis(discrete = TRUE, option = "magma")+
  # scale_fill_viridis(discrete = TRUE, option = "magma") +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 



leg <- get_legend(p1)


p1bis=
  ggboxplot(m.df_data_1518, x = "Time.points", y = "value",
            color="Product",
            palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
            add = "jitter",
            ylab ="log10 CRISPR gene copies number/g feces",
            xlab = "Days",
            ggtheme = theme_pubr()) +
  theme(legend.position = 'bottom')+
  # scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 


p1_ggplot2=
  ggplot(m.df_data_1518, 
         aes(x=Time.points, y=value, fill=factor(Product))) + 
  geom_boxplot() +
  geom_point(position = position_jitterdodge(dodge.width = 0.75, jitter.width=0.2),cex=1) +
  scale_fill_manual(values=get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4))+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))  +
  labs(y="log10 Cro/CI family copies number/g feces") +
  labs(x="Days") +
  theme(legend.position="bottom") +
  facet_grid(~ target)


p1_ggplot2_viridis=
  ggplot(m.df_data_1518, 
         aes(x=Time.points, y=value, fill=factor(Product))) + 
  geom_boxplot() +
  scale_fill_viridis_d(option = "viridis")+
  geom_point(position = position_jitterdodge(dodge.width = 0.75, jitter.width=0.2),cex=1) +
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))  +
  labs(y="log10 Cro/CI family copies number/g feces") +
  labs(x="Days") +
  theme(legend.position="right") +
  facet_grid(~ target)




#DN_1140121 = Lactobacillus paracasei CNCM I-3689


data_3689 = data %>% filter(target == "DN_1140121")

df_data_3689 = data.frame(data_3689[,c("Product","target", "Time.points",  "Mean")])
m.df_data_3689 = melt(df_data_3689)
m.df_data_3689  <- transform(m.df_data_3689, target = factor(target, labels=c("Lactobacillus paracasei CNCM I-3689"), ordered =TRUE))

p2=
  ggboxplot(m.df_data_3689, x = "Time.points", y = "value",
            color="Product",
            fill="Product",
            alpha=0.5,
            add = "jitter",
            ylab ="log10 cas gene copies number/g feces",
            xlab = "Days",
            palette=c("#66CCFF", "#3399FF", "#FF9999", "#FF0033"),
            ggtheme = theme_pubr()) +
  theme(legend.position = 'none')+
  # scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 


p2bis=
  ggboxplot(m.df_data_3689, x = "Time.points", y = "value",
            color="Product",
            palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
            add = "jitter",
            ylab ="log10 cas gene copies number/g feces",
            xlab = "Days",
            ggtheme = theme_pubr()) +
  theme(legend.position = 'bottom')+
  # scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 


p2_ggplot2=
  ggplot(m.df_data_3689, 
         aes(x=Time.points, y=value, fill=factor(Product))) + 
  geom_boxplot() +
  geom_point(position = position_jitterdodge(dodge.width = 0.75, jitter.width=0.2),cex=1) +
  scale_fill_manual(values=get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4))+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))  +
  labs(y="log10 Cro/CI family copies number/g feces") +
  labs(x="Days") +
  theme(legend.position="bottom") +
  facet_grid(~ target)


p2_ggplot2_viridis=
  ggplot(m.df_data_3689, 
         aes(x=Time.points, y=value, fill=factor(Product))) + 
  geom_boxplot() +
  scale_fill_viridis_d(option = "viridis")+
  geom_point(position = position_jitterdodge(dodge.width = 0.75, jitter.width=0.2),cex=1) +
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))  +
  labs(y="log10 Cro/CI family copies number/g feces") +
  labs(x="Days") +
  theme(legend.position="none") +
  facet_grid(~ target)


#DN_1160010 = Lactobacillus rhamnosus CNCM I-3690

data_3690 = data %>% filter(target == "DN_1160010")

df_data_3690 = data.frame(data_3690[,c("Product","target", "Time.points",  "Mean")])
m.df_data_3690 = melt(df_data_3690)
m.df_data_3690  <- transform(m.df_data_3690, target = factor(target, labels=c("Lactobacillus rhamnosus CNCM I-3690"), ordered =TRUE))

p3=
  ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
            color="Product",
            fill="Product",
            alpha=0.5,
            add = "jitter",
            palette=c("#66CCFF", "#3399FF", "#FF9999", "#FF0033"),
            ylab ="log10 Cro/CI family copies number/g feces",
            xlab = "Days",
            ggtheme = theme_pubr()) +
  theme(legend.position = 'right')+
  # scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 


p3bis=
  ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
            color="Product",
            palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
            add = "jitter",
            ylab ="log10 Cro/CI family copies number/g feces",
            xlab = "Days",
            ggtheme = theme_pubr()) +
  theme(legend.position = 'bottom')+
  # scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 




geom_boxplot(m.df_data_3690, x = "Time.points", y = "value",
          color="Product",
          palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
          add = "jitter",
          ylab ="log10 Cro/CI family copies number/g feces",
          xlab = "Days") +
  theme(legend.position = 'bottom')+
  # scale_color_viridis(discrete = TRUE, option = "D")+
  # scale_fill_viridis(discrete = TRUE) +
  facet_grid(. ~ target)+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold")) 


p3_ggplot2=
  ggplot(m.df_data_3690, 
       aes(x=Time.points, y=value, fill=factor(Product))) + 
  geom_boxplot() +
  geom_point(position = position_jitterdodge(dodge.width = 0.75, jitter.width=0.2),cex=1) +
  scale_fill_manual(values=get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4))+
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))  +
  labs(y="log10 Cro/CI family copies number/g feces") +
  labs(x="Days") +
  theme(legend.position="bottom") +
  facet_grid(~ target)


p3_ggplot2_viridis=
  ggplot(m.df_data_3690, 
         aes(x=Time.points, y=value, fill=factor(Product))) + 
  geom_boxplot() +
  scale_fill_viridis_d(option = "viridis")+
  geom_point(position = position_jitterdodge(dodge.width = 0.75, jitter.width=0.2),cex=1) +
  theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
  theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
  theme(axis.title.x = element_text(color="black", face="bold", size=13),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        axis.text.y = element_text(color="black", size=10, face="bold"),
        axis.text.x = element_text(color="black", size=10, face="bold"),
        legend.text = element_text(color="black", size=10, face="bold"),
        legend.title = element_text(color="black", size=13, face="bold"))  +
  labs(y="log10 Cro/CI family copies number/g feces") +
  labs(x="Days") +
  theme(legend.position="right") +
  facet_grid(~ target)

# grid.arrange(p1,p2,p3, nrow=1, ncol=3)

leg <- get_legend(p1)
p1 <- p1 + theme(legend.position = "none")
p2 <- p2 + theme(legend.position = "none")
p3 <- p3 + theme(legend.position = "none")

plot_grid(p1,p2,p3,leg, align = "h", axis="t",nrow=1, ncol=4)


leg <- get_legend(p1_ggplot2_viridis)
p1_ggplot2_viridis <- p1_ggplot2_viridis + theme(legend.position = "none")
p2_ggplot2_viridis <- p2_ggplot2_viridis + theme(legend.position = "none")
p3_ggplot2_viridis <- p3_ggplot2_viridis + theme(legend.position = "none")

plot_grid(p1_ggplot2_viridis,p2_ggplot2_viridis,p3_ggplot2_viridis, leg, align = "h", axis="t", nrow=1, ncol=4)



# plot_grid(p1,NULL,p2)
# avec cette fonction study_design <- png::readPNG("design_richness.png")

# study_design <- png::readPNG("design_richness.png")
# study_design_grob1 <- grid::rasterGrob(study_design)
# cowplot::plot_grid(
#   study_design_grob1, 
#   pB_diet)


# 
# p3_dark=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days",
#             ggtheme = theme_dark()) +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="black", fill="black", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) 
# 
# 
# 
# 
# p3_blue=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days") +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="skyblue3", fill="skyblue3", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) +
# theme(panel.background = element_rect(fill = "lightblue",
#                                   colour = "lightblue",
#                                   size = 0.5, linetype = "solid"))
# 
# 
# p3_blue=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = get_palette(c("#00AFBB", "#E7B800", "#FC4E07"), 4),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days") +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="skyblue3", fill="skyblue3", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) +
#   theme(panel.background = element_rect(fill = "lightblue",
#                                         colour = "lightblue",
#                                         size = 0.5, linetype = "solid"))
# 
# 
# 
# 
# 
# p3_blue_gray=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = c("#CCCCCC", "#999999", "#666666", "#333333"),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days") +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="skyblue3", fill="skyblue3", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) +
#   theme(panel.background = element_rect(fill = "lightblue",
#                                         colour = "lightblue",
#                                         size = 0.5, linetype = "solid"))
# 
# 
# 
# p3_gray=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = c("#CCCCCC", "#999999", "#666666", "#333333"),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days") +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) +
#   theme(panel.background = element_rect(fill = "white",
#                                         colour = "white",
#                                         size = 0.5, linetype = "solid"))
# 
# p3_violet=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = c("#99CCFF", "#6699CC", "#CC99FF", "#660099"),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days") +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="white", fill="gray48", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) +
#   theme(panel.background = element_rect(fill = "white",
#                                         colour = "white",
#                                         size = 0.5, linetype = "solid"))
# 
# 
# p3_blue_black=
#   ggboxplot(m.df_data_3690, x = "Time.points", y = "value",
#             color="Product",
#             palette = c("#000000", "#000000", "#000000", "#000000"),
#             add = "jitter",
#             ylab ="log10 Cro/CI family copies number/g feces",
#             xlab = "Days") +
#   theme(legend.position = 'bottom')+
#   # scale_color_viridis(discrete = TRUE, option = "D")+
#   # scale_fill_viridis(discrete = TRUE) +
#   facet_grid(. ~ target)+
#   theme(strip.text.x = element_text(size=13, color="white", face="bold")) +
#   theme(strip.background = element_rect(colour="skyblue3", fill="skyblue3", linetype="solid"))+
#   theme(axis.title.x = element_text(color="black", face="bold", size=13),
#         axis.title.y = element_text(color="black", size=12, face="bold"),
#         axis.text.y = element_text(color="black", size=10, face="bold"),
#         axis.text.x = element_text(color="black", size=10, face="bold"),
#         legend.text = element_text(color="black", size=10, face="bold"),
#         legend.title = element_text(color="black", size=13, face="bold")) +
#   theme(panel.background = element_rect(fill = "lightblue",
#                                         colour = "lightblue",
#                                         size = 0.5, linetype = "solid"))
