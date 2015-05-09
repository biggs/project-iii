function [ h_ss ] = calc_ss_h( h )
%CALC_SS_H Calculate the soley positive going equivalent of a given h

	h_ss = [];
	h = h.';

	for x = 1:(size(h')/2)
		a = 0.5 * (h(2*x-1) - 1i*h(2*x));
		h_ss = [h_ss; a; 1i*a];
	end

	if norm(h_ss) < 10^-10
		h_ss(:) = 0;
	end


end

