function xi = calc_xi( X , G_x )
	%note this is causing a problem as near w = w_0 X is almost singular - it also completely breaks at modes

	xi = inv(inv(X) - G_x);

end

