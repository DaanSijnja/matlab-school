clear all

begin = 0;
eind = 2.5;
y_0 = 3;
h = 0.01;
w(1) = y_0;
x = begin:h:eind;

y=3*exp(1-cos(x.^3));
MSE = 1/length(x)*sum((w-y).^2);

for i = 1 : length(x)-1
	w(i+1)=w(i)+h*f(x(i),w(i));
end;



x1=begin:h:eind;
 %initialiseer w en predictor
w1(1)=y_0;
wp=y_0; %predictor
for i=1:length(x1)-1
	wp=w1(i)+h*f(x1(i),w1(i));
	w1(i+1)=w1(i)+h/2*(f(x1(i),w1(i))+f(x1(i+1),wp));
end;




plot(x,w,x1,w1), legend('Voorwaarst Euler','Modify Euler')


function b = f(x,y)
       b = 3*y*(x^2)*sin(x^3);
end


