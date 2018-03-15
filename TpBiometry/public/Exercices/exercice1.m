    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %    TP 1 - Face recognition with eigenfaces - ImSec     %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 1 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
close all;
    
%% Part A : Computing the eigenspace A

addpath ../Matlab %Access to Matlab functions
train_A = loadImagesInDirectory('../Images/train_A/');
[Means, SpaceA, Eigenvalues] = buildSpace(train_A);
disp('Eigenspace A is build !')


%% Part B : Plotting the cumulative sum of eigenvalues     

figure('Name','Graph of the cumulated sum of Eigenvalues','NumberTitle','off')
CumulatedSum = cumsum(Eigenvalues);
plot(CumulatedSum)
xlabel('Number of eigenvalues')
ylabel('Cumulated sum')


%% Part C : Approximation of s1_1.jpg

figureHandle1 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,10);
figureHandle2 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,25);
figureHandle3 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,50);
figureHandle4 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,100);


%% Part D : Projecting and plotting in face space

model_projection = projectImages(train_A, Means, SpaceA);
FigureHandle5 = plotFirst3Coordinates(model_projection, 5, 5);

