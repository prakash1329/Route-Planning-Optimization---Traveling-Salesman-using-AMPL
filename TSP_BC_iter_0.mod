#Assignment Problem relaxation of the TSP Formulation

set start; # starting point
set dest; # destination point

param cost{i in start, j in dest}; # Distance between city i and j
param N; # number of cities

var x{i in start, j in dest} binary; 

#Objective Function
minimize tour_length: sum{i in start, j in dest} cost[i,j] * x[i,j];

#Constraints
subject to arriveonce{j in dest}: sum{i in start} x[i,j] =1;
subject to leaveonce{i in start}: sum{j in dest} x[i,j] = 1;

subject to departfrom: sum{j in dest} x[1,j] = 1;
subject to returnto: sum{j in dest} x[j,1] = 1;
