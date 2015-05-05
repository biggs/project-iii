% Calculate the field distribution

%what i need is a function that takes, x, y, 



x = linspace(-1,1);
y = linspace(-1.5,1.5);

for i = 1:size(x')
	for j = 1:size(y')
	
		Z(i,j) = norm(real(calc_greens([1,-i],[1,1],[x(i),y(j)])+calc_greens([1,-i],[0.5,0.5],[x(i),y(j)])));
	
	end
end


indices = find(abs(Z)>100);
Z(indices) = NaN;


figure
surf(x,y,Z)
view(3)