


test.rdoc_download_all_logs.golden <- function() {

h2o.downloadAllLogs(dirname = sandbox(), filename = "h2o_logs.log")

}

doTest("R Doc Download Logs", test.rdoc_download_all_logs.golden)

