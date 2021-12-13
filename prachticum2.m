begin = 0;
eind = 7;

w_0 = 0;
w_eind = 5;


h = 0.01;
n = 2;
x = begin:h:eind;

K = (-2*eye(n)+diag(ones([n-1,1]),-1) + diag(ones([n-1,1]),-1)) / h^2;

v = q(x(2:n+1));
M = diag(v);

A = K+M;

f = p(x(2:n+1));
f(1) = f(1)-w_0/h^2;
f(n) = f(n)-w_eind/h^2;

w = A/f;
w(2:n+1) = w(1:n);
w(1) = w_0;
w(n+2) = w_eind;

plot(x,w)

function output = q(x)
    output = sin(x);

end

function output = p(x)
    output = sin(x);

end


