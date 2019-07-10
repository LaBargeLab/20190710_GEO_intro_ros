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
