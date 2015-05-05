function X = calc_X( w, he0, dipoles )
	%For now omega0 = 1, other const =1

	X = [];

	for dip = dipoles
		X = blkdiag(X, sub_X_j(w, he0, dip));
	end


end




function sub_X_j = sub_X_j(w, he0, dipole_j)
	%create the 2x2 matrix for one dipole

	prefactor = prefactor(w, he0, dipole_j);

	sub_X_j = prefactor * [dipole_j.w_0(he0)/w -1i ; 1i dipole_j.w_0(he0)/w];

end





function prefactor = prefactor(w, he0, dipole_j)
	%calculate the prefactor

	numerator = dipole_j.small_gamma * dipole_j.m_s * w;
	denominator = dipole_j.w_0(he0)^2 - w^2 - 1i*w*dipole_j.damping(he0);

	prefactor = numerator/denominator;

end