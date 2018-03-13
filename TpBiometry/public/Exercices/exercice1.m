%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TP 1 -- IMSECU Camille PLAYS & William CLOT %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%      Part A      %
%%%%%%%%%%%%%%%%%%%%

addpath \\datas\teaching\courses\image\Tpbiometry\public\Matlab
train_A = loadImagesInDirectory('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\');
[Means, SpaceA, Eigenvalues] = buildSpace(train_A);

% what is the mawimum size of the eigenspace ie how many directions of
% variability can we estimate?

%there are as many directions as there are eigenvalues: 100


%%%%%%%%%%%%%%%%%%%%
%      Part B      %
%%%%%%%%%%%%%%%%%%%%
Cumulated = cumsum(Eigenvalues);
plot(Cumulated);

%as it is cumulative, the curve is growing. However, as we add eigenvalues,
%they contain less and less information. This is why the curve is similar 
%to a logarithmic function.

%%%%%%%%%%%%%%%%%%%%
%      Part C      %
%%%%%%%%%%%%%%%%%%%%

figureHandle1 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,12);
figureHandle2 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,40);
figureHandle3 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,75);
figureHandle4 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,100);

% CAN WE REBUILD IT PERFECTLY ?
% Yes we can rebuild nearly perfectly the image using all the EigenValues,
% since we have all the informations that we need in all of the
% eigenvalues.

%%%%%%%%%%
% Part D %
%%%%%%%%%%

Locations = projectImages(train_A, Means, SpaceA);
FigureHandle5 = plotFirst3Coordinates(Locations, 5, 5);

% COMMENTS :
% The plot shows us the projection of 5 faces 



