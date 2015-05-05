function p = calc_power(w, G_x, dipoles, h)

	%calculate response matrix, M:
	X = calc_X(w,dipoles);

	xi = inv(inv(X) - G_x);

	M = 0.25*w*( -1i*xi + (-1i*xi)');


	%calculate applied field matrix, C:
	C = h*h';

	%calculate power, p
	%(real part, only as small calc uncert => matlab warnings)
	p = real(trace(C*M));
end
