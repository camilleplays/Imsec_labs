    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %    TP 1 - Face recognition with eigenfaces - ImSec     %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 1 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% REMINDER : PLEASE EXECUTE exercice1.m BEFORE EXECUTING THIS FILE

close all;

%% Part A : Projecting and plotting Test A in Space A

test_A = loadImagesInDirectory('../Images/test_A/');
test_projection = projectImages(test_A, Means, SpaceA);
FigureHandle6 = plotFirst3Coordinates(test_projection, 5, 5);


%% Part B : Approximating s1_6.jpg

figureHandle7 = approximateImage('../Images/test_A/s1_6.jpg',Means,SpaceA,10);


%% Part C : Computing identification rates (first face)

figure('Name','Identification rate with first face','NumberTitle','off')
model_first = model_projection(1:5:end,:); %Tacking only the first face of the models
firstface_rate=zeros(1,100);

for i=1:100 %Computing the identification rates
    firstface_rate(i) = identify(model_first,test_projection,i,1);
end

[firstface_max, firstface_index] = max(firstface_rate);
x=[firstface_index,firstface_index];
y=[0,firstface_max];

plot(firstface_rate)
xlabel('Number of eigenfaces')
ylabel('Identification rate')

hold on %Adding the maximum value
plot(x,y);
hold off


%% Part D : More identification with mean faces

figure('Name','Identification rate with mean faces','NumberTitle','off')

model_average = zeros(1,20);
mean_rate=zeros(1,100);

for i = 0:19
    for j = 1:100
        model_average(i+1,j) = (model_projection(5*i+1,j)+model_projection(5*i+2,j)+model_projection(5*i+3,j)+model_projection(5*i+4,j)+model_projection(5*i+5,j))/5;
    end
end

for i=1:100
    mean_rate(i) = identify(model_average,test_projection,i,1);
end

[meanface_max, meanface_index] = max(mean_rate);
x=[meanface_index,meanface_index];
y=[0,meanface_max];

plot(mean_rate);
xlabel('number of eigenfaces')
ylabel('identification rate (mean faces)')
hold on
plot(x,y);
hold off

%% Part E : Drawing indentification rates as a function of N-Best

figure('Name','Identification as function of N','NumberTitle','off')

Nbest_rate=zeros(1,5);

for i=1:20
    Nbest_rate(i) = identify(model_average,test_projection,5,i);
end

[Nbest_max, Nbest_index] = max(Nbest_rate);
x=[Nbest_index,Nbest_index];
y=[Nbest_rate(1),Nbest_max];

plot(Nbest_rate);
xlabel('N')
ylabel('best identification rate')

hold on
plot(x,y);
hold off



