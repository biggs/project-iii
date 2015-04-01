%{ %---------(1) fringe from two sources, simply rotating relative phase---------------
srcatx = @(x) class_source([x,2], [0.01,0.05]);
no_source = class_source([100,100],[0,0]);

clf
hold all
fplot(@(phase)  calc_power(1.2, G_x, dipoles, calc_ss_h(calc_he(dipoles, [srcatx(2),srcatx(3)], phase))),  [0,2*pi]);
fplot(@(phase)  calc_power(1.2, G_x, dipoles, calc_ss_h(calc_he(dipoles,[srcatx(2), no_source],0)))+calc_power(1.2, G_x, dipoles, calc_ss_h(calc_he(dipoles,[srcatx(3), no_source],0))),  [0,2*pi])
hold off
  %}



%------------(2) amplitude of fringe from moving along y=2 line (sources at [0,2] and [0,x])---------
fplot(@(x)  calc_fringe_amp_from_x(1.2, G_x, dipoles, x),  [0,8]);


