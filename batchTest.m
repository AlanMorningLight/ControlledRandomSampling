%run different methods on batch datasets with two sampling strategy
% to avoid out of memory problem, please increase the virtual memory
close all, 
clear, 
% batchRun('..\data\remoteData', '*.mat', @(x)RFCSpectralFeatureRandomSampling(x,10));
% clear, clc, close all;
% batchRun('..\data\remoteData', '*.mat', @(x)RFCSpectralFeatureRegionSampling(x,10));
% clear, clc, close all;
% batchRun('..\data\remoteData', '*.mat', @(x)RFC3DDWTRandomSampling(x,10));
RFC3DDWTRandomSampling('Salinas_corrected.mat', 10);
clear, clc, close all;
batchRun('..\data\remoteData', '*.mat', @(x)RFC3DDWTRegionSampling(x,10));
clear, clc, close all;
batchRun('..\data\remoteData', '*.mat', @(x)RFCMorphologyRandomSampling(x,10));
clear, clc, close all;
batchRun('..\data\remoteData', '*.mat', @(x)RFCMorphologyRegionSampling(x,10));
clear, clc, close all;
% myCluster = parcluster('local');
% myCluster.NumWorkers = 6;
% saveProfile(myCluster);
% numWorkers = matlabpool('size');
% isPoolOpen = (numWorkers > 0);
% if(~isPoolOpen)
%     matlabpool;
% end
% LinearSVMSpectralFeatureRandomSamplingFullMap('Indian_pines_corrected.mat', 1);
% LinearSVMSpectralFeatureRegionSamplingFullMap('Indian_pines_corrected.mat', 1);
% LinearSVMSpectralFeatureRandomSamplingFullMap('PaviaU.mat', 1);
% LinearSVMSpectralFeatureRegionSamplingFullMap('PaviaU.mat', 1);
% testAccurancyWithMeanfilterRegionSampling_Weka2
% testAccurancyWithMeanfilterRegionSampling_Weka4
% testAccurancyWithMeanfilterRandomSampling_Weka2
% testAccurancyWithMeanfilterRandomSampling_Weka4

% testAccurancyWithandWithoutOverlap_fixedSamples


% testAccurancyWithGaussianFilterRegionSampling_Weka
% testAccurancyWithMeanfilterRegionSampling_Weka
% testAccurancyWithMeanfilterRandomSampling_Weka
% testAccurancyWithGaussianFilterRandomSampling_Weka

% testAccurancyWithGaussianFilterRegionSampling
% testAccurancyWithMeanfilterRegionSampling
% testAccurancyWithMeanfilterRandomSampling
% testAccurancyWithGaussianFilterRandomSampling


% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMSpectralFeatureRandomSampling(x, 10));


% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMSpectralFeatureRandomSampling(x, 1));
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMSpectralFeatureRegionSampling(x, 1));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMSpectralFeatureRandomSampling(x, 10));


% NonlinearSVMSpectralFeatureRandomSampling('Salinas_corrected.mat', 5);
% NonlinearSVMSpectralFeatureRandomSampling('PaviaU.mat', 5);
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMSpectralFeatureRegionSampling(x, 10));

% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMMorphologyRandomSampling(x,1));
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMMorphologyRegionSampling(x,1));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMMorphologyRandomSampling(x,10));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMMorphologyRegionSampling(x,10));

% batch('..\data\remote sensing data', '*_gt.mat', @(x)KNNSpatialFeatureRandomSampling(x,10));
% batch('..\data\remote sensing data', '*_gt.mat', @(x)NonlinearSVMSpatialFeatureRandomSampling(x,10));
% 
% 
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMSpectralFeatureRandomSampling(x, 10));
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMSpectralFeatureRegionSampling(x, 10));
% 
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMMorphologyRandomSampling(x,10));
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMMorphologyRegionSampling(x,10));
% 
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVM3DDWTRandomSampling(x,10));
% batch('..\data\remote sensing data', '*.mat', @(x)LinearSVM3DDWTRegionSampling(x,10));
% 
% testAccurancyWithMeanfilterRandomSampling;
% testAccurancyWithMeanfilterRegionSampling