# DDA2001-KMeans-Package

> Introduction: This is a package of K-means clustering method just for DDA2001 tutorial.  

> Two scripts are included in the package as follows. 
> 1. $dda2001kmeans.m$;
> 2. $final_kmeans.m$.

> The main script $final\_kmeans.m$ gives you an interface to input the relavant data set and hyperparameters. The other script $dda2001kmeans.m$ furthermore receives the transferred data to implement the kmeans algorithms. Then, you will get the clustering results.

> Example: Consider a 2-dimensional datset as follows.

|Point|x|y|
|----|----|----|
|P1|2|3|
|P2|3|1|
|P3|4|2|
|P4|12|6|
|P5|7|5|

> Now apply K-means algorithm with $K = 2$. Suppose the two cluster centers are initialized at $P3$ and $P5$.

> Recall the main program:

```matlab
>> final_kmeans
****** Let us first give some settings...
Step 1: Please input design matrix X with m rows (points) and n cols (features): 
 X = [2, 3; 3, 1; 4, 2; 12, 6; 7, 5]
Step 2: Please input the number of clusters: 
 k = 2
Step 3: Please input start matrix with k rows (cluster centers) and n cols (features): 
 start = [X(3, :); X(5, :)]
Step 4: Please clarify your similar function ('L1', 'L2', or 'inf'): 
 options.distflag = 'L2'
Step 5: Please select your preferable output ('standard' or 'complete'): 
 p = 'complete'
****** You have given some settings, and the kmeans clustering program will start...

Implementing KMeans clustering...
 
iter 1:
------------------------------
Cluster Assignment:
     0     0     0     0     0

Cluster Centers:
     4     2
     7     5

------------------------------
 
iter 2:
------------------------------
Cluster Assignment:
     1     1     1     2     2

Cluster Centers:
    3.0000    2.0000
    9.5000    5.5000

------------------------------
 
Converged!
```

> As you can see, the stationary cluster assignment is
> 1. $K1:\{P1, P2, P3\}$
> 2. $K2:\{P4, P5\}$

> Also, the cluster centers are
> 1. $K1 = (3, 2)$
> 2. $K2 = (9.5, 5.5)$
