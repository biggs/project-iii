function [ fringe_amp ] = calc_fringe_amp_from_x( w, G_x, dipoles, x )
%CALC_FRING_FROM_X give the amplitude of the fringe for sources at [0,2] and [0,x]
	srcatx = @(x) class_source([x;2], 0.01*[1;i]);

	source_a = srcatx(0);
	source_b = srcatx(x);

	fringe = calc_fringe(w, G_x, dipoles, source_a, source_b);

	fringe_amp = fringe(1);

end

