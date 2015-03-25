function M = calc_M( w, X, G_x )

	xi = calc_xi( X, G_x);

	M = 0.25*w*( -1i*xi + (-1i*xi)'); %equation 33 M def - NOTE mu0 SET = 1.    FOR NOW M +N!!!!!!

end
