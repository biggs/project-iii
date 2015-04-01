% ------- choose source positions ---------
%first do in circle

sources = [];
theta_step = 2*pi/ 12;

for theta = 0:0.2*pi:2*pi
	sources = [sources, class_source(3*[cos(theta),sin(theta)], 0.1*[1,-i])];
end

sources