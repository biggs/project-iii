function h_at_2 = calc_greens( h_at_1, r1, r2)
	%implement greens function from the source


	h_at_2 = calc_g_matrix(r1,r2)*h_at_1;

end



%this is just a testing function to see the magnetic field generated
%{
function toplot = plotgf()
	toplot = [];

	for x=0.1:0.1:1,
		for y=0.1:0.2:1.1,

			green = greensfun([1,0],[0,0],[x,y]);

			toplot = [toplot; x y green(1) green(2)];
		end
	end

end
%}