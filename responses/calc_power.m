function p = calc_power(w, G_x, dipoles, h)

	%calculate M
	X = calc_X(w,dipoles);

	M = calc_M(w, X, G_x);


	%calculate H:
	H = h*h';

	%calculate p
	p = real(trace(H*M));  %only taking real part because v. small calc uncertainties cause matlab warnings
end
