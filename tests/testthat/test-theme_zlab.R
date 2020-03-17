test_that("theme_zlab works", {
  thm <- theme_zlab()
  expect_s3_class(thm, "theme")
  expect_is(thm, "theme")
  expect_equal(thm$text$family, "Helvetica")
})

test_that("transgenes_pal raises warning with number greater than colors available, x > 10", {
  expect_warning(transgenes_pal()(6))
})
