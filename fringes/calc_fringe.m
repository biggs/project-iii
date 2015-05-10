function [ fringe ] = calc_fringe( w, G_x, dipoles, source_a, source_b )
%CALC_FRIN_AMP give the amplitude and phase of the fringe

	%define below to clean up code
	no_src = class_source([128;128],[0;0]);
	p_sources = @(sources,phase) calc_power(w, G_x, dipoles, calc_ss_h(calc_he(dipoles,sources,phase)),1);


	%power from various source configs
	p_src_1   = p_sources([source_a, no_src],0);
	p_src_2   = p_sources([source_b, no_src],0);
	p_srcs_0  = p_sources([source_a, source_b],0);
	p_srcs_90 = p_sources([source_a, source_b],pi/2);
	p_comb = p_src_1 + p_src_2;



	p_vector = [p_srcs_0-p_comb, p_srcs_90-p_comb];

	fringe = [norm(p_vector), atan(p_vector(2)/p_vector(1)), p_comb];
	%this is equal to [2|a_nm|, -arg(a_nm), a_nn+a_mm]


end