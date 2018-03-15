    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                    TP 1 -- IMSECU                      %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 4 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
   
    
%      Part A      
%%%%%%%%%%%%%%%%%%%%


train_B = loadImagesInDirectory('..\Images\train_B\');
projectionB_A = projectImages(train_B, Means, SpaceA);
FigureHandle8 = plotFirst3Coordinates(projectionB_A, 5, 5);

trainB_A_rate=zeros(1,100);

for i=1:100
    trainB_A_rate(i) = identify(model_projection,projectionB_A,i,1);
end

figure;
plot(trainB_A_rate)
xlabel('number of eigenfaces')
ylabel('identification rate B on SpaceA')

%      Part B      
%%%%%%%%%%%%%%%%%%%%


[MeansB, SpaceB, Eigenvalues] = buildSpace(train_B);
projectionB_B = projectImages(train_B, MeansB, SpaceB);

FigureHandle9 = plotFirst3Coordinates(projectionB_B, 5, 5);


trainB_B_rate=zeros(1,100);

for i=1:100
    trainB_B_rate(i) = identify(model_projection,projectionB_B,i,1);
end

figure;
plot(trainB_B_rate)
xlabel('number of eigenfaces')
ylabel('identification rate B on SpaceB')
