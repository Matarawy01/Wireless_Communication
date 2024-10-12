format long
s11=load ('s11.txt');
s12=load ('s12.txt');
s13=load ('s13.txt');
s14=load ('s14.txt');
S11=s11(:,2)+s11(:,3);
S12=s12(:,2)+s12(:,3);
S13=s13(:,2)+s13(:,3);
S14=s14(:,2)+s14(:,3);
S11_Abs_Sqr=(abs(S11).^2);
S12_Abs_Sqr=(abs(S12).^2);
S13_Abs_Sqr=(abs(S13).^2);
S14_Abs_Sqr=(abs(S14).^2);
numerator=sqrt((S11_Abs_Sqr)+(S12_Abs_Sqr)+(S13_Abs_Sqr)+(S14_Abs_Sqr));
demonirator=sqrt(4);
p=20*log10(numerator./demonirator);
x=s11(:,1);
plot(x,p);