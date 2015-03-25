function [ He_matrix ] = calc_He_matrix( dipoles, possible_sources )
%CALC_HE_MATRIX 

	He_matrix = [];

	for poss = possible_sources'
		He_matrix = [He_matrix; calc_he( dipoles, poss )];
	end

	He_matrix = He_matrix';

end

