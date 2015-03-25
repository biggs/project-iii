addpath('define_dipoles','fringes','animations','classes','responses','applied_field') %add stuff to path

%----------DEFINE_DIPOLES we are using-----------
dipoles = calc_lin_dip_def(5,1/16);	%no, gamma
G_x = calc_nn_gx(5, 0.3, 0);			%no, coupling, endcoupling


%---------calculate the APPLIED_FIELD from 2 sources------------ 
sources = [class_source([2,2], [0.001,0.05]), class_source([40,30], [0,0])];
h_sources = calc_ss_h(calc_he(dipoles,sources,0));


%---------look at stuff------------
%plot_eigs;
fplot(@(w) calc_power(w,G_x,dipoles,h_sources),   [0,2]);

%calc_anim(dipoles, [1,1,-1,1], 0.5);


fringes