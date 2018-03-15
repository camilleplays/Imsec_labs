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

%%%%%%%%%%%%%%%%%%%%
%      Part B      %
%%%%%%%%%%%%%%%%%%%%

[FalseRejectionRates, FalseAcceptanceRates] = computeVerificationRates(DistancesClients,DistancesImpostors);
figure;
subplot(1,2,1)
plot(FalseRejectionRates,'b');

subplot(1,2,2)
plot(FalseAcceptanceRates,'r');

%this technology is used when we have various threshold settings. 

%%%%%%%%%%%%%%%%%%%%
%      Part C      %
%%%%%%%%%%%%%%%%%%%%

EqualErrorRate = zeros(1,100)

for i = 1:100
    [DistancesClients, DistancesImpostors] = verify(model_projection,test_projection,i);
    EqualErrorRate(i)=computeEER(DistancesClients, DistancesImpostors);
end

hold off
figure();
plot(EqualErrorRate)
xlabel('number of eigenfaces')
ylabel('equal error rate')




