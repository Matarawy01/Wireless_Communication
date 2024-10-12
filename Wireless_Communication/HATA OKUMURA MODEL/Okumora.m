function pl=Okumora(fc,d,hb,hm,envtype)
% to make input string as lower letters
% to esnure that this string is identical to our conditon %
envtype = lower(envtype);
% to check what the string is Added %
    switch envtype
        case 'open'
            aHm=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8);
            c=-4.78*(log10(fc)).^2+18.33*log10(fc)-40.98;
        case 'suburban'
            aHm=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8);
            c=-2*(log10(fc/28)).^2-5.4;
        case 'smallcity'
            c=0;    
            aHm=(1.1*log10(fc)-0.7)*hm-(1.56*log10(fc)-0.8);    
        case 'metropolitan'
            c=0;
            if fc<=200;
                aHm=8.29*(log10(1.54*hm))^2-1.1;
            else
                aHm=3.2*(log10(11.75*hm))^2-4.92;
            end
        otherwise, error('invalid');
    end
% The factors A,B,C depend on
% the frequency of transmission(fc) antenna heights(hb) and the type of
% environment(aHm)
A= 69.55 + 26.16*log10(fc) - 13.82*log10(hb) - aHm;
B= 44.9 - 6.55*log10(hb);
% The generic expression for path loss (PL) in dB %
pl= A + B*log10(d) + c;

end