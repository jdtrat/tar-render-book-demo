#' Target with Bookdown
#'
#' @family Literate programming targets
#' @description Shorthand to render a book via [bookdown::render_book] as part
#'   of a `targets` pipeline.
#' @details `tar_render_book()` is an alternative to `tar_target()` for
#'   Bookdown books that depend on other targets. The folder or files to be
#'   rendered via [bookdown::render_book] should mention dependency targets with
#'   `tar_load()` and `tar_read()` in the active code chunks
#'   (which also allows you to render the report
#'   outside the pipeline if the `_targets/` data store already exists).
#'   (Do not use `tar_load_raw()` or `tar_read_raw()` for this.)
#'   Then, `tar_render_book()` defines a special kind of target. It
#'     1. Finds all the `tar_load()`/`tar_read()` dependencies in any RMarkdown
#'        file within the bookdown directory or supplied files and inserts
#'        them into the target's command. This enforces the proper dependency relationships.
#'        (Do not use `tar_load_raw()` or `tar_read_raw()` for this.)
#'     2. Sets `format = "file"` (see `tar_target()`) so `targets` watches the files
#'         at the returned paths and reruns the report if those files change.
#'     3. Configures the target's command to return both the output
#'        report files and the input source directory/files. All these file paths
#'        are relative paths so the project stays portable.
#'     4. Forces the report to run in the user's current working directory
#'        instead of the working directory of the report.
#'     5. Sets convenient default options such as `deployment = "main"`
#'        in the target.
#' @return A target object with `format = "file"`. When this target runs, it
#'   returns a character vector of file paths: the rendered document, and the
#'   source directory/files. All returned paths are *relative* paths to ensure portability
#'   (so that the project can be moved from one file system to another
#'   without invalidating the target). See the "Target objects" section for background.
#' @inheritParams targets::tar_target
#' @inheritParams bookdown::render_book
#' @param path A character string representing a bookdown directory with an
#'   'index.Rmd' file or a character vector of files to be compiled via
#'   bookdown.
#' @param ... Named arguments to `bookdown::render_book()`.
#'   These arguments are evaluated when the target actually runs in
#'   `tar_make()`, not when the target is defined.
#' @export
#'
tar_render_book <- function(name,
                            path,
                            tidy_eval = targets::tar_option_get("tidy_eval"),
                            packages = targets::tar_option_get("packages"),
                            library = targets::tar_option_get("library"),
                            error = targets::tar_option_get("error"),
                            deployment = "main",
                            priority = targets::tar_option_get("priority"),
                            resources = targets::tar_option_get("resources"),
                            retrieval = targets::tar_option_get("retrieval"),
                            cue = targets::tar_option_get("cue"),
                            quiet = TRUE, ...) {

  targets::tar_assert_package("bookdown")
  targets::tar_assert_chr(path)
  targets::tar_assert_path(path)

  envir <- targets::tar_option_get("envir")

  args <- targets::tar_tidy_eval(substitute(list(...)), envir = envir,
                                 tidy_eval = tidy_eval)

  targets::tar_target_raw(
    name = targets::tar_deparse_language(substitute(name)),
    command = tar_render_book_command(path, args, quiet),
    packages = packages,
    library = library, format = "file", error = error, deployment = deployment,
    priority = priority, resources = resources, retrieval = retrieval,
    cue = cue
  )

}


