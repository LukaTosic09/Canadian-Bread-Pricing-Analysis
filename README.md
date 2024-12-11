# Canadian Bread Pricing Analysis

## Overview

This repo provides the tools needed to recreate the analysis within. The analysis of bread item data from Project Hammer: https://jacobfilipp.com/hammer/

## Raw Data
*Important Note about Raw Data*
The raw data is not provided in the repo as it is beyond the regular file size limit for GitHub. However, it can be downloaded from the Project Hammer website using the "Get Full Data in 2 CSV Files" option.
Once downloaded, anyone attempting to reproduce the work done in this repo should store the two csvs hammer-4-raw.csv and hammer-4-product.csv in .../data/00-raw_data.
After that, consult 03-clean_data.R for the process of handling the data.

## File Structure

The repo is structured as:

-   `data/01-raw_data` contains nothing, see above.
-   `data/02-analysis_data` contains the cleaned datasets that were constructed for use in `06-model_data`.
-   `data/03-simulated_data` contains the simulated dataset created in `00-simulate_data`
-   `models` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the LLM, ChatGPT. All details of these interactions can be found as mentioned in File Structure.
