addpath('define_dipoles','fringes','animations','classes','responses','applied_field') %add stuff to path

%----------DEFINE_DIPOLES we are using-----------
dipoles = calc_lin_dip_def(1,1/16);	%no, Gamma
G_x = calc_nn_gx(1, 0.3, 0);			%no, coupling, is there endcoupling


%---------calculate the APPLIED_FIELD from 2 sources------------ 
no_source = class_source([128,128i],[0,0]);
sources = [class_source([1,1], [1,-i]), no_source];  %ie a circularly polarised source at [2,2]
h_sources = calc_ss_h(calc_he(dipoles,sources,0));




%---------run scripts to look at stuff------------
%plot_eigs;
fplot(@(w) calc_power(w,G_x,dipoles,h_sources),   [0,2]);

%calc_anim(dipoles, [1,1,-1,1], 0.5);


%fringes

%external_field