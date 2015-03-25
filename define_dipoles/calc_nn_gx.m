function [ gx ] = calc_nn_gx(no_dipoles, coupling_strength, end_coupling)
%CALC_NN_GX generates the gx for dipole couplings. end_coupling can make a 'ring'

	couplings = zeros(no_dipoles);

	for row = 1:(no_dipoles-1)
		couplings(row,row+1) = 1;
		couplings(row+1,row) = 1;
	end

	if end_coupling
		couplings(1,no_dipoles) = 1;
		couplings(no_dipoles,1) = 1;
	end


	gx = coupling_strength * kron(couplings, eye(2));

end

