function [ linear_dipoles ] = calc_lin_dip_def( no_dipoles, lambda )
%CALC_LIN_DIP_DEF give a set of linear dipoles evenly spaced from -0.4 to 0.4 on x axis
	linear_dipoles = [];

	for x = -0.4:(0.8/(no_dipoles-1)):0.4
		linear_dipoles = [linear_dipoles, sim_dip_at([x,0], lambda)];
	end

end

function [ simple_dipole ] = sim_dip_at(R_0, lambda)
	simple_dipole = class_dipole(1, 1, lambda, R_0);	%dipoles have these properties
end