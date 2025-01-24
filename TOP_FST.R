library(tidyverse)
library(readr)

out_windowed_weir1k <- read_delim("~/R Projects/out.windowed.weir1k.fst",  # Loads Fst scores from the NENT/LAB analysis from vcftools
                                      delim = "\t", escape_double = FALSE, 
                                      trim_ws = TRUE)


out_windowed_weirODN <- read_delim("~/R Projects/out.windowed.weirODN.fst", # Loads Fst scores from ODN/LAB analysis from vcftools
                                    delim = "\t", escape_double = FALSE, 
                                     trim_ws = TRUE)


candidate_selective_sweep_regions_ODN <- out_windowed_weirODN %>%   #Arranges Fst scores by top 1 % highest scoring loci for ODN
  top_n(26, out_windowed_weirODN$MEAN_FST) %>%                           
  arrange(MEAN_FST)

candidate_selective_sweep_regions_NENT <- out_windowed_weir1k %>%  #Arranges Fst score by top 1% highest scoring locit for NENT
  top_n(26, out_windowed_weir1k$MEAN_FST) %>%
  arrange(MEAN_FST)
  
write_tsv(candidate_selective_sweep_regions_ODN, file = "FSTODN.txt") #Saves Arranged datasets into txt file

write_tsv(candidate_selective_sweep_regions_NENT, file = "FSTNENT.txt")