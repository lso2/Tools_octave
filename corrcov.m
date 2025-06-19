function [R, sigma] = corrcov(C)
  sigma = sqrt(diag(C));
  R = C ./ (sigma * sigma');
end
