classdef class_dipole
    %DIPOLE This is basically just a structure that stores the properties
 
    properties
    	m_s
    	alpha
    	small_gamma
    	R_0
    end
    
    methods

    	%constructor
    	function obj = class_dipole(m_s, small_gamma, alpha, R_0)
    		obj.m_s = m_s;
    		obj.alpha = alpha;
    		obj.small_gamma = small_gamma;
    		obj.R_0 = R_0;
    	end

        function dam = damping(obj, he0) %have to include this as return
            dam = 2 * obj.small_gamma * obj.alpha * he0;
        end

        function w0 = w_0(obj, he0)
            w0 = obj.small_gamma * he0;
        end


        %return new, moved dipole
        function new_obj = move_dip(obj, R_new)
            new_obj = obj;
            new_obj.R_0 = R_new;
        end


    end
    
end

