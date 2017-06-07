function [ IP ] = compute_generic_IP( mat, varargin )


  p = inputParser;  
  p.addRequired('mat',@(x) true);
  p.addOptional('is_sim', false, @islogical);
  p.addOptional('kvec', 1, @(x) true);
  p.parse( mat, varargin{:});
  inputs = p.Results;

  % This takes in a 2 by P matrix, where we want to find the IP between
  % the first row and second row.

  % Setup: Random projections, where we have V = XR
  % This function computes the actual IP between the two rows
  % or an estimated IP between two rows of X using V

  % mat: X (or V)
  % is_est : false   - compute actual IP using X as input
  %          true  - compute estimated IP using V using V as input

  % Optional parameters
  % is_sim: boolean ; true if computing vectors of IP for subset of K cols for simulations
  %                   false - return just estimated IP using K cols
  % kvec:   subset of K cols

 
  if isfield(mat,'vmat') == 0
  	% Compute IP of mat. Is exact estimate
  	IP = mat(1,:) * mat(2,:)';
  else
    % Compute inner product given V
    % Note that we didn't include scaling factor in our previous functions
    % so we're putting them in now.
    % See derviations.pdf 
    vmat = mat.vmat;
    [ ~, k ] = size(vmat);
    if inputs.is_sim
      IP = cumsum( (vmat(1,:) .* vmat(2,:)));
      IP = IP(inputs.kvec) ./ inputs.kvec;
    else
      IP = mean( (vmat(1,:) .* vmat(2,:)));
    end
    IP = mat.scaling_factor * IP;
  end

end
