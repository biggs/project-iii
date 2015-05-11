addpath('define_dipoles','fringes','animations','classes','responses','field','eai') %add stuff to path

%----------DEFINE_DIPOLES our system-----------
m_s = 1;
small_gamma = 1;
alpha = 1/32;

no_dipoles = 5;
exchange_coupling = 0.2;
endcoupling = true;

% create a system with these dipoles in a circle (equi) or line (lin)
dipoles = calc_equi_dip_def(no_dipoles,class_dipole(m_s,small_gamma,alpha,[0;0]));
G_x = calc_nn_gx(no_dipoles,exchange_coupling,endcoupling);




%---------run other scripts to create plots------------
w=1.2;
L = calc_L(1.2,1,G_x,dipoles)
V = plot_eigenvalues(L, G_x, dipoles, [0,2], [1,6])  % plot the eigenvalues of response matrix
px = @(x) plot(1:5, wrap2pi(angle(V(1:2:end,x)) - angle(V(1,x))));

%plot_simple_responses;

%fplot (@(theta) calc_visibility( w, G_x, dipoles, class_source([2;0], [1;0]), class_source(2*[cos(theta);sin(theta)], [1;0]) ),   [0,2*pi])


%{

%------------EAI-------------
% define source positions
sx = @(theta) class_source(2*[cos(theta);sin(theta)], [1;0]);
sources = [ sx(0), sx(0.5), sx(1), sx(1.5) ];

%calculate various source related things
G_src = calc_G_src( dipoles, sources );
M_src = diag([1 1 1 1]);
H_ext = M_src * G_src


[U,S,V] = svd(H_ext);
s = diag(S); % make a vect of diagonal S vals
k = sum(s> 1e-4); % number of non-zero s entries (always first k). Conditioning of s controls reconstruction
H_ext_dual= (U(:, 1: k)* diag(1./ s(1: k))* V(:, 1: k)')

H_ext_dual*H_ext'

%calc A. Uses only power measurements.
A = calc_A_from_p(w,dipoles,sources,G_x)

L_recon = H_ext_dual*A*H_ext_dual'


%quantify how well L has been reconstructed
L = calc_L(w,1,G_x,dipoles)
abs((L-L_recon) ./ L) 		%show difference << L

%plot_eigenvalues(L_recon, G_x, dipoles, [0,2], [1,4]) % plot reconstructed

%plot_fringes

%fplot(@(w) calc_power(w,G_x,dipoles,G_src * V(:,4),1), [0,2]);
%}
