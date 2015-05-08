context("ed_search_adv")

a <- ed_search_adv(query = 'temperature')
b <- ed_search_adv(query = 'temperature', protocol = "griddap")
d <- ed_search_adv(query = 'temperature', protocol = "tabledap")
e <- ed_search_adv(maxLat = 63, minLon = -107, maxLon = -87, minLat = 50, protocol = "griddap")
f <- ed_search_adv(minTime = "2010-01-01T00:00:00Z", maxTime = "2010-02-01T00:00:00Z")

test_that("ed_search_adv returns the correct class", {
  expect_is(a, "ed_search_adv")
  expect_is(a$info, "data.frame")
  expect_is(a$alldata, "list")
  expect_true(any(vapply(a$alldata, "[[", "", "tabledap") == ""))
  expect_true(all(vapply(b$alldata, "[[", "", "tabledap") == ""))
  expect_true(all(vapply(d$alldata, "[[", "", "griddap") == ""))
  expect_is(e, "ed_search_adv")
  expect_is(f, "ed_search_adv")
})

test_that("ed_search_adv returns the correct dimensions", {
  expect_equal(length(a), 2)
  expect_equal(NCOL(a$info), 2)
  expect_equal(length(b), 2)
  expect_equal(NCOL(b$info), 2)
  expect_equal(length(d), 2)
  expect_equal(NCOL(d$info), 2)
  expect_equal(length(e), 2)
  expect_equal(NCOL(e$info), 2)
  expect_equal(length(f), 2)
  expect_equal(NCOL(f$info), 2)
})

test_that("ed_search_adv works with different ERDDAP servers", {
  h <- ed_search_adv(query = 'temperature', url = servers()$url[6])

  expect_is(h, "ed_search_adv")
  expect_is(h$info, "data.frame")
  expect_is(h$alldata, "list")
})

test_that("ed_search_adv fails well", {
  expect_error(ed_search_adv(), "Not Found")
  expect_error(ed_search_adv(maxLat = "adf"), "Not Found")
})