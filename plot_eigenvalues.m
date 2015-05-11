function [ V ] = plot_eigenvalues( L, G_x, dipoles, range, to_plot )
%EIGENVALUES find and plot the frequency responses of the eigenvectors
% of L. Also create legend with peaks for each value to help see
% degeneracies. Note we only do this for the natural precession direction
% modes.

	[V,D] = eig(L);  %find eigval/vect - columns of V are vectors

	clf
	hold all
	peak = [];

	for h_no = to_plot(1):to_plot(2)
		h_plot = (V(:,h_no))
		fplot(@(w) calc_power(w,G_x,dipoles,h_plot,1),  range);
		peak = [peak, fminbnd(@(w) - calc_power(w,G_x,dipoles,h_plot,1), 0,2)];
	end

	legend(num2str(peak', 'p=%f'));

end

