# author: Jimmy Liu and Hannah McSorley
# date: 03-06-2020

"This script will perform preliminary processing and filtering of 
adult income dataset (adult.data)

Usage: data_processing.R --input=</path/to/input_filename> --output=</path/to/output_filename>
" -> doc

# load library
suppressMessages(library(docopt))
suppressMessages(library(here))
suppressMessages(library(tidyverse))
suppressMessages(library(glue))

# parse arguments
opt <- docopt(doc)

# define main
main <- function(input_path) {
  
  # read input file
  print(glue("[",as.character(Sys.time()),"] Reading input file from: ", opt$input))
  dat <- read.csv(here(input_path), header = T)
  
  # rename columns
  names(dat) <- c("age", "workclass", "fnlwgt", "education", "education-num", "martial_status", 
                  "occupation", "relationship", "race", "sex", "capital-gain", "capital-loss", 
                  "hours-per-week", "native-country", "label")
  
  # remove rows that contain zeroes for both capital gain and loss and merge capital-gain and capital-loss into a single variable, net
  dat.filt <- dat %>% 
    filter(`capital-gain` != `capital-loss`) %>% 
    mutate(net = if_else(`capital-gain` == 0, 
                         as.numeric(`capital-loss`)*-1, # transform capital-loss to negative values 
                         as.numeric(`capital-gain`)))
  
  # remove leading white spaces
  dat.filt$race <- trimws(dat.filt$race)
  
  # convert race to a factor
  dat.filt$race <- factor(dat.filt$race, 
                          c("Other", "Asian-Pac-Islander", "Amer-Indian-Eskimo", "White", "Black"))
  
  # write out processed df as csv
  print(glue("[",as.character(Sys.time()),"] Finished processing file..."))
  print(glue("[",as.character(Sys.time()),"] Writing output to: ", opt$output))
  write.table(dat.filt, file = here(opt$output), 
              row.names = F, quote = F, sep = ",")
}

# call main
main(opt$input)
