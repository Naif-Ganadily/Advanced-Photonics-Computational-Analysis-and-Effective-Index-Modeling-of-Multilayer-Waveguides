function [gc]=G_clad(ko,k,nc,nf)
gc= sqrt((ko^2)*(nf^2-nc^2)-k^2);
end