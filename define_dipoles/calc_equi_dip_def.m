function [ equi_dipoles ] = calc_equi_dip_def( no_dipoles, dipole_type )
%CALC_LIN_DIP_DEF give a set of dipoles on equilateral shape around origin (0.4 away)
	equi_dipoles = [];
	radius = 0.4;

	for dip_no = 1:no_dipoles
		theta = dip_no*pi/no_dipoles;
		new_pos = radius*[cos(theta);sin(theta)];
		equi_dipoles = [equi_dipoles, dipole_type.move_dip(new_pos)];
	end

end
