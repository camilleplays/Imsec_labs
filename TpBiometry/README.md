# Face recognition using Eigenfaces

Introduction 

## Exercice 1 : Building the Eigenspace

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

### B. Plotting tge cumulative sum of eigenvalues

We can plot the cumulative sum of eigenvalues with the following matlab instructions: 

```matlab
Cumulated = cumsum(Eigenvalues);
plot(Cumulated);
```

We then have the following curve:
<!-- ADD IMAGE -->

![Cumulated eigenvalues](../image_rapport/ex1_pB.jpg)

**Please comment the curve**: As it is cumulative, the curve is growing. However, as we add eigenvalues, they contain less and less information. This is why the curve is similar to a logarithmic function.

### C. Approximating the first image

We can rebuild the face using the `approximateImage()` function. We can change the values of the number of eigenfaces used as so:

```matlab
figureHandle1 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,12);
figureHandle2 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,40);
figureHandle3 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,75);
figureHandle4 = approximateImage('\\datas\teaching\courses\image\Tpbiometry\public\Images\train_A\s1_1.jpg',Means,SpaceA,100);
```

<!-- ADD TWO IMAGES -->

**Can we rebuild the first image perfectly ?** Yes we can, if we use all the eigenvalues (100), we have all the information needed to rebuild the image. We can do so because the image in question was used to build the eigenspace in the first place.

### D. Projecting and plotting in the face space

Using routines `projectImages()` and `plotFirst3Coordinates()`, we manage to plot the coordinates of the five training faces of the first five training individuals on the 3 most significantes eigenvectors of `SpaceA`. We will then plot a total of 25 points on to the graph. We can observe the following graph:

<!-- ADD 3D GRAPH -->

**Please comment the curve**: On this graph we can see 5 groups of points (with different colors). Each group of points represents the five pictures of one person. We can see that the points of one group (ie of one person) don't have the same coordinates, that comes from the fact that each picture isn't the same (point of vue, lighting...) even if it represents the same person.


