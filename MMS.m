%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  MMS  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------  DESCRIPTION  -------------------% 
% This functions computes the analytic result in order
% to use the Method of the Manufactured Solutions to
% check the validity of the code.
%
% -----------------  INPUT PARAMETERS  --------------------%
% N  =  Number of Mesh nodes
% L  =  Domai Length 
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% adiff  = Analitic Diffusive solution 
% aconv  = Analitic Convective Solution
%
% ----------------------  DATA STORED  ----------------------% 
%
% adiff  = Analitic Diffusive solution matrix [N+2][N+2]
% aconv  = Analitic Convective Solution matrix [N+2][N+2]

function [adiff,aconv] = MMS(N,L)
    
    d = L/N;
    aconv = zeros(N+2,N+2);
    
    
    x = Mesh (0 , L+d , d);
    y = Mesh (-d/2, L+d/2, d);  
    
     for i=2:1:N+1
        
        for j=2:1:N+1
            
            aconv(i,j)=sin(x(i))*cos(x(i));        
        
        end
     end
     
     aconv = halo_update (aconv);
     
     adiff=zeros(N+2,N+2);

    
    for i=2:1:N+1

        for j=2:1:N+1
            
            adiff(i,j)=-2*sin(x(i))*cos(y(j));
        end
    end
    
    adiff=halo_update(adiff);

        
end