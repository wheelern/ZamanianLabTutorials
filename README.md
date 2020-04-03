# ZamanianLabREnvironment

## Installation
`devtools::install_github("wheelern/ZamanianLabREnvironment")`

## Usage

### Theme

    library(ggplot2)
    library(dplyr)
    library(shades)
    library("ZamanianLabREnvironment")

    data(aversion_data)

    rba <- ggplot(dplyr::filter(aversion_data, compound != "Glycerol"), aes(x = worm_strain, y = attempts)) +
      geom_hline(yintercept = 0, linetype = 2, size = 0.25, color = "grey") +
      geom_violin(aes(fill = worm_strain, color = worm_strain),
                  alpha = 0.6, size = 0.25, draw_quantiles = TRUE, scale = "width") +
      stat_summary(fun.data = "mean_cl_normal", color = "black", alpha = 0.9, size = 0.2) +
      facet_grid(rows = vars(compound), scales = "free") +
      scale_x_discrete(labels = c(
        "N2" = "N2",
        "VC657" = "gar-3(gk305)",
        "ZAM7" = "gar-3(gk305);\nsra-6p::Bma-gar-3"
      )) +
      scale_y_continuous(limits = c(0, 7), breaks = seq(0, 6, 2)) +
      lightness(scale_color_transgenes(), scalefac(0.35)) +
      scale_fill_transgenes() +
      labs(x = "", y = "Attempts Needed to Cross the Ligand") +
      theme_zlab() +
      theme(
        axis.text.x = element_text(face = "bold.italic", size = 7),
        axis.text.y = element_text(size = 7),
        axis.title.y = element_text(size = 8),
        strip.text.y = element_text(size = 8)
      ) +
      NULL

<img src="inst/img/aversion.png" width=300><br /><br />

### Run a tutorial
`library("ZamanianLabREnvironment")`  
`learnr::run_tutorial("basics", "ZamanianLabREnvironment")`

### Tutorial List
basics - a fly through of **everything**, from data import to data visualization.
