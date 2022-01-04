# Description: Simple R script taking in command line arguments 
#   and using glue and dplyr packages.
# Author: Haley Hunter-Zinck
# Date: 2021-02-03s

# setup  ---------------------------

library(optparse)
library(glue)
library(dplyr)

# user input ----------------------------

option_list <- list( 
  make_option(c("-m", "--message"), type = "character", default = "hello world!",
              help="Message to print"),
  make_option(c("-n", "--number"), type = "integer", default = 10,
              help="Number of rows to sample")
)
opt <- parse_args(OptionParser(option_list=option_list))

msg <- opt$message
num <- opt$number

# setup ----------------------------

tic = as.double(Sys.time())

# print message from argument
print(glue("Printing user-specified message: {msg}"))

# do dplyr operation
x <- data.frame(matrix(rnorm(num * 3), nrow = num, ncol = 3, dimnames = list(c(), c("A", "B", "C"))))
avg <- x %>% 
  filter(A > 0) %>%
  summarize(mean(A))
print(glue("Average of first column positive values computed via dplyr = {avg}"))

# close out ----------------------------

toc = as.double(Sys.time())
print(glue("Runtime: {round(toc - tic)} s"))

