function [ F ] = calc_anim( dipoles, m, w )
%CALC_ANIM S

	dip_pos = [];
	for dip = dipoles
		dip_pos = [dip_pos, dip.R_0];
	end



	for j = 1:50
		arrow = calc_arrows( dip_pos, m, w, j/10);

		arrow_annot = [];

		for arr = 1:2:(numel(dip_pos)-1)
			arrow_annot = [arrow_annot, annotation('arrow', arrow(arr,:), arrow(arr+1,:))];
		end
		
		%get frame and delete objects
		F(j) = getframe;
		delete(arrow_annot);
	end


end

