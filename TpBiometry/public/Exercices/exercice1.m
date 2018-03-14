%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TP 1 -- IMSECU Camille PLAYS & William CLOT %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%
%      Part A      %
%%%%%%%%%%%%%%%%%%%%

addpath ..\Matlab
train_A = loadImagesInDirectory('..\Images\train_A\');
[Means, SpaceA, Eigenvalues] = buildSpace(train_A);

%%%%%%%%%%%%%%%%%%%%
%      Part B      %
%%%%%%%%%%%%%%%%%%%%

Cumulated = cumsum(Eigenvalues);
plot(Cumulated)
xlabel('number of eigenvalues')
ylabel('cumulated sum')

%%%%%%%%%%%%%%%%%%%%
%      Part C      %
%%%%%%%%%%%%%%%%%%%%

figureHandle1 = approximateImage('..\Images\train_A\s1_1.jpg',Means,SpaceA,12);
figureHandle2 = approximateImage('..\Images\train_A\s1_1.jpg',Means,SpaceA,40);
figureHandle3 = approximateImage('..\Images\train_A\s1_1.jpg',Means,SpaceA,75);
figureHandle4 = approximateImage('..\Images\train_A\s1_1.jpg',Means,SpaceA,100);

%%%%%%%%%%
% Part D %
%%%%%%%%%%

Locations = projectImages(train_A, Means, SpaceA);
FigureHandle5 = plotFirst3Coordinates(Locations, 5, 5);

% COMMENTS :
% The plot shows us the projection of 5 faces 



