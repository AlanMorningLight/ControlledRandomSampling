%run different methods on batch datasets with two sampling strategy
% to avoid out of memory problem, please increase the virtual memory
close all, 
clear, 
myCluster = parcluster('local');
myCluster.NumWorkers = 4;
saveProfile(myCluster);
numWorkers = matlabpool('size');
isPoolOpen = (numWorkers > 0);
if(~isPoolOpen)
    matlabpool;
end
batch('..\data\remote sensing data', '*_gt.mat', @(x)NonlinearSVMSpatialFeatureRandomSampling(x,10));


 batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMSpectralFeatureRandomSampling(x, 10));
 batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMSpectralFeatureRegionSampling(x, 10));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMSpectralFeatureRandomSampling(x, 1));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMSpectralFeatureRegionSampling(x, 1));

 batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMMorphologyRandomSampling(x,10));
 batch('..\data\remote sensing data', '*.mat', @(x)LinearSVMMorphologyRegionSampling(x,10));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMMorphologyRandomSampling(x,1));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVMMorphologyRegionSampling(x,1));

 batch('..\data\remote sensing data', '*.mat', @(x)LinearSVM3DDWTRandomSampling(x,10));
 batch('..\data\remote sensing data', '*.mat', @(x)LinearSVM3DDWTRegionSampling(x,10));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVM3DDWTRandomSampling(x,1));
% batch('..\data\remote sensing data', '*.mat', @(x)NonlinearSVM3DDWTRegionSampling(x,1));

 

