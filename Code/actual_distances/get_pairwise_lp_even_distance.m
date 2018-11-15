function [dist_struct] = get_pairwise_lp_even_distance(X1, X2, p)

  % X1: n1 by p matrix of n1 observations and p parameters 
  % X2: n2 by p matrix of n2 observations and p parameters
  %  p, which could take positive even integers 2,4,6,...
  
  % dist_struct: Outputs a structure with three fields.
  %            .dist_mat:  A n1 by n2 matrix, with (i,j)^th entry being the 
  %                        lp distance between X1(i,:) and X2(j,:)
  %            .dist_type: 'lp_distance' 
  %            .dist_p   : p
  % Assumptions: Assume we can compute and store this n1 by n2 matrix in memory
  
  % Author: KK

  % See derivations.pdf for more info

  dist_struct = get_pairwise_squared_lp_even_distance(X1, X2,p);
  dist_struct.dist_mat = nthroot(dist_struct.dist_mat,p);
  dist_struct.dist_type = 'lp_distance';

end
      
  