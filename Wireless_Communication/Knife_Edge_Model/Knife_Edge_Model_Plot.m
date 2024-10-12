function [G] = Knife_Edge_Model_Plot(V)
    %Loop for Differant Values of V
    for n =1 : 1 : size(V, 2)
        %In case v < -0.7 Loss = 0
        if V(n) < -0.7
            G(n) = 0;
        else
            %In case v > -0.7 Loss equal This Equation
            G(n) = 6.9 + 20*log10( sqrt( (V(n) - 0.1).^2 + 1) + V(n) - 0.1);
        end
        
    end
    
end