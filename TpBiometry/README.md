# Face recognition using Eigenfaces

Report done by William CLOT and Camille PLAYS. 

Last update: 18/03/18.

* [**Exercice 1 : Building the Eigenspace**](#exercice-1--building-the-eigenspace)
	* [A. Computing the Eigenspace A](#a-computing-the-eigenspace-a)
	* [B. Plotting the cumulative sum of eigenvalues](#b-plotting-the-cumulative-sum-of-eigenvalues)
	* [C. Approximating the first image](#c-approximating-the-first-image)
	* [D. Projecting and plotting in the face space](d-projecting-and-plotting-in-the-face-space)
* [**Exercice 2 : Identification**](#exercice-2--identification)
	* [A. Projecting and plotting test_A](#a-projecting-and-plotting-test_a)
	* [B. Approximating s1_6.jpg](#b-approximating-s1_6jpg)
	* [C. Computing the identification rates (first face)](#c-computing-the-identification-rates-first-face)
	* [D. More identification rates (mean faces)](#d-more-identification-rates-mean-faces)
	* [E. Drawing indentification rates as a function of N](#e-drawing-indentification-rates-as-a-function-of-n)
* [**Exercice 3 : Verification**](#exercice-3--verification)
	* [A. Computing client and impostor scores](#a-computing-client-and-impostor-scores)
	* [B. Plotting the Receiver Operating Characteristic (ROC) curve](#b-plotting-the-receiver-operating-characteristic-ROC-curve)
	* [C. Drawing the Equal Error Rate (EER) curve](#c-drawing-the-equal-error-rate-EER-curve)
* [**Exercice 4 : Mismatch between the eigenspace and test individuals**](#exercice-4--mismatch-between-the-eigenspace-and-test-individuals)
	* [A. Computing identification rates for set B](#a-computing-identification-rates-for-set-b)
	* [B. Computing the eigenspace B](#b-computing-the-eigenspace-b)

## Exercice 1 : Building the Eigenspace

All the code explained can be found in file [`exercice1.m`](public/Exercices/exercice1.m).

* [A. Computing the Eigenspace A](#a-computing-the-eigenspace-a)
* [B. Plotting the cumulative sum of eigenvalues](#b-plotting-the-cumulative-sum-of-eigenvalues)
* [C. Approximating the first image](#c-approximating-the-first-image)
* [D. Projecting and plotting in the face space](d-projecting-and-plotting-in-the-face-space)


### A. Computing the Eigenspace A

We build the eigenspace out of a set of images that can be found in `public/Images/Train_A` with the function `loadImagesinDirectory()` and 
`buildSpace()` like so:

```matlab
addpath \\datas\teaching\courses\image\Tpbiometry\public\Matlab
train_A = loadImagesInDirectory('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\');
[Means, SpaceA, Eigenvalues] = buildSpace(train_A);
```

We now have access to the eigenspace (`SpaceA`) and the `Eigenvalues` of the image set in their corresponding `SpaceA`. 

**What is the maximum size of the eigenspace ?** As we have 100 eigenvalues we therefore have a maximum size for the eigenspace of 100. 

The eigenvalues can be interpreted as the amount of information that is carried out by each eigenvector. **Why is it so ?** Because an eigenvalue represents the factor by which a eigenvector is stretched by the transformation of coordinates. 

### B. Plotting the cumulative sum of eigenvalues

We can plot the cumulative sum of eigenvalues with the following matlab instructions: 

```matlab
Cumulated = cumsum(Eigenvalues);
plot(Cumulated);
```

We then have the following curve:
![Cumulated eigenvalues](image_rapport/ex1_pB.jpg)

**Please comment the curve**: As it is cumulative, the curve is growing. However, as we add eigenvalues, they contain less and less information. This is why the curve is similar to a logarithmic function.

### C. Approximating the first image

We can rebuild the face using the `approximateImage()` function. We can change the values of the number of eigenfaces used as so:

```matlab
figureHandle1 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,12);
figureHandle2 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,40);
figureHandle3 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,75);
figureHandle4 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,100);
```

![using 40 and 100 eigenfaces](image_rapport/ex1_pC.jpg)

**Can we rebuild the first image perfectly ?** Yes we can, if we use all the eigenvalues (100), we have all the information needed to rebuild the image. We can do so because the image in question was used to build the eigenspace in the first place.

### D. Projecting and plotting in the face space

Using routines `projectImages()` and `plotFirst3Coordinates()`, we manage to plot the coordinates of the five training faces of the first five training individuals on the 3 most significantes eigenvectors of `SpaceA`. We will then plot a total of 25 points on to the graph. We can observe the following graph:

![projecting and plotting](image_rapport/ex1_pD.jpg)

**Please comment the curve**: On this graph we can see 5 groups of points (with different colors). Each group of points represents the five pictures of one person. We can see that the points of one group (ie of one person) don't have the same coordinates, that comes from the fact that each picture isn't the same (point of vue, lighting...) even if it represents the same person.

## Exercice 2 : Identification

All the code explained can be found in file [`exercice2.m`](public/Exercices/exercice2.m).

* [A. Projecting and plotting test_A](#a-projecting-and-plotting-test_a)
* [B. Approximating s1_6.jpg](#b-approximating-s1_6jpg)
* [C. Computing the identification rates (first face)](#c-computing-the-identification-rates-first-face)
* [D. More identification rates (mean faces)](#d-more-identification-rates-mean-faces)
* [E. Drawing indentification rates as a function of N](#e-drawing-indentification-rates-as-a-function-of-n)

### A. Projecting and plotting test_A

We have used the function `projectImages()` to project the `test_A` images on the `Space_A` which has been calculated in the `exercice1.m` file. We now have five points for the five first people of `test_A` ploted in `Space_A` as so: 

![Cumulated eigenvalues](image_rapport/ex2_pA.jpg)

We can see that the two figures are similar but are not the same which is normal because the two set of images are not the same. The photos are of the same people but there not exactly the same photos (lighting changes, posture changes, glasses etc..) Nonetheless we can see that the two figures are similar in many ways. The group of points are approximately in the same position but are just slightly more scattered across the figure.

### B. Approximating s1_6.jpg

We try to rebuild the original first test image with the function approximateImage in the SpaceA created in exercice1.m file. We see that we can’t rebuild the original image even with all the eigenfaces possible (100) because this image in test_A wasn’t present during the training phase in exercice 1 when we were creating the face space.

![approximating s1_6.jpg](image_rapport/ex2_pB.jpg)

### C. Computing the identification rates (first face)

We can use the `identify()` function with the projected images of `test_A` in `Space_A` against the enrolled identities (`train_A` in `Space_A`) like so:

```matlab
model_projection=projectImages(train_A, Means, SpaceA);
model_first = model_projection(1:5:end,:); %Only the first image of the model

test_projection=projectImages(test_A, Means, SpaceA);

test_rate=zeros(1,100); #Initializing null matrix

for i=1:100
    test_rate(i) = identify(model_first,test_projection,i,1);
end

plot(test_rate)
```

With this graph we found that the best identification rate is found with 35 eigenfaces and its value is 77%. As predicted the identification rate increases with the number of eigenfaces used, but it reaches quickly a limit of identification.

![identification rate](image_rapport/ex2_pC.jpg)

### D. More identification rates (mean faces)

This time, we used the average of the five training points of each individuals. In order to do that, we wrote the following code: 


```matlab
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

plot(mean_rate)
```

With this graph we found that the best identification rate is found with 23 eigenfaces and its value is 94%. The identification rate increases with the number of eigenfaces used and once il reaches 23 eigenfaces, it stays stable.

We get a better result with a fewer number of eigenfaces using the average rather than the first image of each person.


![identification rate](image_rapport/ex2_pD.jpg)


### E. Drawing indentification rates as a function of N

We projected the images of TestA into SpaceA and we computed the N-Best identification rates, for various N, using the routine identify. We therefore wrote the following code:

```matlab
Nbest_rate=zeros(1,5);

for i=1:20
    Nbest_rate(i) = identify(model_average,test_projection,5,i);
end

[Nbest_max, Nbest_index] = max(Nbest_rate);
x=[Nbest_index,Nbest_index];
y=[Nbest_rate(1),Nbest_max];

plot(Nbest_rate);
```

We obtain the following graph which is the identification rate as a function of N:

![identification rate](image_rapport/ex2_pE.jpg)

The curve is an increasing function and reaches a maximum value for N=10 and stays stable from there. As the function `identify()` evaluates the pourcentage of identification it seems like for a value of N=10 the process of identification is optimal.

## Exercice 3 : Verification

All the code explained can be found in file [`exercice3.m`](public/Exercices/exercice3.m).

* [A. Computing client and impostor scores](#a-computing-client-and-impostor-scores)
* [B. Plotting the Receiver Operating Characteristic (ROC) curve](#b-plotting-the-receiver-operating-characteristic-ROC-curve)
* [C. Drawing the Equal Error Rate (EER) curve](#c-drawing-the-equal-error-rate-EER-curve)

### A. Computing client and impostor scores

We use the `verify()` function with the following arguments:

```matlab
[DistancesClients, DistancesImpostors] = verify(model_projection,test_projection,5);
```

After plotting the histogram with rescaled values in order to be more readable we obtain the following graph:

![identification rate](image_rapport/ex3_pA.jpg)

we observe that the imposters scores are centered around a less important value than the clients. Therefore, they have a worse average score, even though some imposters can have a better score than some clients.

### B. Plotting the Receiver Operating Characteristic (ROC) curve

We use the `computeVerificationRates()` function with the following arguments:

```matlab
[FalseRejectionRates, FalseAcceptanceRates] = computeVerificationRates(DistancesClients,DistancesImpostors);
```

We obtain the ROC curve as so:

![ROC curve](image_rapport/ex3_pB.jpg)

This ROC curve is used when we have various threshold settings. If the acceptance threshold is low then we would allow a lot of people to gain access to the system and therefore the probability of rejecting someone that should be accepted (False Rejection) would be very low. On the contrary if the acceptance threshold is relativaly high, we would restrict as many people as we can and therefore the probability of accepting someone that should be rejected (False Acceptance) would be very low.

### C. Drawing the Equal Error Rate (EER) curve

We use the a simple loop to calculate the `EqualErrorRate` like so:

```matlab
EqualErrorRate = zeros(1,100)

for i = 1:100
    [DistancesClients, DistancesImpostors] = verify(model_projection,test_projection,i);
    EqualErrorRate(i)=computeEER(DistancesClients, DistancesImpostors);
end
```

We obtain the EER curve as so:

![EER curve](image_rapport/ex3_pC.jpg)

The Equal Error Rate is the rate at which both acceptance and rejection errors are equal. The more we use eigenfaces the less the ERR is high

## Exercice 4 : Mismatch

All the code explained can be found in file [`exercice4.m`](public/Exercices/exercice4.m).

* [A. Computing identification rates for set B](#a-computing-identification-rates-for-set-b)
* [B. Computing the eigenspace B](#b-computing-the-eigenspace-b)

### A. Computing identification rates for set B

We enrolled the images of TrainB into SpaceA and projected the image of TestB into SpaceA. We obtain the following identification rate for a variying number of eigenfaces:

![EER curve](image_rapport/ex4_pB.jpg)

The best identification rate is 21% and the optimal number of eigenfaces to obtain it is 7.


### B. Computing the eigenspace B


we now enroll the images of TrainB into SpaceB and project the images of TestB into SpaceB. We obtain the following identification rate for a variying number of eigenfaces:

![EER curve](image_rapport/ex4_pB_bis.jpg)

The best identification rate is 20% and the optimal number of eigenfaces to obtain it is 12.

By comparing the two identification rate curves, we can observe that when we enroll images in a bigger space, we need less eigenfaces in order to get the best identification rate.
