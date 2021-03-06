


test.pubdev_1750 <- function() {
    foo <- as.h2o(iris)
    print(paste0("H2O's prod: ",as.character(prod(foo[1:2,1]))))
    print(paste0("R's prod: ",as.character(prod(iris[1:2,1]))))
    expect_equal(prod(foo[1:2,1]), prod(iris[1:2,1]))
}

doTest("PUBDEV-1750", test.pubdev_1750)
