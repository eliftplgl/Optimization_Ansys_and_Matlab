clc;
clear;
close all;

% initialization of optimization method-----------------------------

Do = 0;
nod_Do = 1;     % number of data points 
Do_start = 6000;  % İteration start value
Do_end = 7000;   % iteration end value

g = 0;
nod_g = 1;
g_start = 15;
g_end = 20;

Dr = 0;
nod_Dr = 1; 
Dr_start = 5500;
Dr_end = 6500;

Ls = 0;
nod_Ls = 1;
Ls_start = 850;
Ls_end = 1000;

iter = 1;
subplot_number = nod_g*nod_Do*nod_Dr*nod_Ls;

%-----------------------------------------------------------------

% optimization loop
for Do = linspace (Do_start,Do_end,nod_Do)
    for g = linspace (g_start,g_end,nod_g)
        for Dr = linspace (Dr_start,Dr_end,nod_Dr)
            for Ls = linspace (g_start,g_end,nod_Ls)
                c_core_matlab_code_2; % update the data inside this file and run the simulation again and again for different parameters
                subplot(subplot_number,1,iter)
                plot(data(:,1),data(:,2)); % data is a nx2 matrix
                title(sprintf("Magnetic Field in Air Gap - Iteration = %d", iter));
                xlabel("Distance(mm)");
                ylabel("Magnetic Field (mT)");
                iter = iter +1;
            end
        end
    end
end