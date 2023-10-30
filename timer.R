# timer, som sourcer de tre filer med alternative scripts og timer dem. 

# running scripts in this r file
library(tweedie) 
library(ggplot2)
library(tictoc)
library(knitr)
library(tidyverse)

printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }


# experiment 1
tic("single CPU run of original script")
source("scripts/raw_r_file.R")
toc(log = TRUE)

#experiemnt 2
tic("parallel loop alternative 1")
source("scripts/alternative_2_parallel.R")
toc(log = TRUE)

#experiment 3
tic("parallel loop alternative 2")
source("scripts(alternative_3_parallel.R")


# for output
printTicTocLog() %>%
  knitr::kable()
