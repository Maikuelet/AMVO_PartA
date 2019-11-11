%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  SOLVER SHELL  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function iterates the solver over the different mesh 
% sizes specifyed in the 'InputData.m'  file. 
% ---------------------  DESCRIPTION  -----------------------% 
% This function computes the velocity field for the case of
% study. It is defined inside the code. 
%
% -----------------  INPUT PARAMETERS  --------------------%
% N  =  Number of Mesh nodes
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% u  = Velocity field [m/s]
% L  =  Domai Length 
%
% ----------------------  DATA STORED  ----------------------% 
% u = Data for the velocity field in a [N+2][N+2] matrix 




function [u,v] = VelocityField (N,L)

    d = L/N;
        
    u = zeros(N+2, N+2);
    
    
    x = Mesh (0 , L+d , d);
    y = Mesh (-d/2, L+d/2, d);    
    
    for i=2:1:N+1
        for j=2:1:N+1
            u(i,j)=sin(x(i))*cos(y(j));
        end
    end
    
    u=halo_update(u);
    
    d = L/N;
    
    v = zeros(N+2,N+2);
    
    x = Mesh (-d/2 , L+d/2 , d);
    y = Mesh (0, L+d, d);    
    
   for i=2:1:N+1
        for j=2:1:N+1
            v(i,j) = -cos(x(i))*sin(y(j));
        end
    end
    
    v = halo_update(v);
    
    
end
    
    
   