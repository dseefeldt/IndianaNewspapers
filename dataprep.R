library(tidyverse)

metadata <- read.csv(file = "IndianaNewspapersMasterMetadata.csv", header = TRUE)
metadata <- metadata %>% filter(Transcript == TRUE)



txt <- list.files(path = "txt/")
txt <- as.data.frame(txt)
txt$hasfile <- TRUE
txt <- txt %>% rename("Filename" = "txt")

Extrafiles <- txt %>% filter(!Filename %in% metadata$Filename)
Extrametadata <- metadata %>% filter(!Filename %in% txt$Filename)

metadata$duplicated <- duplicated(metadata$Filename)
dups <- metadata %>% filter(duplicated == TRUE)
