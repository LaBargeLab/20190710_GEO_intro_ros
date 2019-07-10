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
