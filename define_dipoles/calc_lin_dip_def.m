function [ linear_dipoles ] = calc_lin_dip_def( no_dipoles, dipole_type )
%CALC_LIN_DIP_DEF reproduces dipole_type linearly evenly spaced from -0.4 to 0.4 on x axis
	linear_dipoles = [];

	for x = -0.4:(0.8/(no_dipoles-1)):0.4
		linear_dipoles = [linear_dipoles, dipole_type.move_dip([x;0])];
	end

end
