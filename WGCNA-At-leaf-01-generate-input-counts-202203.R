# Goal: Use Arabidopsis logCPM to constract WGCNA network
# Input: gene expression (logCPM): total
# Output: keep the genes with the top 40% variation
# Conclusion: 
# Author: Chia-Yi Cheng
# Last updated: 2022-04-21

# 0. Environment ----------------------------------------------------------------------------------------

library(WGCNA)

rm(list = setdiff(ls(), lsf.str())) #@ 清空 r studio 環境中的東西
setwd("C:/Users/chiayi/Desktop/NutriNet/Arabidopsis/veg/WGCNA/young-all/202203/")

# 1. Load and process the expression data ------------------------------------------------------------------------------------------

input<-read.table(file = "../../../edgeR/v1//NutriNet-At-young.edgeR_logcpm_v1.txt",header = T,check.names = F) #@ dataframe 
input[1:3,1:5] #@ str 看屬性

## Calculate and visualize the variation
input$variance = apply(input,1,var) #1=row,2=column #@ $ 都是抓 column header
plot(sort(input$variance,decreasing = T),cex=0.3) #@ cex 圈圈大小

## Keep the genes with the top ?% of variation
cutoff=0.4
keep <- input$variance >= sort(input$variance,decreasing = T)[round(cutoff*nrow(input))]
data <- input[keep,-c(ncol(input))] # delete the last column (variance) #@ iris mtcars ToothGrouth 可以玩的 dataframe

## Convert the input file to col=gene;row=line
ExpLeaf<-data.frame(t(data))

## Check for genes and samples with too many missing values:
gsg = goodSamplesGenes(ExpLeaf, verbose = 3)
gsg$allOK
sampleTree = hclust(dist(ExpLeaf), method = "average")

# Plot the sample tree: Open a graphic output window of size 12 by 9 inches
# The user should change the dimensions if the window is too large or too small.
sizeGrWindow(12,9)
#pdf(file = "Plots/sampleClustering.pdf", width = 12, height = 9);
par(cex = 0.6);
par(mar = c(0,4,2,0))
plot(sampleTree, main = "Arabidopsis leaf expression dendogram", sub="", xlab="", 
     cex.lab = 1.5, cex.axis = 1, cex.main = 2,cex=1.2)

# Getting rid of the outlier(s)
# Plot a line to show the cut
abline(h = 250, col = "red");

# Determine cluster under the line: Oy0_R3Y_H
clust = cutreeStatic(sampleTree, cutHeight = 250, minSize = 20)
table(clust)

# clust 1 contains the samples we want to keep.
keepSamples = (clust==1)
ExpLeaf = ExpLeaf[keepSamples, ]

nGenes = ncol(ExpLeaf)
nSamples = nrow(ExpLeaf)

# Load the trait data -------------------------------------------------
traitData = read.table("../../../growth/Harvest201612/NutriNet-At-veg.trait-lsmeans-202005.tsv", header = T, row.names = 1)
traitData[1:3,]

## Remove the outlier and match the row order
sampleKeep=match(rownames(ExpLeaf),rownames(traitData))
sampleKeep
traitData<-traitData[sampleKeep,]
collectGarbage()
dim(traitData)

## Visualize how the traits relate to the sample dendrogram
## Re-cluster samples
sampleTree2 = hclust(dist(ExpLeaf), method = "average")

## Convert traits to a color representation: 
## white means low, red means high, grey means missing entry
library(RColorBrewer)
colors <- brewer.pal(9, "Blues")
traitColors = numbers2colors(traitData, signed = FALSE,colors=colors)

## Plot the sample dendrogram and the colors underneath.
plotDendroAndColors(sampleTree2, traitColors,
                    groupLabels = names(traitData), 
                    cex.colorLabels = 1, cex.dendroLabels = 0.6, 
                    cex.rowText = 0.7, cex=1.1,cex.main=1.8,
                    main = "Arabidopsis leaf expression dendrogram and dry weight heatmap")

# Save the relevant expression and trait data ---------------------------------------------
save(ExpLeaf, traitData, file = "./v1.topvargenes/WGCNA.At-leaf-01-Expression-trait.RData")
