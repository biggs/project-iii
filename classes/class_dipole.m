classdef class_dipole
    %DIPOLE This is basically just a structure that stores the properties
 
    properties
    	m_s
    	w_0
    	lambda
    	R_0
    end
    
    methods

    	%constructor
    	function obj = class_dipole(m_s, w_0, lambda, R_0)
    		obj.m_s = m_s;
    		obj.w_0 = w_0;
    		obj.lambda = lambda;
    		obj.R_0 = R_0;
    	end
    end
    
end

