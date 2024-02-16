Target = vpa(Target);
s1=0;
s2=0;
for(i=1:25)
	s1=s1+((Target(i)-Output(i))^2);
	s2=s2+(Target(i)^2);
end
s1=s1^(1/2);
d=s1/(s2^(1/2));
ans=d