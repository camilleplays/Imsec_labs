    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                    TP 1 -- IMSECU                      %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 2 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%      Part A      
%%%%%%%%%%%%%%%%%%%%

test_A = loadImagesInDirectory('..\Images\test_A\');
test_projection = projectImages(test_A, Means, SpaceA);
FigureHandle6 = plotFirst3Coordinates(test_projection, 5, 5);


%      Part B      
%%%%%%%%%%%%%%%%%%%%

figureHandle7 = approximateImage('..\Images\test_A\s1_6.jpg',Means,SpaceA,10);


%      Part C      
%%%%%%%%%%%%%%%%%%%%

figure('Name','Graph of the cumulated sum of Eigenvalues','NumberTitle','off')
model_first = model_projection(1:5:end,:);
test_rate=zeros(1,100);

for i=1:100
    test_rate(i) = identify(model_first,test_projection,i,1);
end

plot(test_rate)
xlabel('number of eigenfaces')
ylabel('identification rate')

