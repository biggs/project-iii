% ------- choose source positions ---------
% in circle

sources = [];
theta_step = 0.2;
num_srcs = 6;
theta_max = (theta_step*(num_srcs-1));

for theta = 0:theta_step:theta_max  % no overlap
	sources = [sources, class_source(1*[cos(theta);sin(theta)], 0.1*[1;1])];
end




% ------- calculate G_src ---------
G_src = [];
no_src = class_source([128;128],[0;0]);

for src_i = sources
	src_i;
	h_ext_i = (calc_he(dipoles,[src_i,no_src],0)); % why is this real ??????
	G_src = [G_src, h_ext_i];
end


% ------- define M_src --------
M_src = zeros(num_srcs);

for element = 1:num_srcs % this is number of sources used
	M_src(element,element) = 1;
end


% ------- find H_ext --------
H_ext = G_src * M_src;

% ------- find H_ext decomp and inverse -----

[U,S,V] = svd(H_ext);


s = diag(S); % make a vect of diagonal S vals
k = sum(s> 1e-9); % number of non-zero s entries (always first k)
H_ext_dual= (U(:, 1: k)* diag(1./ s(1: k))* V(:, 1: k)');



% -------- populate A matrix -------
A = zeros(num_srcs);

for a_i = 1:num_srcs
	for a_j = 1:num_srcs
		fringe = calc_fringe(1.1,G_x,dipoles,sources(a_i),sources(a_j));
		A(a_i,a_j) = fringe(1)*exp(-1i*fringe(2));
	end
end


L_recon = H_ext_dual * A * H_ext_dual'
H_dagger_x_dual = H_ext' * H_ext_dual
