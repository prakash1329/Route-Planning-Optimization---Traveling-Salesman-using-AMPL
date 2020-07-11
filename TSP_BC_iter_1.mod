#Iteration 1

set start; # starting point
set dest; # destination point

param cost{i in start, j in dest}; #Distance between city i and j
param N; # number of cities

var x{i in start, j in dest} binary;

# Objective Function
minimize tour_length: sum{i in start, j in dest} cost[i,j] * x[i,j];

#Constraints
subject to arriveonce{j in dest}: sum{i in start} x[i,j] =1;
subject to leaveonce{i in start}: sum{j in dest} x[i,j] = 1;

subject to departfrom: sum{j in dest} x[1,j] = 1;
subject to returnto: sum{j in dest} x[j,1] = 1;

#By solving the Assignment problem relaxation we get the following subtours
# 1-5-10-1
# 2-11-2
# 3-14-3
# 4-9-4
# 5-8-5
# 6-7-6
#12-13-12

#The following cut constraints are added to prevent the above mentioned subtours

subject to iter1a: x[1,15]+x[1,10]+x[15,1]+x[15,10]+x[10,1]+x[10,15]<= 2;
subject to iter1b: x[2,11]+x[11,2] <=1;
subject to iter1c: x[3,14]+x[14,3] <=1;
subject to iter1d: x[4,9]+x[9,4] <= 1;
subject to iter1e: x[5,8]+x[8,5] <= 1;
subject to iter1f: x[6,7]+x[7,6] <= 1;
subject to iter1g: x[12,13]+x[13,12] <= 1;