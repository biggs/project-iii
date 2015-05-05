function p = calc_power(w, G_x, dipoles, h, he0)

	%he0 = 1;


	%calculate response matrix, M:
	L = calc_L( w, he0, G_x, dipoles );


	%calculate applied field matrix, C:
	C = h*h';

	%calculate power, p
	%(real part, only as small calc uncert => matlab warnings)
	p = real(trace(C*L));
end
