%---------define some useful things---------------
srcatx = @(x) class_source([x,2], [0.01,0.05]);
no_source = class_source([100,100],[0,0]);

%------plot fringes--------

%there is a fringe from simply rotating phase
clf
hold all
%fplot(@(phase)  calc_power(1.2, G_x, dipoles, calc_ss_h(calc_he(dipoles, [srcatx(2),srcatx(3)], phase))),  [0,2*pi]);
%fplot(@(phase)  calc_power(1.2, G_x, dipoles, calc_ss_h(calc_he(dipoles,[srcatx(2), no_source],0)))+calc_power(1.2, G_x, dipoles, calc_ss_h(calc_he(dipoles,[srcatx(3), no_source],0))),  [0,2*pi])

hold off


%plot the amplitude of the fringe for sources at [0,2] and [0,x]
fplot(@(x)  calc_fring_from_x(1.2, G_x, dipoles, x),  [0,8]);