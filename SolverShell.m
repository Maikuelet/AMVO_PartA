%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  SOLVER SHELL  %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ---------------------  DESCRIPTION  -----------------------% 
% This function iterates the solver over the different mesh 
% sizes specifyed in the 'InputData.m'  file. 
%
% -----------------  INPUT PARAMETERS  --------------------%
% N  =  Number of Mesh nodes
% L  =  Domai Length 
%
% -----------------  OUTPUT PARAMETERS  -------------------%
% max_error_conv  = Convective error 
% max_error_diff  = Diffusive error 
%
% ---------------  COMPUTE PARAMETERS  --------------------%
% d  =  CV face length
%
% ----------------------  DATA STORED  ----------------------% 
%
% max_error_conv  = Saves  Convective error for postprocessing
% max_error_diff  = Saves  Diffusive error for postprocessing


function [max_error_diff, max_error_conv] = SolverShell(L,N)

max_error_diff=zeros(length(N),1);
max_error_conv=zeros(length(N),1);

for k=1:length(N)
    
    d=L/N(k);
    
    % -- NUMERICAL VELOCITY FIELD -- %
    [u,v]  = VelocityField(N(k),L);
    
    % -- NUMERICAL CONVECTIVE-DIFFUSIVE TERM -- %
    
    [conv_u,diff_u] = ConvDiff (u,v,L);
    
    % -- NUMERICAL CONVECTIVE TERM -- %
    %conv_u = convective(u,v,L)./d^2;
    
    % -- ANALYTIC CONV and DIFF THERMS -- %
    [adiff, aconv]=MMS(N(k),L);
    
    % -- ERROR COMPUTE -- %
    conv_u = conv_u./d^2;
    diff_u = diff_u./d^2;
    
    error1  =  abs(diff_u-adiff);
    max_error_diff(k)  =  max(max(error1));
    
    % -- ERROR COMPUTE -- %
    error2=abs(conv_u-aconv);
    max_error_conv(k)=max(max(error2));
    
end
