function [ arrows ] = calc_arrows( dipole_positions, m, w, t )
%CALC_ARROWS matrix with 
%for a start, only one arrow. dipoles must be in 1x1 xy positive quadrant

	rotated_m = 0.1 * exp(i*w*t) * m;
	
	arrow_start = dipole_positions;

	arrow_finish = arrow_start;

	for row_m = 1:2:numel(rotated_m)
		arrow_finish(row_m) = arrow_start(row_m) + real(rotated_m(row_m));
		arrow_finish(row_m+1) = arrow_start(row_m+1) + imag(rotated_m(row_m+1));
	end


	arrows = [arrow_start.' , arrow_finish.' ];

end

