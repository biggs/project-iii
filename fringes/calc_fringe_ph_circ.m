function [ fringe_phase ] = calc_fringe_ph_circ( w, G_x, dipoles, theta )
%CALC_FRINGE_PH_CIRC give the phase of the fringe for sources at [0,2] and rotated by theta
	
	srcatang = @(ang) class_source(2*[cos(ang);sin(ang)], [0.01;0.05]);

	source_a = srcatang(0);
	source_b = srcatang(theta);

	fringe = calc_fringe(w, G_x, dipoles, source_a, source_b);

	fringe_phase = fringe(2);

end