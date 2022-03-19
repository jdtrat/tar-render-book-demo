
# Find dependencies in all RMarkdown documents that will be rendered in
# bookdown.
tar_bookdown_deps <- function(path) {

  if (fs::is_dir(path)) {
    do.call(c,
            lapply(
              fs::dir_ls(path, regexp = "Rmd$"),
              function(file) {
                tarchetypes::tar_knitr_deps(file)
              }
            )
    )
  } else {
    do.call(c,
            lapply(
              path,
              tarchetypes::tar_knitr_deps(file)
            )
    )
  }
}

# From tarchetypes:::`%|||%`

`%|||%` <- function(x, y) {
  if (is.null(x)) {
    y
  }
  else {
    x
  }
}

# Adapted from tarchetypes:::tar_render_command
tar_render_book_command <- function(path, args, quiet) {
  args$input <- path
  args$knit_root_dir <- quote(getwd())
  args$quiet <- quiet
  deps <- tarchetypes:::call_list(tarchetypes:::as_symbols(
    tar_bookdown_deps(path)
  )
  )
  fun <- as.symbol("tar_render_book_run")
  exprs <- list(fun, path = path, args = args, deps = deps)
  as.expression(as.call(exprs))
}

# From tarchetypes:::tar_render_run
tar_render_book_run <- function (path, args, deps)
{
  targets::tar_assert_package("bookdown")
  withr::local_options(list(crayon.enabled = NULL))
  envir <- parent.frame()
  args$envir <- args$envir %|||% targets::tar_envir(default = envir)
  force(args$envir)
  output <- do.call(bookdown::render_book, args)
  tar_render_paths(output, path)
}

# From tarchetypes:::tar_render_paths
tar_render_paths <- function (output, source)
{
  output <- fs::path_rel(output)
  source <- fs::path_rel(source)
  files <- paste0(fs::path_ext_remove(output), "_files")
  files <- targets:::if_any(all(file.exists(files)), files, character(0))
  c(output, source, files)
}
