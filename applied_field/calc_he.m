function [ he ] = calc_he( dipoles, sources, phase_diff )
%CALC_HE Summary of this function goes here
%   Detailed explanation goes here

	he = [];
	for dip = dipoles
		single_dip_he = calc_greens(sources(1).orient, sources(1).posit, dip.R_0) ...
		+ exp(i*phase_diff) * calc_greens(sources(2).orient, sources(2).posit, dip.R_0);

		he = [he; single_dip_he(1); single_dip_he(2)];
	end



end

