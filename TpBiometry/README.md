# Face recognition using Eigenfaces

Introduction 

## Exercice 1 : Building the Eigenspace

### Computing the Eigenspace A

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

### Plotting tge cumulative sum of eigenvalues

We can plot the cumulative sum of eigenvalues with the following matlab instructions: 
```matlab
Cumulated = cumsum(Eigenvalues);
plot(Cumulated);
```
