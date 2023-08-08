clc;
clear;
close all;

% initialization of optimization method
N = 0;
g = 0;
iter = 1;
number_of_data_N = 2;
number_of_data_g = 1;
subplot_number = number_of_data_N*number_of_data_g;
N_start = 50;
N_end = 100;
g_start = 1;
g_end = 3;

% optimization loop
for N = linspace (N_start,N_end,number_of_data_N)
    for g = linspace (g_start,g_end,number_of_data_g)
        c_core_matlab_code_2; % update the data inside this file and run the simulation again and again for different parameters
        subplot(subplot_number,1,iter)
        plot(data(:,1),data(:,2)); % data is a nx2 matrix
        title(sprintf("Magnetic Field in Air Gap - Iteration = %d", iter));
        xlabel("Distance(mm)");
        ylabel("Magnetic Field (mT)");
        iter = iter +1;
    end
end