 %---------(1) fringe from two sources, simply rotating relative phase---------------
w = 1.1;

src1 = class_source([2;2], 100*[1;i]);
src2 = class_source([3;2], 100*[1;i]);
no_src = class_source([128;128],[0;0]);

figure;
hold on
fplot(@(phase)  calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles, [src1,src2], phase)),1),  [0,2*pi]);
fplot(@(phase)  calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[src1, no_src],0)),1)+calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[src2, no_src],0)),1),  [0,2*pi])
hold off

%check our fringe function
fringe = calc_fringe( w, G_x, dipoles, src1, src2 )



%------------(2) visibility from moving along y=2 line (sources at [0,2] and [0,x])---------

% figure; fplot(@(x) calc_visibility( w, G_x, dipoles, class_source([0;2], [1;i]), class_source([x;2], [1;i]) ),    [-5,5]);


%---------------(3) for circularly placed sources ------------
%{
w = 0.6;

src1 = class_source([2;2], [1;i]);
src2 = class_source([3;2], [1;i]);
no_src = class_source([128;128],[0;0]);

hold all
fplot(@(phase)  calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles, [src1,src2], phase)),1),  [0,2*pi]);
fplot(@(phase)  calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[src1, no_src],0)),1)+calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[src2, no_src],0)),1),  [0,2*pi])

%check our fringe function
fringe = calc_fringe( w, G_x, dipoles, src1, src2 )
%}