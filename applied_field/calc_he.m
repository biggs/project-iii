function [ he ] = calc_he( dipoles, sources, phase_diff )
%CALC_HE calculate h_ext, the external field at each dipole

	s1 = sources(1);
	s2 = sources(2);

	he = [];
	for dip = dipoles
		h1 = calc_greens(s1.orient, s1.posit, dip.R_0);
		h2 = calc_greens(s2.orient, s2.posit, dip.R_0);
		
		single_dip_he =  h1 + exp(i*phase_diff) * h2;
		
		he = [he; single_dip_he(1); single_dip_he(2)];
	end



end

