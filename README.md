# Dataset-for-SPX-Calibration-of-Option-Approximations-under-Rough-Heston-model
Raw data, analyzed data, and computed figures will be provided here

Programming Language: MATLAB

The data and code for SPX options on 18th June 2021 are from the following files:
1. spx_decomp.csv
2. spx_pade_data.csv
3. matlabplot.m

Remark 1 on "spx_decomp.csv":
The columns names in the csv file are missing, but they are \\
Column A: Maturity time T
Column B: Strike Price K
Column C: Bid Implied Volatility
Column D: Ask Implied Volatility
Column E: Mid Implied Volatility (mid of Bid and Ask Implied Volatility)
Column F: Implied volatility computed through the approximation formula of decomposition formula with parameters stated in the paper.


The data and code for SPX options on 12th and 15th September 2008 are from the following files:
1. spx_decomp_lehman912.csv
2. spx_decomp_lehman915.csv
3. spx_pade_data_lehman912.csv
4. spx_pade_data_lehman915.csv
5. matlabplot_lehman.m

Remark 2 on "spx_decomp_lehman912.csv" and "spx_decomp_lehman915.csv":
The columns names in the csv files are missing, they have the same column names as "spx_decomp.csv" (See Remark 1).
