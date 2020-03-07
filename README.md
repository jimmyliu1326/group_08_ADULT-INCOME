## Group 08 Team Project

__Adult Income and Personal Attributes__

This repo is for UBC STAT 547 Group project for Group-8, The team members are Jimmy Liu and Hannah McSorley. 
The dataset we're working with is adult income data from the 1994 US Census Bureau available through University California Irvine Machine Learning Repository (https://archive.ics.uci.edu/ml/datasets/adult).

## Milestones and Releases
This repo will evolve with project milestones throughout the course (until April 8, 2020) and each milestone submission will be a tagged release.

Each Project Milestone can be viewed as a _GitHub Page_ here:
  * Milestone 1: https://stat547-ubc-2019-20.github.io/group_08_ADULT-INCOME/docs/milestone01.html
  * Milestone 2:
  
## Scripts Usage

1. __Clone this repository__

2. __Check the follow R libraries are installed:__
   * tidyverse
   * here
   * glue
   * docopt

3. __Run the scripts under ```scripts/``` in the following order via command-line__
   a. _Download raw data_

   b. _Process raw data_
      ```
      data_processing.R --input data/adult.data --output data/adult.data.processed
      ```
   c. _Visualize processed data_
      * Net gain vs education boxplot
        ```
        net_education_plot.R --input data/adult.data.processed --output images/net_education_plot.png
        ```
      * Net gain vs work hours per week boxplot
        ```
        net_work_hours_plot.R --input data/adult.data.processed --output images/net_work_hours_plot.png
        ```
