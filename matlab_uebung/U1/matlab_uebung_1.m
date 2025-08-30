% a.) Random matrix
Random_Mat = rand(3,3)
% b.)
% rank of matrix
Determ = det(Random_Mat)
Rank = rank(Random_Mat)
% Dimension of Matrix
Dimen = size(Random_Mat)
% Maximum and Minimum of Matrix numbers
Max = max(max(Random_Mat))
Min = min(min(Random_Mat))
% c.) Solving linear equations
% cconvert the linear system in matrices
A = [2,5,-9,3;5,6,-4,2;3,-4,2,7;11,7,4,-8]
B = [151;103;16;-32]
% the solving vector
X = linsolve(A,B)
% d.) volume and surface of a phere with r = 15
r = 15
%surface
A = 4*pi*r^2
% Volume
V = 4/3*pi*r^3
% circle
% radius
U = 128
R = U/(2*pi)
A = pi*R^2
% Plotting in MATLAB
% 3 a.)
x = -5:0.1:5;
y_1 = 7*x.^3 + 5*x.^2 -10;
plot(x,y_1)
% b.)
y_2 = 3*log(x)-4*exp(x);
plot(x,y_2)
plot(x,y_1)
% c.)
y_3 = 5*x + sin(x) +9*cos(x);
plot(x,y_3)
plot(x,y_1,y_2,y_3)
plot(x,y_1,y_2,y_3)
plot(x,y_1,x,y_2,x,y_3)
ylabel('velocity v [m/s]');
xlabel('angle \phi [Grad]')
plot(x,y_3)
xlabel('angle \phi [Grad]');
ylabel('velocity v [m/s]');
plot(x,y_3)
p = plot(x,y_3)
ylabel('velocity v [m/s]');
% fertig
