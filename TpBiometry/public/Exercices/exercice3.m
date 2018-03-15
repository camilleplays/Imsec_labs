    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %    TP 1 - Face recognition with eigenfaces - ImSec     %
    %                        06/03/18                        %
    %                                                        %
    % Camille PLAYS & William CLOT                Exercice 3 %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% REMINDER : PLEASE EXECUTE exercice1.m BEFORE EXECUTING THIS FILE

%% Part A : Computing client and imposter scores

test_A = loadImagesInDirectory('../Images/test_A/');
test_projection = projectImages(test_A, Means, SpaceA);

[DistancesClients, DistancesImpostors] = verify(model_projection,test_projection,5);

[YClients, XClients] = hist(-log(DistancesClients),10);
[YImpostors, XImpostors] = hist(-log(DistancesImpostors),10);
figure('Name','Clients and imposters scores histogram','NumberTitle','off')
hold on;
plot(XClients,YClients,'b',XImpostors,(YImpostors/19),'r');
legend('Clients', 'Impostors');
hold off;

%% Part B : Plotting the ROC curve


figure('Name','ROC curve','NumberTitle','off')

[FalseRejectionRates, FalseAcceptanceRates] = computeVerificationRates(DistancesClients,DistancesImpostors);

plot(FalseRejectionRates, FalseAcceptanceRates);
xlabel('FalseRejectionRates');
ylabel('FalseAcceptanceRates');

%this technology is used when we have various threshold settings. 

%% Part C : Drawing the EER curve 

figure('Name','ERR curve','NumberTitle','off')

EqualErrorRate = zeros(1,100)

for i = 1:100
    [DistancesClients, DistancesImpostors] = verify(model_projection,test_projection,i);
    EqualErrorRate(i)=computeEER(DistancesClients, DistancesImpostors);
end

plot(EqualErrorRate)
xlabel('Number of eigenfaces')
ylabel('Equal error rate')

