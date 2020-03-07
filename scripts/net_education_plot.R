# author: Jimmy Liu and Hannah McSorley
# date: 03-06-2020

"This script will generate a boxplot that describes the distribution of annual net gain across education levels from the processed data file as input.

Usage: net_education_plot.R --input=</path/to/input_filename> --output=</path/to/output_filename.png>
" -> doc

# load library
suppressMessages(library(tidyverse))
suppressMessages(library(here))
suppressMessages(library(glue))
suppressMessages(library(docopt))

# parse arguements
opt <- docopt(doc)

# define main
main <- function(input_path) {
  # read input file
  print(glue("[",as.character(Sys.time()),"] Reading input file from: ", opt$input))
  dat <- read.csv(here(input_path), header = T, check.names = F)
  
  # generate boxplot
  print(glue("[",as.character(Sys.time()),"] Generating plot..."))
  p <- dat %>% 
    ggplot(aes(x = education, y = net)) +
    geom_boxplot() +
    coord_flip() +
    scale_y_continuous(labels = scales::dollar_format()) +
    theme_bw(12) +
    labs(x = "Education attainment level",
         y = "Annual net gain",
         title = "Relationship between education attainment and annual net gain")
  
  # export plot as png
  print(glue("[",as.character(Sys.time()),"] Exporting plot image to: ", opt$output))
  suppressMessages(ggsave(here(opt$output), p))
}

# call main
main(opt$input)