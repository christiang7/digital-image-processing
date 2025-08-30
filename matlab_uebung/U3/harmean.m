function f = harmean(g, m, n)
%  Implements a harmonic mean filter.
%inclass = class(g);
g = im2double(g);
f = m * n ./ imfilter(1./(g + eps),ones(m, n), 'replicate');
%f = changeclass(inclass, f);