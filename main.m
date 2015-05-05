addpath('define_dipoles','fringes','animations','classes','responses','applied_field') %add stuff to path

%----------DEFINE_DIPOLES we are using-----------
dipoles = calc_lin_dip_def(2,1/16);	%no, Gamma
G_x = calc_nn_gx(2, 0.3, 1);		%no, coupling, endcoupling on/off


%{
%---------calculate the EXTERNAL_FIELD from 2 sources------------ 
no_source = class_source([128,128i],[0,0]);
sources = [class_source([5,5], [1,-i]), no_source];  %location, orient
h_sources = calc_ss_h(calc_he(dipoles,sources,0));
%}



%---------run scripts to look at stuff------------
%fplot(@(w) 20*calc_power(w,G_x,dipoles,h_sources),   [0,2]);
%calc_anim(dipoles, [1,1,-1,1], 0.5);


M = calc_M(1.2, calc_X(1.2,dipoles), G_x)

