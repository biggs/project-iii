function [ equi_dipoles ] = calc_equi_dip_def( no_dipoles, lambda )
%CALC_LIN_DIP_DEF give a set of dipoles on equilateral shape around origin (0.4 away)
	equi_dipoles = [];

	for dip_no = 1:no_dipoles
		equi_dipoles = [equi_dipoles, sim_dip_at(calc_xy_pol(0.4,dip_no*pi/no_dipoles), lambda)];
	end

end



function [ simple_dipole ] = sim_dip_at(R_0, lambda)
	simple_dipole = class_dipole(1, 1, lambda, R_0);	%dipoles have these properties
end



function [ x, y ] = calc_xy_pol( r, theta )
%CALC_XY_POL Convert polar and xy coordinates
	
	x = r * cos(theta);
	y = r * sin(theta);

end

