function X = calc_X( w, dipoles )
	%For now omega0 = 1, other const =1

	X = [];

	for dip = dipoles
		X = blkdiag(X, sub_X_j(w, dip));
	end


end




function sub_X_j = sub_X_j(w, dipole_j)
	%create the 2x2 matrix (cell?) for one dipole

	prefactor = prefactor(w, dipole_j);

	sub_X_j = prefactor * [dipole_j.w_0/w -1i ; 1i dipole_j.w_0/w];

end





function prefactor = prefactor(w, dipole_j)
	%calculate the prefactor in eqn 26

	%set overall mag field
	He0 = 1;


	numerator = dipole_j.m_s * dipole_j.w_0 * w / He0;
	denominator = dipole_j.w_0^2 - w^2 - 1i*w*dipole_j.lambda;

	prefactor = numerator/denominator;

end