%******** archive of this code for now*********



poss_sourc = [];
for x_cord = [-5:1:4]
	 poss_sourc = [poss_sourc; [class_source([5,2], [1,1], 0), class_source([x_cord,2], [1,1], 0)]];
end

He_matrix = calc_HE_matrix(dipoles, poss_sourc );

A_matrix = He_matrix' * calc_M(1.2, calc_X(1.2,dipoles), G_x) * He_matrix;

[U,S,V] = svd(He_matrix);
%He_dual = U * pinv(S) * V';

M = calc_M(omega, calc_X(omega,dipoles), G_x)
	[V,D] = eig(M)



	   fplot(@(omega) calc_Xnm( omega, G_x, dipoles,sources),   [0,2]);
