function h_at_2 = calc_greens( h_at_1, r1, r2)
	%implement greens function from the source

	R = r2 - r1;

	R_n = norm(R)

	G = (3*(R*R.')/(R_n^2) - eye(2)) / (R_n^3)

	h_at_2 = G*h_at_1;

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