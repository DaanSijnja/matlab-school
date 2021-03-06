clear all

L = 0.002;                                      % L van de spoel in H
C = 0.0003;                                     % C van de condensator in F

begin = 0;                                      % Begin bij 0
eind = 5;                                       % Eindig bij 5

I_0 = 0.2;                                      % Bekende waarde op I(0) is 0.2A
I_5 = 0.4;                                      % Bekende waarde op I(5) is 0.4A
    
h = 0.0001;                                     % Stap grote is 0.0001 

I = begin:h:eind;                               % Maak een Array I die loopt van begin tot eind met stapgrote h

n = length(I) - 2;                              % Bereken N aan de hand van de lengte van I

K = ( -2*eye(n) + diag(ones([n-1,1]),-1) + diag(ones([n-1,1]),1) ) / h^2; 
                                                % Maak een matrix K 

% Maak een matrix met  
v = ( (1 / C ) / L )*ones([n,1]);               %                        
M = diag(v);                                    % Maak een diagonale matrix van v

A = K + M;                                      % Maak matrix A uit M en K

f = bron(I(2:n+1),L)';                          % Bereken matrix f en transpose deze
f(1) = f(1)-I_0/h^2;                            
f(n) = f(n)-I_5/h^2;


% Bereken de oplossing
w = A \ f;
w(2:n+1) = w(1:n);

w(1) = I_0;
w(n+2) = I_5;

plot(I,w)                                           % Plot de Grafiek


function output = bron(t,L)                         % Functie voor de bron spanning
    output = (2*cos(10*t))/L;                       % Nog delen door L

end