% ------- choose source positions ---------
%first do in circle, all circ pol

sources = [];
theta_step = 0.2;
theta_max = 0.6;

for theta = 0:theta_step:theta_max  % make sure no overlapping
	sources = [sources, class_source(3*[cos(theta),sin(theta)], 0.1*[1,1])];
end


% ------- calculate G_src ---------
G_src = [];

for src_i = sources
	src_i;
	%____________________?????????
	h_ext_i = (calc_he(dipoles,[src_i,no_source],0)) %NEED TO DELETE THE CALC_SS TO MAKE IT WORK
	%____________________?????????
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


abs(det(H_ext' * H_ext_dual - pinv(H_ext) * H_ext)); %shows that above code works




%fill the a matrix
A = zeros(4);

for a_i = 1:4
	for a_j = 1:4
		fringe = calc_fringe(1.2,G_x,dipoles,sources(a_i),sources(a_j));
		A(a_i,a_j) = fringe(1)*exp(1i*fringe(2));
	end
end


L_recon = H_ext_dual * A * H_ext_dual'
