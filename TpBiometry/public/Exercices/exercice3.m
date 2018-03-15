%%%%%%%%%%%%%%%%%%%%
%      Part A      %
%%%%%%%%%%%%%%%%%%%%

test_A = loadImagesInDirectory('..\Images\test_A\');
test_projection = projectImages(test_A, Means, SpaceA);

[DistancesClients, DistancesImpostors] = verify(model_projection,test_projection,5);

[YClients, XClients] = hist(-log(DistancesClients),10);
[YImpostors, XImpostors] = hist(-log(DistancesImpostors),10);
figure;
hold on;
plot(XClients,YClients,'b',XImpostors,(YImpostors/19),'r');