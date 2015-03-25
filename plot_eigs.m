%-------find RESPONSES eigenvectors - only the physical ones - for system------
omega = 1.2;	%set an omega to work with - pretty arbitrary

M = calc_M(omega, calc_X(omega,dipoles), G_x);  %calc response matrix for sys
[V,D] = eig(M);  %find eigval/vect - columns of V are vectors

%output the physical V and D (half the size):
eigenvect = V(:,size(V)/2+1:size(V))
eigenvals = D(size(V)/2+1:size(V),size(V)/2+1:size(V));


%create a virtual function @(omega) returning values of power_abs vs omega with current settings between 0->2
%also find maxima

clf
hold all
peak = [];

for h_no = 1:size(eigenvect(:,1))/2
	h_plot = calc_ss_h(eigenvect(:,h_no));
	fplot(@(w) calc_power(w,G_x,dipoles,h_plot) + 0,   [0,2]);		%add h_no on in a hack to see differences
	peak = [peak, fminbnd(@(w) - calc_power(w,G_x,dipoles,h_plot), 0,2)];
end

hold off;

legend(num2str(peak', 'p=%f'));
