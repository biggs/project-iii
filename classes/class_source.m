classdef class_source
    %SOURCE This describes a source
    
    properties
    	posit = [128,128];
    	orient = [0,0];

    end
    
    methods

        	%constructor
    	function obj = class_source(posit,orient)
    		obj.posit = posit;
    		obj.orient = orient;
    	end
    end
    
end

