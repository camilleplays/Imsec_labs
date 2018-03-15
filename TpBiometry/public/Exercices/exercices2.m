%%%%%%%%%%%%%%%%%%%%
%      Part A      %
%%%%%%%%%%%%%%%%%%%%

addpath ..\Matlab
test_A = loadImagesInDirectory('..\Images\test_A\');
test_projection = projectImages(test_A, Means, SpaceA);
%FigureHandle6 = plotFirst3Coordinates(test_projection, 5, 5);

%%%%%%%%%%%%%%%%%%%%
%      Part B      %
%%%%%%%%%%%%%%%%%%%%

%figureHandle7 = approximateImage('..\Images\test_A\s1_6.jpg',Means,SpaceA,10);

%%%%%%%%%%%%%%%%%%%%
%      Part C      %
%%%%%%%%%%%%%%%%%%%%

figure()
model_first = model_projection(1:5:end,:);
test_rate=zeros(1,100);

for i=1:100
    test_rate(i) = identify(model_first,test_projection,i,1);
end

plot(test_rate)
xlabel('number of eigenfaces')
ylabel('identification rate')

hold on
[M, indice] = max(test_rate);
x=[indice,indice];
y=[0,M];
%plot(x,y);

%%%%%%%%%%%%%%%%%%%%
%      Part D      %
%%%%%%%%%%%%%%%%%%%%

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

hold off
figure();

xlabel('number of eigenfaces')
ylabel('identification rate (mean faces)')

[M, indice] = max(mean_rate);
x=[indice,indice];
y=[0,M];

plot(mean_rate);
hold on
plot(x,y);

%%%%%%%%%%%%%%%%%%%%
%      Part E      %
%%%%%%%%%%%%%%%%%%%%

Nbest_rate=zeros(1,5);

for i=1:5
    Nbest_rate(i) = identify(model_projection,test_projection,5,i);
end

hold off
figure()

xlabel('Nbest')
ylabel('best identification rate')


plot(Nbest_rate);

