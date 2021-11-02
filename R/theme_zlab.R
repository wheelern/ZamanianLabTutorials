#' Implement the base Zamanian Lab theme for ggplot2 plots
#'
#' @param base_size An integer.
#' @param base_family A font.
#'
#' @return
#' @export
#'
#' @example inst/examples/ex-theme_zlab.R
theme_zlab <- function(base_size = 16, base_family = "helvetica") {
  (ggthemes::theme_foundation(base_size = base_size, base_family = base_family) +
    ggplot2::theme_minimal(base_size = 16, base_family = "Helvetica") +
    ggplot2::theme(
      plot.title = ggplot2::element_text(size = 11, colour = "gray29", face = "bold", hjust = 0.5),
      # axes
      axis.text.x = ggplot2::element_text(face = "bold", size = 10, angle = 45, hjust = 1),
      axis.text.y = ggplot2::element_text(face = "bold", size = 10),
      axis.title.x = ggplot2::element_text(angle = 90, vjust = 0.5, size = 0),
      axis.title.y = ggplot2::element_text(face = "bold", angle = 90, size = 12),
      axis.ticks = ggplot2::element_line(size = 0.25),
      axis.line = ggplot2::element_line(size = 0.75, colour = "black"),

      # facets
      strip.text = ggplot2::element_text(face = "bold", size = 12),

      # panels
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),

      # legend
      legend.position = "none"
    ))
}

#' Nic's theme
#'
#' @param base_size An integer.
#' @param base_family A font
#'
#' @return
#' @export
#'
#' @example inst/examples/ex-theme_nw.R

theme_nw <- function(base_size = 16, base_family = "helvetica") {
  ggthemes::theme_foundation(base_size = base_size, base_family = base_family) +
    ggplot2::theme_minimal(base_size = 16, base_family = "Helvetica") +
    ggplot2::theme(

      # panels
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(size = 0.5),

      # axes
      axis.text.x = ggtext::element_markdown(size = 8, angle = 45, vjust = 1, hjust = 1),
      axis.text.y = ggtext::element_markdown(size = 8),
      axis.title.x = ggtext::element_markdown(face = "bold", size = 10),
      axis.title.y = ggtext::element_markdown(face = "bold", angle = 90, size = 10),

      # facets
      strip.text.x = ggtext::element_markdown(size = 8),
      strip.text.y = ggtext::element_markdown(size = 8),
      axis.line = element_line(size = 0.5, color = "black"),
      axis.ticks = element_line(size = 0.5, color = "black"),

      # legend
      legend.title = ggtext::element_markdown(face = "bold", size = 10),
      legend.text = ggtext::element_markdown(size = 8),
      legend.position = "right"
    )
}

#' Nic's second theme
#'
#' @param base_size An integer.
#' @param base_family A font.
#'
#' @return
#' @export
#'
#' @example inst/examples/ex-theme_nw2.R

theme_nw2 <- function(base_size = 16, base_family = "helvetica") {
  ggthemes::theme_foundation(base_size = base_size, base_family = base_family) +
    ggplot2::theme_minimal(base_size = 16, base_family = "Helvetica") +
    ggplot2::theme(

      # panels
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(size = 0.5),

      # axes
      axis.text.x = ggtext::element_markdown(face = 'plain', size = 8, angle = 45, vjust = 1, hjust = 1),
      axis.text.y = ggtext::element_markdown(face = 'plain', size = 8),
      axis.title.x = ggtext::element_markdown(face = "bold", size = 10),
      axis.title.y = ggtext::element_markdown(face = "bold", angle = 90, size = 10),

      # facets
      strip.text.x = ggtext::element_markdown(size = 10),
      strip.text.y = ggtext::element_markdown(size = 10),
      axis.line = element_line(size = 0.25, color = "black"),
      axis.ticks = element_line(size = 0.25, color = "black"),

      # legend
      legend.title = ggtext::element_markdown(face = "plain", size = 10),
      legend.text = ggtext::element_markdown(size = 8),
      legend.position = "bottom")

}


#' Function to quickly remove the legend
#'
#'
#' @return
#' @export
#'
remove_legend <- function() {
  theme(legend.position = "none")
}


#' Color palette for C. elegans tissue-specific transgenesis
#'
#'
#' @return
#' @export
#'
#' @example inst/examples/ex-theme_zlab.R
transgenes_pal <- function() {
  values <- c("#06438D", "#1ACFF5", "#B4559A", "#7FA951", "#C2663F")
  max_n <- length(values)
  f <- scales::manual_pal(values)
  attr(f, "max_n") <- max_n
  f
}

#' C. elegans tissue-specific transgenesis color scales
#'
#' @inheritParams ggplot2::scale_colour_hue
#'
#' @return
#' @export
#' @rdname scale_transgenes
#' @example inst/examples/ex-theme_zlab.R
scale_color_transgenes <- function(...) {
  ggplot2::discrete_scale("color", "transgenes", transgenes_pal(), ...)
}


#' @rdname scale_transgenes
#' @export
scale_colour_transgenes <- scale_color_transgenes

#' @rdname scale_transgenes
#' @export
scale_fill_transgenes <- function(...) {
  ggplot2::discrete_scale("fill", "transgenes", transgenes_pal(), ...)
}
