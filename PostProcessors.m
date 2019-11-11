%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%  POSTPROCESOR %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------------  DESCRIPTION  -----------------------% 
% This function works with the data stored for turning it into
% visual data. (Exampe: Plots)
%

function PostProcessors (L,N, error1, error2)
   
    d=L./N;
    d2=d.^2;
    k=length(N);
    figure(1);
    loglog(d,error1,'b--o',d,error2,'s-',d,d2,'s--');
    xlabel('Nodes in 1D '); ylabel('Error');grid on;
    title('PART A RESULTS ');
    legend('Diffusive Error','Convective Error',' d^2')
    %ylim();
    %xlim([N(1) N(k)]);
    
    

end

