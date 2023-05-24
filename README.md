# Advanced Photonics: Computational Analysis and Effective Index Modeling of Multilayer Waveguides

### EE 587 students:
Design a waveguide structure that consists of at least 4 layers using materials other than GaAs/AlGaAs. The waveguide should achieve confinement for both x- and y-direction for a wavelength of your choice. It does not need to be a ridge waveguide. Draw your waveguide structure and include the refractive indices of the materials. Write a program to solve the effective index of the waveguide and plot the electric field profile in both x- and y-distribution.


### EE 587 Introduction to Photonics Project: Waveguide Effective Index Analysis
This project deals with the computational analysis of a layered waveguide structure. In this waveguide, different layers are made up of Air, Silicon cladding, and a Silicon Germanium film. The overall goal of the project is to calculate the waveguide's effective index in different segments and analyze the E-field distribution in both the X and Y axes.

### Project Structure
This repository contains the MATLAB script used to perform the computations, along with a comprehensive report on the project, detailing the methods used and results obtained.

### Files included in this repository
1. waveguide_analysis.m: MATLAB script that calculates the effective index of the waveguide at different points and plots the E-field distribution in both the X and Y axes.
2. Report.pdf: Detailed report explaining the project, the methods used for the calculations, and the results obtained.


### How to Run the Code
To run the code, follow these steps:

1. Clone this repository to your local machine.
Open MATLAB.
2. Navigate to the cloned repository in the MATLAB environment.
3. Open and run the waveguide_analysis.m script.
4. The script will output the effective index calculations and generate plots for the E-field distribution in the X and Y axes.

### About the Code
The MATLAB script waveguide_analysis.m contains the implementation of the dispersion equation for effective index calculation. The script is divided into several sections:

*  Calculation of the effective index in the central part of the waveguide (N-effective of Central Part).
*  Calculation of the effective index at the boundary of the waveguide (N-effective of Boundary).
*  Calculation of the effective index of the overall waveguide (N-effective of Overall Waveguide).
*  Calculation of the total field confinement in X and Y axes.
*  Plotting of the E-field distribution in the X and Y axes.
