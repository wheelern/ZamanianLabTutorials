test_that("theme_zlab works", {
  thm <- theme_zlab()
  expect_s3_class(thm, "theme")
  expect_is(thm, "theme")
  expect_equal(thm$text$family, "Helvetica")
})

test_that("transgenes_pal raises warning with number greater than colors available, x > 5", {
  expect_warning(transgenes_pal()(6))
})

test_that("scale_color_transgenes works", {
  scale <- scale_color_transgenes()
  expect_is(scale, "ScaleDiscrete")
})

test_that("scale_fill_transgenes works", {
  scale <- scale_fill_transgenes()
  expect_is(scale, "ScaleDiscrete")
})
