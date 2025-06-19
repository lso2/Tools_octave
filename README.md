# DCE_octave Package

[![Octave](https://img.shields.io/badge/Octave-10.1.0+-blue.svg)](https://octave.org/)
[![License](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

This repository contains Octave-compatible modifications of the original Tools repo for DCE (Discrete Choice Experiments) toolbox by Professor Mikolaj Czajkowski from the University of Warsaw.

## About the Original DCE Toolbox

**Original Author**: Mikolaj Czajkowski, Professor  
**Institution**: University of Warsaw, Faculty of Economic Sciences  
**Website**: http://czaj.org/#  
**Original Repository**: https://github.com/czaj/dce

This is a package of MATLAB/Octave scripts and functions that allow for the estimation of models for Discrete Choice Experiments (i.e., conditional multinomial logit models). 

## Tested On
- GNU Octave 10.1.0+ - fixes for matrix operations
  - Fixed dimension handling for empty scale variables
  - Fixed matrix multiplication conformability issues
  - Compatible with Octave's parallel computing
  
### Included Models
- Multinomial (conditional) Logit (MNL)
- Mixed (random parameters) Logit (MXL)
- Generalized Multinomial Logit Model (GMXL)
- Latent Class (LC)
- Latent Class Mixed Logit (LCMXL)
- Multiple Indicators Multiple Causes (MIMIC)
- Hybrid Multinomial Logit (HMNL)
- Hybrid Mixed Logit (HMXL)
- Hybrid Latent Class (HLC)

### Features
The models are estimated using the maximum likelihood method and work with the following specifications:
- Preference or WTP space
- Multiple distribution types (for random parameters)
- Non-linear transformations of explanatory variables
- Covariates of means, scale, and scale variance (where applicable)
- Impose equality restrictions or constraints
- Flexible data types (panel structure, non-constant number of choice tasks or alternatives per respondent, and missing data)
- Various estimation and numerical optimization algorithms and options
- Parallel computing support

## Purpose of This Fork
This fork provides compatibility modifications to run the DCE toolbox in GNU Octave instead of MATLAB. All core functionality and algorithms remain unchanged from the original implementation.

## Requirements

### Octave Packages
The following Octave packages must be installed before using this toolbox:

```octave
pkg install -forge statistics
pkg install -forge tablicious  
pkg install -forge stk
pkg install -forge optim

pkg load statistics
pkg load tablicious
pkg load stk
pkg load optim
```

### Recommended Startup Configuration
Add these lines to your Octave startup file (`~/.octaverc`):
```octave
pkg load statistics
pkg load tablicious
pkg load stk
pkg load optim
```

## Compatibility Changes Made

### 1. Statistical Functions
- Replaced `icdf('Normal', x, 0, 1)` calls with `norminv(double(x))` across multiple files
- Files modified: `MXL.m`, `GMXL.m`, `LCMXL.m`, `MIMIC.m`, `generateRandomDraws.m`, `MXL2.m`, `HLC.m`, `HMNL.m`, `HMNL2.m`, `HMXL.m`, `HMXL2.m`

### 2. Table Functions
- Fixed `array2table` compatibility issues by installing the `tablicious` package
- Resolved `tblish.internal.peelOffNameValueOptions` dependency

### 3. Sobol Sequence Generation
- Fixed `stk_sampling_sobol` function availability by installing the `stk` package

### 4. Data Type Compatibility
- Added `double()` type casting for statistical function inputs to resolve `erfcinv: not defined for class` errors

## Usage
After installing the required packages, the DCE toolbox functions should work identically to the original MATLAB version:

```octave
% Load your data
EstimOpt.DataFile = 'your_data.mat';
DATA = load(EstimOpt.DataFile);

% Run DCE analysis
Results.MNL = MNL(INPUT, Results, EstimOpt, OptimOpt);
Results.MXL = MXL(INPUT, Results, EstimOpt, OptimOpt);
% ... etc
```

## Tested Models
The following models have been verified to work in Octave:
- MNL (Multinomial Logit)
- MXL (Mixed Logit) 
- GMXL (Generalized Mixed Logit)
- And other models in the original toolbox

## Notes
- This is a compatibility fork only - no changes were made to the underlying econometric methods or algorithms
- All estimation results should be identical to the original MATLAB implementation
- Performance may differ between MATLAB and Octave

## Citation and License
The original codes are published under a Creative Commons Attribution 4.0 License. When using this toolbox, please cite the original work by Professor Czajkowski and acknowledge the source. For specific citation formats, refer to http://czaj.org/research.

## Acknowledgments
We gratefully acknowledge the help of (in alphabetical order and in addition to registered GitHub contributors): Danny Campbell, Richard Carson, Marek Giergiczny, William Greene, Arnie Hole, Klaus Moeltner, Nada Wasi, Maciej Wilamowski, and Kenneth Train, whose examples, comments or suggestions were followed when working on the original codes.

## Contributing
For issues related to the original DCE methodology or core functionality, please contact the original author. For Octave-specific compatibility issues, please open an issue in this repository.

## License
This fork maintains the same license terms as the original work (CC BY 4.0).