library("VennDiagram")
library("eulerr")

venn_data <- read.csv("venn_data4.csv",
             header = TRUE,
             sep = ";",
             dec = ".")

SDHB_p <- as.character(venn_data[1:15,1])
HCCA_p <- as.character(venn_data[1:13,2])
DAN_p  <- as.character(venn_data[1:12,3])
AA_n   <- as.character(venn_data[1:14,4])
HCCA_n <- as.character(venn_data[1:10,5])
DAN_n  <- as.character(venn_data[1:7 ,6])

color1 = c("#ce1256", "#df65b0", "#d7b5d8", "#0570b0", "#74a9cf", "#bdc9e1")
color2 = c("#a50f15", "#fb6a4a", "#fcbba1", "#08519c", "#6baed6", "#c6dbef")

# all matrices
plot(euler(setNames(list(SDHB_p,
                         HCCA_p,
                         DAN_p,
                         AA_n,
                         HCCA_n,
                         DAN_n),
                    c("SDHB +",
                      "HCCA +",
                      "DAN +",
                      "9AA -",
                      "HCCA -",
                      "DAN -"))),
     counts = TRUE,
     fill = color1,
     quantities = FALSE,
     legend = TRUE)

# positive mode
plot(euler(setNames(list(SDHB_p,
                         HCCA_p,
                         DAN_p),
                    c("SDHB +",
                      "HCCA +",
                      "DAN +"))),
     counts = TRUE,
     fill = c("red", "blue", "green"),
     quantities = FALSE,
     legend = TRUE)

# negative mode
plot(euler(setNames(list(AA_n,
                         HCCA_n,
                         DAN_n),
                    c("9AA -",
                      "HCCA -",
                      "DAN -"))),
     counts = TRUE,
     fill = c("red", "blue", "green"),
     quantities = FALSE,
     legend = TRUE)
