library(BiocManager)
BiocManager::install("GEOquery")
BiocManager::install("affycoretools")
BiocManager::install("pd.hta.2.0")
BiocManager::install("reshape2 ")

###############################################
#################Load Data####################
##############################################

library(GEOquery)
gse <- getGEO("GSE102088")


# https://www.ncbi.nlm.nih.gov/geo/
# https://www.ncbi.nlm.nih.gov/geo/summary/
# Have a look at the deposition information
# https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE102088
# good place to find information about the used protocol/platform/technology
# Platforms (1)	
# GPL17586	[HTA-2_0] Affymetrix Human Transcriptome Array 2.0 [transcript (gene) version]

#  Samples (114) will you give you information about the specific samples used
## in this case we can get age information

sessionInfo()

class(gse)
#[1] "list"
# since it is a list we subset it to a ExpressionSet 

gse <- gse[[1]]

class(gse)

# [1] "ExpressionSet"
# attr(,"package")
# [1] "Biobase"

str(gse)
# phenoData gives you info about samples
# featureData: 
# annotation: 


phenoData(gse)

# An object of class 'AnnotatedDataFrame'
# sampleNames: GSM2723637 GSM2723638 ... GSM2723750 (114 total)
# varLabels: title geo_accession ... r

varMetadata(gse)

head(pData(gse)) #gives you the information in dataframe format 

str(pData(gse))

#
# 'data.frame':	114 obs. of  37 variables:
#   $ title                  : Factor w/ 114 levels "Human_normal_P1",..: 1 50 66 75 84 93 101 108 2 12 ...
# $ geo_accession          : chr  "GSM2723637" "GSM2723638" "GSM2723639" "GSM2723640" ...
# $ status                 : Factor w/ 1 level "Public on Aug 01 2017": 1 1 1 1 1 1 1 1 1 1 ...
# $ submission_date        : Factor w/ 1 level "Jul 31 2017": 1 1 1 1 1 1 1 1 1 1 ...
# $ last_update_date       : Factor w/ 1 level "Jan 23 2018": 1 1 1 1 1 1 1 1 1 1 ...
# $ type                   : Factor w/ 1 level "RNA": 1 1 1 1 1 1 1 1 1 1 ...
# $ channel_count          : Factor w/ 1 level "1": 1 1 1 1 1 1 1 1 1 1 ...
# $ source_name_ch1        : Factor w/ 1 level "Epithelial cells from normal breast tissue": 1 1 1 1 1 1 1 1 1 1 ...
# $ organism_ch1           : Factor w/ 1 level "Homo sapiens": 1 1 1 1 1 1 1 1 1 1 ...
# $ characteristics_ch1    : Factor w/ 45 levels "age: 17","age: 18",..: 21 15 14 39 25 2 15 17 20 10 ...
# $ characteristics_ch1.1  : Factor w/ 3 levels "race: black",..: 1 1 1 3 3 3 1 3 1 3 ...
# $ characteristics_ch1.2  : Factor w/ 96 levels "bmi: 20.59","bmi: 20.78",..: 90 74 64 40 35 36 49 63 79 62 ...
# $ molecule_ch1           : Factor w/ 1 level "total RNA": 1 1 1 1 1 1 1 1 1 1 ...
# $ extract_protocol_ch1   : Factor w/ 1 level "Total RNA was extracted using the TriplePure High Impact Zirconium beads and Rneasy Plus Mini kit according to "| __truncated__: 1 1 1 1 1 1 1 1 1 1 ...
# $ label_ch1              : Factor w/ 1 level "biotin": 1 1 1 1 1 1 1 1 1 1 ...
# $ label_protocol_ch1     : Factor w/ 1 level "5.5 ug of single stranded cDNA were enzymatically fragmented and biotinylated using the WT Terminal Labeling Kit (Affymetrix)": 1 1 1 1 1 1 1 1 1 1 ...
# $ taxid_ch1              : Factor w/ 1 level "9606": 1 1 1 1 1 1 1 1 1 1 ...
# $ hyb_protocol           : Factor w/ 1 level "Samples were hybridized using Herring sperm DNA, Acetylated BSA (50mg/mL), Eukaryotic Hybridization Controls (A"| __truncated__: 1 1 1 1 1 1 1 1 1 1 ...
# $ scan_protocol          : Factor w/ 1 level "Affymetrix Gene Chip Scanner 3000 7G using AGCC (Affymetrix GeneChip Command Console)": 1 1 1 1 1 1 1 1 1 1 ...
# $ description            : Factor w/ 1 level "Gene expression data": 1 1 1 1 1 1 1 1 1 1 ...
# $ data_processing        : Factor w/ 1 level "The data were analyzed with Expression Console using Affymetrix default analysis settings and GC-RMA as normalization method.": 1 1 1 1 1 1 1 1 1 1 ...
# $ platform_id            : Factor w/ 1 level "GPL17586": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_name           : Factor w/ 1 level "Daniel,Yui,Weng": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_email          : Factor w/ 1 level "daniel.weng@osumc.edu": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_phone          : Factor w/ 1 level "614-3664068": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_department     : Factor w/ 1 level "Comprehensive Cancer Center": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_institute      : Factor w/ 1 level "The Ohio State University": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_address        : Factor w/ 1 level "420 W. 12th Ave. Room 390": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_city           : Factor w/ 1 level "Columbus": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_state          : Factor w/ 1 level "OH": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_zip/postal_code: Factor w/ 1 level "43210": 1 1 1 1 1 1 1 1 1 1 ...
# $ contact_country        : Factor w/ 1 level "USA": 1 1 1 1 1 1 1 1 1 1 ...
# $ supplementary_file     : Factor w/ 114 levels "ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM2723nnn/GSM2723637/suppl/GSM2723637_1.CEL.gz",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ data_row_count         : Factor w/ 1 level "70523": 1 1 1 1 1 1 1 1 1 1 ...
# $ age:ch1                : chr  "37" "31" "30" "55" ...
# $ bmi:ch1                : chr  "39.93" "33.45" "31.01" "27.25" ...
# $ race:ch1               : chr  "black" "black" "black" "white" ...


sampleData <- pData(gse)[, c("age:ch1", "bmi:ch1", "race:ch1")] #subsetting columns we find interesting
colnames(sampleData) <- c("Age", "BMI", "Race")
str(sampleData)

# 'data.frame':	114 obs. of  3 variables:
#   $ Age : chr  "37" "31" "30" "55" ...
# $ BMI : chr  "39.93" "33.45" "31.01" "27.25" ...
# $ Race: chr  "black" "black" "black" "white" ...

sampleData$Age <- as.numeric(as.character(sampleData$Age))
sampleData$BMI <- as.numeric(as.character(sampleData$BMI))

hist(sampleData$Age)
hist(sampleData$BMI)

table(sampleData$Race)
#black other white 
#32     3    79 

which(is.na(sampleData$Age)) == T # check of we have samples without age information

sampleData$AgeGroup <- NA
sampleData[sampleData$Age <= 30,]$AgeGroup <- "Young"
sampleData[sampleData$Age > 30 & sampleData$Age <55, ]$AgeGroup <- "Middle-Age"
sampleData[sampleData$Age >= 55, ]$AgeGroup <- "Old"

table(sampleData$AgeGroup)
#Middle-Age        Old      Young 
#68         11         35 


########## Feature Data ##############

class(featureData(gse))

varLabels(gse)
featureNames(gse)
varMetadata(gse)

head(fData(gse))
tail(fData(gse))
class(fData(gse))

probeData <- fData(gse)
head(probeData)
table(probeData$gene_assignment)


######### Annotation
annotation(gse)
gpl.annot <- getGEO("GPL17586", AnnotGPL=TRUE) # this function will download the proper annotations
gpl.annot

# if(!file.exists('GEOmetadb.sqlite')) getSQLiteFile()
# file.info('GEOmetadb.sqlite')
# con <- dbConnect(SQLite(),'GEOmetadb.sqlite')
# dbGetQuery(con,"select gpl, title, bioc_package from gpl where gpl='GPL17586'")
# # gpl                                                                                title bioc_package
# # 1 GPL17586 [HTA-2_0] - Affymetrix GeneChip HTA-2_0 - Gene Level - HTA-2_0.r1.Psrs.mps probesets         <NA>
# dbDisconnect(con)

# https://bioconductor.org/packages/release/BiocViews.html#___AnnotationData
library(pd.hta.2.0)
library(affycoretools)
pd.hta.2.0

gse <- annotateEset(gse, pd.hta.2.0)

head(fData(gse))

probeData.annot <- fData(gse)
head(probeData.annot)
tail(probeData.annot)

probeData.annot <- fData(gse)
head(probeData.annot)
tail(probeData.annot)

#####################################################################
########## Expression Data ##########
#####################################################################

exprData <- exprs(gse)
class(exprData)

head(exprData)

str(exprData)
max(exprData)
min(exprData)
quartz()
boxplot(exprData, las=2)

# multiple probes could refer to the same gene
# we'll need to deal with that
# 

exprData <- as.data.frame(exprData)
exprData$PROBEID <- probeData.annot$PROBEID
exprData$ID <- probeData.annot$ID
exprData$SYMBOL <- probeData.annot$SYMBOL
exprData$GENENAME <- probeData.annot$GENENAME


#####################################################################
########## EXPRESSION DATA: GENE LEVEL ##########
#####################################################################

dim(exprData)
# Remove probes with no associated gene symbols 
exprData.filt <- exprData[!is.na(exprData$SYMBOL), ]
dim(exprData.filt)
head(exprData.filt)

length(unique(exprData.filt$PROBEID)) #mutliple IDs can map to differnt symbols
# [1] 42935
length(unique(exprData.filt$ID))
# [1] 39157
length(unique(exprData.filt$SYMBOL)) 
#[1] 33720
# so there are 9K events in which a symbols shows up more than once


# Calculate mean gene level data by ID?
# Calculate mean gene level data by SYMBOL?
# Take max gene level data by SYMBOL?
  # ros' prefers the last approach.
  # it will represent the dominant splice version
library(dplyr)
exprData.geneLevel <- exprData.filt %>% group_by(SYMBOL) %>% summarise_if(is.numeric, funs(max(., na.rm = TRUE)))
head(exprData.geneLevel)
exprData.geneLevel <- as.data.frame(exprData.geneLevel)
rownames(exprData.geneLevel) <- exprData.geneLevel$SYMBOL
exprData.geneLevel <- exprData.geneLevel[, -1]
dim(exprData.geneLevel)

exprData.geneLevel["ESR1",]

#####################################################################
########## GENE LEVEL CENTER SCALE ##########
#####################################################################

########### Center FUNCTION
mean.center.rows <- function(x){
  return(t(apply(x, 1, function(x) (x - mean(na.omit(x))))))
}
median.center.rows <- function(x){
  return(t(apply(x, 1, function(x) (x - median(na.omit(x))))))
}
########### Center Scale FUNCTION
mean.center.scale.rows <- function(x){
  return(t(apply(x, 1, function(x) (x - mean(na.omit(x)))/sd(na.omit(x)))))
}
median.center.scale.rows <- function(x){
  return(t(apply(x, 1, function(x) (x - median(na.omit(x)))/sd(na.omit(x)))))
}


exprData.geneLevel.MnCtrScl <- mean.center.scale.rows(exprData.geneLevel)


#####################################################################
########## EXTRACT GENE SETS ##########
#####################################################################

exprData.geneLevel.MnCtrScl["ESR1",]
exprData.geneLevel.MnCtrScl[c("ESR1", "PGR"),]

#####################################################################
########## EXTRACT & PLOT GENE SETS  ##########
#####################################################################
library(reshape2)
library(ggplot2)

ggplotData <- exprData.geneLevel.MnCtrScl[c("ESR1", "PGR"),]
ggplotData.melt <- melt(ggplotData)
colnames(ggplotData.melt) <- c("GeneSymbol", "SampleID", "log2Expr")

head(sampleData)
ggplotData.melt <- cbind.data.frame(ggplotData.melt,
                                    sampleData[ggplotData.melt$SampleID, ])
head(ggplotData.melt)
rownames(ggplotData.melt) <- NULL

ggplot(ggplotData.melt, aes(x=AgeGroup, y=log2Expr)) +
  geom_boxplot(aes(fill=AgeGroup)) +
  facet_wrap(~GeneSymbol)

ggplotData.melt$AgeGroup <- factor(ggplotData.melt$AgeGroup, levels=c("Young", "Middle-Age", "Old"))

ggplot(ggplotData.melt, aes(x=AgeGroup, y=log2Expr)) +
  geom_boxplot(aes(fill=AgeGroup)) +
  facet_wrap(~GeneSymbol)


#####################################################################
########## PCA ##########
#####################################################################

pcaData <- t(exprData.geneLevel.MnCtrScl)
res.pca <- prcomp(pcaData, center=F, scale=F)
pca.groups.AgeGroup <- sampleData$AgeGroup

# The variance retained by each principal component can be obtained as follow :
# Eigenvalues
eig <- (res.pca$sdev)^2
# Variances in percentage
variance <- eig*100/sum(eig)
# Cumulative variances
cumvar <- cumsum(variance)
eig.pca.expr <- data.frame(eig = eig, variance = variance,
                           cumvariance = cumvar)
head(eig.pca.expr)
# Use factoextra package to get eigen values
library(factoextra)

eig.val <- get_eigenvalue(res.pca)

str(res.pca)
head(res.pca$x)
ggplotData <- as.data.frame(res.pca$x)
ggplotData$AgeGroup <- sampleData$AgeGroup
ggplotData$AgeGroup <- factor(ggplotData$AgeGroup, levels=c("Young", "Middle-Age", "Old"))

ggplot(ggplotData, aes(PC1, PC2)) + 
  geom_point(aes(color=AgeGroup, shape=AgeGroup), size=3)



###############################################################################
########## SESSION INFO ##########
###############################################################################

sessionInfo()




