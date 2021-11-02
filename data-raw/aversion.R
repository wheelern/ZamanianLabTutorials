library(readr)
library(dplyr)
library(janitor)

# Test data - Kendra's ring-based aversion assay --------------------------

aversion_data <- read_csv("~/Box/ZamanianLab/Data/Ce_assays/Ringaversion/Bm-GAR-3/Data/ringbasedaversion.csv",
  col_names = TRUE
) %>%
  clean_names() %>%
  bind_rows(read_csv("~/Box/ZamanianLab/Data/Ce_assays/Ringaversion/Bm-GAR-3/Data/ringbasedaversion_oxo.csv",
    col_names = TRUE
  ) %>%
    clean_names()) %>%
  mutate(compound = fct_relevel(compound, "Water", "Glycerol", "Fructose", "Acetylcholine", "Oxotremorine")) %>%
  mutate(worm_strain = factor(worm_strain))

write_csv(aversion_data, "data-raw/aversion_data.csv")
usethis::use_data(aversion_data, overwrite = TRUE, compress = "bzip2")
