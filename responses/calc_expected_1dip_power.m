function [ power ] = calc_expected_1dip_power( w, w_0, gamma, h )
%CALC_EXPECTED_1DIP_POWER Summary of this function goes here

	denom = (w^2)*(((w_0^2)/(w^2)) - 1 )^2 + gamma^2;
	
	prefact = 0.5 * w * gamma / denom;

	matrix = h' * [w_0/w -1i; 1i w_0/w] * h;


	power = prefact*matrix;

end