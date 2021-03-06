#----------------------------------------------------------------------
# Purpose:  This tests PCA on a large dataset.
#----------------------------------------------------------------------




#----------------------------------------------------------------------
# Parameters for the test.
#----------------------------------------------------------------------

# Check if we are running inside the H2O network by seeing if we can touch
# the namenode.
hadoop_namenode_is_accessible = hadoop.namenode.is.accessible()

if (hadoop_namenode_is_accessible) {
  hdfs_name_node = hadoop.namenode()
  hdfs_cross_file = "/datasets/runit/BigCross.data"
} else {
  stop("Not running on H2O internal network. No access to HDFS.")
}

#----------------------------------------------------------------------

heading("BEGIN TEST")
check.pca_large <- function() {

  #----------------------------------------------------------------------
  # Single file cases.
  #----------------------------------------------------------------------

  heading("Import BigCross.data from HDFS")
  url <- sprintf("hdfs://%s%s", hdfs_name_node, hdfs_cross_file)
  cross.hex <- h2o.importFile(url)
  n <- nrow(cross.hex)
  print(paste("Imported n =", n, "rows"))

  heading("Running PCA on BigCross.data")
  cross.pca = h2o.prcomp(training_frame = cross.hex, k = 25, max_iterations = 1000)
  print(cross.pca@model$eigenvectors)
  print(cross.pca@model$importance)


  
}

doTest("PCA test", check.pca_large)
