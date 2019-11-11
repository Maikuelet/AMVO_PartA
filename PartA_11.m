%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  CODE A (Conv - Diff)  %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Adrian Granados de la Torre  %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%  Miquel Altadill Llasat  %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%  Francesc Garcia-Duran   %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  Sergi Tarroc Gil   %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -----------------------  DESCRIPTION  -------------------------% 
% This file contains all the functions needed to solve the case of
% study. This code section shows the function structure. You can 
% find a description of how each function works inside each own file.

% The Final Report document shows the theorical development of the
% problem. 

clear all
more off

InputData  %Shell parameters are defined

tic
[max_error_diff,max_error_conv] = SolverShell(L,N);

PostProcessors (L,N,max_error_diff,max_error_conv);

fprintf('Solver Time %f\n',toc); 
