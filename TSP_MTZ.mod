#mod file	

set start; # starting city
set dest; # destination city

param cost{i in start, j in dest}; #distance from place i to j
param N; # number of cities

var x{i in start, j in dest} binary;
var u{i in dest}; # MTZ constraints to eliminate sub tours

#Objective Function
minimize tour_length: sum{i in start, j in dest} cost[i,j] * x[i,j];

#Constraints
subject to arriveonce{j in dest}: sum{i in start} x[i,j] =1; 
subject to leaveonce{i in start}: sum{j in dest} x[i,j] = 1;

subject to departfrom: sum{j in dest} x[1,j] = 1; #Assigning the starting point as A
subject to returnto: sum{j in dest} x[j,1] = 1; #Assigning the end point as A

subject to subtour_elimination{i in 2..N, j in 2..N: i!=j}: u[i] - u[j] + N*x[i,j] <= N-1;
subject to u_nonneg{j in dest}: u[j] >= 0;
