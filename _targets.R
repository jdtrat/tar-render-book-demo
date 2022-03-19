library(targets)

source("R/utils-tar-render-book.R")
source("R/tar-render-book.R")

summ <- function(dataset) {
  dplyr::summarize(dataset, mean_x = mean(x))
}

# Set target-specific options such as packages.
tar_option_set(packages = "dplyr")

# End this file with a list of target objects.
list(
  tar_target(data, data.frame(x = sample.int(100), y = sample.int(100))),
  tar_target(summary, summ(data)),
  tar_render_book(
    demo_book,
    path = "demo-book",
    # Will create bs4_book and pdf_book
    output_format = c(
      "bookdown::bs4_book",
      "bookdown::pdf_book"
    )
  )
)
