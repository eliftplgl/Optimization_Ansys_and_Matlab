file_1 = fopen ("script1.vbs","r"); % read the content of the script1
file_2 = fopen("script2.vbs","w"); % write smt to script2

if file_1 < 0
    error("Cannot open file_1");  % check whether the files are open succesfuly or not 
end 

if file_2 < 0
    error("Cannot open file_2"); % the fopen function gives -1 when the file cannot be opened
                                 % it gives a positive number when the file is opened
end 

while true 

    if feof(file_1) 
        fclose(file_1);  % if the end of the file is reached, close the files and break
        fclose(file_2);
        break;
    end 
    
    line = fgetl(file_1); % read every line of the file_1 one by one 
    
    if strcmpi (line(2:end), 'matlab') % if the matlab line is reached in file_1
        
        fprintf(file_2,"Do = %f \n", Do );
        fprintf(file_2,"g = %f \n", g );
        fprintf(file_2,"Dr = %f \n", Dr );
        fprintf(file_2,"Ls = %f \n", Ls );
        fprintf(file_2,'file_name = "designSheet_iter%d.tab" \n', iter);
        fprintf(file_2,'directory = "%s" \n', strrep(cd, "\","/")+"/"); 
        % cd takes current directory of the file
        % sttrep replaces all the characters to have the correct file directory
        
    else 
        fprintf(file_2, "%s \n", line);
    end 
end 

% run the script
system("script2.vbs")

% file_3 = fopen(sprintf("designSheet_iter%d.tab",iter),'r'); % read the data from that file
% 
% if file_3 < 0
%     error("Cannot open file_3");  % check whether the files are open succesfuly or not 
% end 
% 
% fgetl(file_3); % get the first line, we do not need that as the first line is only the title
% 
% data = fscanf(file_3, "%f");
% data = (reshape(data,2,[]))'; % reshaping the matrix
