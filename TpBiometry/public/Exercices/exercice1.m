    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                    TP 1 -- IMSECU                      %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 1 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
%      Part A      
%%%%%%%%%%%%%%%%%%%%

addpath ../Matlab
train_A = loadImagesInDirectory('../Images/train_A/');
[Means, SpaceA, Eigenvalues] = buildSpace(train_A);


%      Part B      
%%%%%%%%%%%%%%%%%%%%

figure('Name','Graph of the cumulated sum of Eigenvalues','NumberTitle','off')
Cumulated = cumsum(Eigenvalues);
plot(Cumulated)
xlabel('Number of eigenvalues')
ylabel('Cumulated sum')


%      Part C      
%%%%%%%%%%%%%%%%%%%%

figureHandle1 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,12);
figureHandle2 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,40);
figureHandle3 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,75);
figureHandle4 = approximateImage('../Images/train_A/s1_1.jpg',Means,SpaceA,100);


%      Part D      
%%%%%%%%%%%%%%%%%%%%

model_projection = projectImages(train_A, Means, SpaceA);
FigureHandle5 = plotFirst3Coordinates(model_projection, 5, 5);




