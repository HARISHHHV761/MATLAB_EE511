clc; 
clear all; 
Mean = [0 4;4 0];
Sigma = cat(3,[1 0;0 1],[1 0;0 1]);
weights = [0.95,0.05];
Sample_Object = gmdistribution(Mean,Sigma,weights);
Sample_Generator_Matrix = random(Sample_Object,300);% Generate 300 samples from GMM distribution 

%-----Code to calculate PDF paramters through EM approach ----%
figure(1);
subplot(2,2,1);
hold on
opt = statset('Display','final');
Expectation_Max = gmdistribution.fit(Sample_Generator_Matrix,2,'Options',opt); % Uses EM approach to calculate the minimum number of iteration it takes to converge to two gaussin distributions
ezcontour(@(x,y)pdf(Expectation_Max,[x y]),[-4 8],[-4 8]);% Plots the contour plot of two cluster data points
title('Scatter plot after convergence'); xlabel('Range of X'); ylabel('Range of Y');
hold off

%---------- The 3D plot of the Gaussian distribution----------%
subplot(2,2,2);
pdf(Expectation_Max,Sample_Generator_Matrix);
ezsurf(@(x,y)pdf(Expectation_Max,[x y]),[-5 8],[-5 8])


