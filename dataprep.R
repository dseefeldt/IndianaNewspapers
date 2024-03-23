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

write.csv(Extrametadata, file="metadata-nomatchingfiles.csv")
write.csv(Extrafiles, file="Files-NoMetadata.csv")
write.csv(dups, file="duplicated-metadata.csv")
write.csv(metadata, file="IndianaNewspapersMasterMetadata.csv")
