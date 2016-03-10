function MLR3DDWTRandomSampling(DataFile, timeofRepeatition)
% 
addpath('..\data\remoteData');
addpath('..\tools\libsvm-3.20\matlab');
addpath('.\MLR');
rawData = importdata(DataFile);% Load hyperspectral image and groud truth
if ndims(rawData) ~= 3 % save time
    return;
end
indexof_= find(DataFile == '_',1);
if isempty(indexof_)
    subfix = DataFile(1:end-4);
else
    subfix = DataFile(1:indexof_-1);
end
resultsFile = ['Jresults\', subfix, '_', mfilename, '.mat']; 
groundTruth = importdata([subfix, '_gt.mat']);
[m, n, b] = size(rawData); 
feats = single(dwt3d_feature(rawData));
vdataCube = reshape(feats,[m*n,15*b]);
vgroundTruth = reshape(groundTruth, [numel(groundTruth),1]);
numofClass = max(groundTruth(:));
trainingIndex = cell(numofClass,1);
testingIndex = cell(numofClass,1);
trainingSamples = cell(numofClass,1);
testingSamples = cell(numofClass,1);
trainingLabels = cell(numofClass,1);
testingLabels = cell(numofClass,1);
numofTest = zeros(numofClass,1);
sampleRateList = [0.05, 0.1, 0.25];
for repeat = 1:timeofRepeatition
for i = 1 : length(sampleRateList)
    sampleRate = sampleRateList(i);
    for c = 1: numofClass
        cc  = double(c);
        class = find(vgroundTruth == c);
        if isempty(class)
            continue;
        end
        perm = randperm(numel(class)); 
        breakpoint = round(numel(class)*sampleRate);
        trainingIndex{c} = class(perm(1:breakpoint));
        testingIndex{c} = class(perm(breakpoint+1:end));
        trainingSamples{c} = vdataCube(trainingIndex{c},:);
        trainingLabels{c} = ones(length(trainingIndex{c}),1)*cc;
        testingSamples{c} = vdataCube(testingIndex{c},:);
        testingLabels{c} = ones(length(testingIndex{c}),1)*cc;
        numofTest(c) = numel(testingIndex{c});
    end
    mtrainingData = cell2mat(trainingSamples);
    mtrainingLabels = cell2mat(trainingLabels);
    mtrainingIndex = cell2mat(trainingIndex);
    mtestingData = cell2mat(testingSamples);
    mtestingLabels = cell2mat(testingLabels);
    mtestingIndex = cell2mat(testingIndex); 
    trainingMap = zeros(m*n,1);
    trainingMap(mtrainingIndex) = mtrainingLabels;
    figure; imagesc(reshape(trainingMap,[m,n])); % check the training samples 
    mtrainingData = double(mtrainingData);
%   training 
    [dimen,num] = size(mtrainingData');
    K = [ones(1,num); mtrainingData'];
    y = mtrainingLabels';
    lambda = 0.1;
    [w, L] = LORSAL_GCK(K,y,lambda,400);
%   testing
    im = vdataCube';
    p = splitimage(im, w);
    [maxp, resultClass] = max(p);
    resultClass = resultClass';
    predicted_labels = resultClass(mtestingIndex, :);
    figure, imagesc(reshape(resultClass,[m,n]));
    results(i, repeat) = assessment(mtestingLabels, predicted_labels, 'class' ); % calculate OA, kappa, AA
end
end
save(resultsFile, 'results');
