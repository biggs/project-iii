% ------- choose source positions ---------
%first do in circle, all circ pol

sources = [];
theta_step = 0.2;
theta_max = 0.6;

for theta = 0:theta_step:theta_max  % make sure no overlapping
	sources = [sources, class_source(3*[cos(theta),sin(theta)], 0.1*[1,-i])];
end


% ------- calculate G_src ---------
G_src = [];

for src_i = sources
	h_ext_i = calc_ss_h(calc_he(dipoles,[sources(1),no_source],0));
	G_src = [G_src, h_ext_i];
end


% ------- define M_src --------
M_src = zeros(numel(sources));

for element = 1:4 % this is number of sources used
	M_src(element,element) = 1;
end


% ------- find H_ext --------
H_ext = G_src * M_src;

% ------- find H_ext decomp and inverse -----

[U,S,V] = svd(H_ext);


s = diag(S); % make a vect of diagonal S vals
k = sum(s> 1e-9); % number of non-zero s entries (always first k)
H_ext_dual= (U(:, 1: k)* diag(1./ s(1: k))* V(:, 1: k)'); %ie conj transpose of pinv


H_ext_dual' * H_ext
H_ext * H_ext_dual'











