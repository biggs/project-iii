addpath('define_dipoles','fringes','animations','classes','responses','field','eai') %add stuff to path

%----------DEFINE_DIPOLES our system-----------
m_s = 1;
small_gamma = 1;
alpha = 1/32;

no_dipoles = 2;
exchange_coupling = 0.4;
endcoupling = true;

% create a system with these dipoles in a circle (equi) or line (lin)
dipoles = calc_equi_dip_def(no_dipoles,class_dipole(m_s,small_gamma,alpha,[0;0]));
G_x = calc_nn_gx(no_dipoles,exchange_coupling,endcoupling);



%---------run other scripts to create plots------------
w=1.1;

plot_simple_responses;

plot_fringes;

L = calc_L(w,1,G_x,dipoles)
figure; V = plot_eigenvalues(L, G_x, dipoles, [0,2], [1,2])  % plot the eigenvalues of response matrix
%px = @(x) plot(1:5, wrap2pi(angle(V(1:2:end,x)) - angle(V(1,x))));


%----------field space plots-----------

locations = [[0.5;0.3],[0.5;0.7]];
m_vals = [[1;i],[1;i]];
figure; imagesc([-1,1],[1,-1],calc_field_space(200,2000,locations, m_vals))



%------------EAI-------------
% define source positions
sources = [ class_source(2*[1;1], [1;0]), class_source(2*[1;1], [0;1]), ...
			class_source(2*[2;1], [1;0]), class_source(2*[2;1], [0;1]) ];

%calculate various source related things
G_src = calc_G_src( dipoles, sources )
M_src = diag([1 1 1 1]);
H_ext = M_src * G_src


[U,S,V] = svd(H_ext);
s = diag(S) % make a vect of diagonal S vals
k = sum(s> 1e-6); % number of non-zero s entries (always first k). Conditioning of s controls reconstruction
H_ext_dual= (U(:, 1: k)* diag(1./ s(1: k))* V(:, 1: k)')

H_ext_dual*H_ext'

%calc A. Uses only power measurements.
A = calc_A_from_p(w,dipoles,sources,G_x)

L_recon = H_ext_dual*A*H_ext_dual'


%quantify how well L has been reconstructed
frac_el_diff = abs((L+L_recon) ./ L) 		%show difference << L (note L_recon = - L )
