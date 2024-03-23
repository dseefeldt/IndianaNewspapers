library(tidyverse)

metadata <- read.csv(file = "IndianaNewspapersMasterMetadata.csv", header = TRUE)
metadata <- metadata %>% filter(Transcript == TRUE)

txt <- list.files(path = "txt/")
txt <- as.data.frame(txt)
txt$hasfile <- TRUE
txt <- txt %>% rename("Filename" = "txt")

test <- left_join(txt, metadata, by="Filename")
unique(test$Filename)
test$duplicate <- duplicated(test$Filename)