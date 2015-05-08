 %---------(1) fringe from two sources, simply rotating relative phase---------------
w = 0.6;
%{
src1 = class_source([2;2], [1;-i]);
src2 = class_source([3;2], [1;-i]);
no_src = class_source([128;128],[0;0]);

hold all
fplot(@(phase)  calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles, [src1,src2], phase)),1),  [0,2*pi]);
fplot(@(phase)  calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[src1, no_src],0)),1)+calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[src2, no_src],0)),1),  [0,2*pi])

%check our fringe function
fringe = calc_fringe( w, G_x, dipoles, src1, src2 )
%}


%------------(2) visibility from moving along y=2 line (sources at [0,2] and [0,x])---------
%fplot(@(x)  calc_fringe_amp_from_x(1.2, G_x, dipoles, x),  [0,8]);

fplot(@(x) calc_visibility( w, G_x, dipoles, class_source([0;2], [1;-i]), class_source([x;2], [1;-i]) ),    [-5,5]);




%moving a source along line with other fixed. vary source locations/orient/ phase diff for funky results
%fplot(@(x) calc_power(1.4,G_x,dipoles,   calc_ss_h(calc_he(dipoles,  [class_source([x;2], [1;-i]), class_source([0;-2], [1;-i])]  ,pi/2))   ,1), [-3,3]);

%plot the fringe visibility
%fplot(@(x)   calc_fringe( 1.1, G_x, dipoles, class_source([x;2],[1;-i]), class_source([0;-2],[1;-i]) ),    [-10,10])
