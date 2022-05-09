# Goal: Network construction and module detection: Step-by-step network construction and module detection
# Input: gene expression (logCPM): total, top 40% variable
# Output: WGCNA modules
# Conclusion: 
# Author: Chia-Yi Cheng
# Last updated: 2022-03-09

# 0. Environment ----------------------------------------------------------------------------------------

library(WGCNA)

rm(list = setdiff(ls(), lsf.str()))
setwd("C:/Users/chiayi/Desktop/NutriNet/Arabidopsis/veg/WGCNA/young-all/202203/v1.topvargenes/")

# 1. Load Data ------------------------------------------------------------------------------------------

enableWGCNAThreads()

# Load the data saved in the first part
input = load(file = "./WGCNA.At-leaf-01-Expression-trait.RData")

# Choosing the soft-thresholding power:  analysis of network topology
# Choose a set of soft-thresholding powers
powers = c(c(1:15))
# Call the network topology analysis function
sft = pickSoftThreshold(ExpLeaf, powerVector = powers, verbose = 5)

# Plot the results:
#pdf("Plots/01-picfSoftThreshold.pdf",width=9,height=5)
par(mfrow = c(1,2))
cex1 = 0.9

# Scale-free topology fit index as a function of the soft-thresholding power
plot(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
     xlab="Soft Threshold (power)",ylab="Scale Free Topology Model Fit,signed R^2",type="n",
     main = paste("Scale independence"));
text(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
     labels=powers,cex=cex1,col="red");

# this line corresponds to using an R^2 cut-off of h
abline(h=0.80,col="blue")
# Mean connectivity as a function of the soft-thresholding power
plot(sft$fitIndices[,1], sft$fitIndices[,5],
     xlab="Soft Threshold (power)",ylab="Mean Connectivity", type="n",
     ylim=c(0,400),
     main = paste("Mean connectivity"))
text(sft$fitIndices[,1], sft$fitIndices[,5], labels=powers, cex=cex1,col="red")
dev.off()

# Co-expression similarity and adjacency
softPower = 6
adjacency = adjacency(ExpLeaf, power = softPower)

# Topological Overlap Matrix (TOM)
# Transform the adjacency into Topological Overlap Matrix,and calculate the corresponding dissimilarity
TOM = TOMsimilarity(adjacency)
dissTOM = 1-TOM

# Clustering using TOM
# Call the hierarchical clustering function
geneTree = hclust(as.dist(dissTOM), method = "average");

# Plot the resulting clustering tree (dendrogram)

pdf("Plots/02-dendrogram.pdf",width=12,height=9)
plot(geneTree, xlab="", sub="", main = "Gene clustering on TOM-based dissimilarity",
     labels = FALSE, hang = 0.04)
dev.off()

# We like large modules, so we set the minimum module size relatively high:
minModuleSize = 30
# Module identification using dynamic tree cut:
dynamicMods = cutreeDynamic(dendro = geneTree, distM = dissTOM,
                            deepSplit = 2, pamRespectsDendro = FALSE,
                            minClusterSize = minModuleSize)
# The function returned 22 modules labeled 1-22 largest to smallest.
# Label 0 is reserved for unassigned genes.
table(dynamicMods)

# Convert numeric lables into colors
dynamicColors = labels2colors(dynamicMods)
table(dynamicColors)
# Plot the dendrogram and colors underneath

pdf("Plots/03-dendrogram-colored.pdf",width=8,height=6)
plotDendroAndColors(geneTree, dynamicColors, "Dynamic Tree Cut",
                    dendroLabels = FALSE, hang = 0.03,
                    addGuide = TRUE, guideHang = 0.05,
                    main = "Gene dendrogram and module colors")
dev.off()

# 2.b.5    Merging of modules whose expression profiles are very similar

# Calculate eigengenes
MEList = moduleEigengenes(ExpLeaf, colors = dynamicColors)
MEs = MEList$eigengenes
# Calculate dissimilarity of module eigengenes
MEDiss = 1-cor(MEs)
table(MEDiss)

# Cluster module eigengenes
METree = hclust(as.dist(MEDiss), method = "average");

# Plot the result

pdf("Plots/04-cluster-eigengenes.pdf",width=7,height=6)
plot(METree, main = "Clustering of module eigengenes",
     xlab = "", sub = "")
MEDissThres = 0.2

# Plot the cut line into the dendrogram
abline(h=MEDissThres, col = "red")
dev.off()

# Call an automatic merging function
merge = mergeCloseModules(ExpLeaf, dynamicColors, 
                          cutHeight = MEDissThres, verbose = 3)
# The merged module colors
mergedColors = merge$colors
# Eigengenes of the new merged modules:
mergedMEs = merge$newMEs

pdf(file = "Plots/05-cluster-mergeded-module.pdf", wi = 12, he = 9)
plotDendroAndColors(geneTree, cbind(dynamicColors, mergedColors),
                    c("Dynamic Tree Cut", "Merged dynamic"),
                    dendroLabels = FALSE, hang = 0.03,
                    addGuide = TRUE, guideHang = 0.05)
dev.off()

# Rename to moduleColors
moduleColors = mergedColors
# Construct numerical labels corresponding to the colors
colorOrder = c("grey", standardColors(50));
moduleLabels = match(moduleColors, colorOrder)-1;
MEs = mergedMEs;

# Save module colors and labels for use in subsequent parts
save(MEs, moduleLabels, dynamicColors,
     moduleColors, geneTree, file = "WGCNA.At-leaf-02-power6merge08.RData")
