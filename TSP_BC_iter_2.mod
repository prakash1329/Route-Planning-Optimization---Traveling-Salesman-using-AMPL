#Iteration 2

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

#After solving the Iteration 1 problem, we get the following subtours
#1-6-7-14-3-13-12-5-8-15-10-1
#2-11-9-4-2

#The following cut constraints are added to prevent the above mentioned subtours

subject to iter2a: x[1,6]+x[1,7]+x[1,14]+x[1,3]+x[1,13]+x[1,12]+x[1,5]+x[1,8]+x[1,15]+x[1,10]+x[6,1]+x[6,7]+x[6,14]+x[6,3]+x[6,13]+x[6,12]+x[6,5]+x[6,8]+x[6,15]+x[6,10]+x[7,1]+x[7,6]+x[7,14]+x[7,3]+x[7,13]+x[7,12]+x[7,5]+x[7,8]+x[7,15]+x[7,10]+x[14,1]+x[14,6]+x[14,7]+x[14,3]+x[14,13]+x[14,12]+x[14,5]+x[14,8]+x[14,15]+x[14,10]+x[3,1]+x[3,6]+x[3,7]+x[3,14]+x[3,13]+x[3,12]+x[3,5]+x[3,8]+x[3,15]+x[3,10]+x[13,1]+x[13,6]+x[13,7]+x[13,14]+x[13,3]+x[13,12]+x[13,5]+x[13,8]+x[13,15]+x[13,10]+x[12,1]+x[12,6]+x[12,7]+x[12,14]+x[12,3]+x[12,13]+x[12,5]+x[12,8]+x[12,15]+x[12,10]+x[5,1]+x[5,6]+x[5,7]+x[5,14]+x[5,3]+x[5,13]+x[5,12]+x[5,8]+x[5,15]+x[5,10]+x[8,1]+x[8,6]+x[8,7]+x[8,14]+x[8,3]+x[8,13]+x[8,12]+x[8,5]+x[8,15]+x[8,10]+x[15,1]+x[15,6]+x[15,7]+x[15,14]+x[15,3]+x[15,13]+x[15,12]+x[15,5]+x[15,8]+x[15,10]+x[10,1]+x[10,6]+x[10,7]+x[10,14]+x[10,3]+x[10,13]+x[10,12]+x[10,5]+x[10,8]+x[10,15] <= 11;

subject to iter2b: x[2,11]+x[2,9]+x[2,4]+x[11,2]+x[11,9]+x[11,4]+x[9,2]+x[9,11]+x[9,4]+x[4,2]+x[4,11]+x[4,9] <= 3;

 