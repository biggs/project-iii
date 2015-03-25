function [ fringe ] = calc_fringe( w, G_x, dipoles, source_a, source_b )
%CALC_FRIN_AMP 

	no_source = class_source([128,128],[0,0]);



	p_src_1 = calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[source_a, no_source],0)));
	p_src_2 = calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[source_b, no_source],0)));

	p_comb = p_src_1 + p_src_2;

	p_srcs_0 = calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[source_a, source_b],0)));
	p_srcs_90 = calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,[source_a, source_b],pi/2)));


	p_vector = [p_srcs_0-p_comb, p_srcs_90-p_comb];

	fringe = [norm(p_vector), atan(p_vector(2)/p_vector(1))];


end

