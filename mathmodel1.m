mu = 0.1;
T = 6.3288065;
N = 10000000;
h = T / N;

x1 = zeros(1, N + 1);
x2 = zeros(1, N + 1);
x1(1) = 0;
x2(1) = 0.55285046;
for i = 1:N
    x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
    x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
end

fprintf('Found cycle\n');
plot(x1(1), x2(1), 'ro');
hold on;  
plot(x1, x2, 'k-');

X = zeros(2, N+1);
X(:, 1) = [1; 0];
for i = 2: N+1
   A = [mu - 3*x1(i)^2*cos(x1(i))+x1(i)^3*sin(x1(i)) 1;
        -1 mu];
   X(:, i) = X(:, i - 1) + h * A*X(:, i - 1); 
end
fprintf('Solved the system for the first time\n');
C0 = zeros(2);
C0(:, 1) = X(:, N + 1);
X(:, 1) = [0; 1];
for i = 2: N+1
   A = [mu - 3*x1(i)^2*cos(x1(i))+x1(i)^3*sin(x1(i)) 1;
        -1 mu];
   X(:, i) = X(:, i - 1) + h * A*X(:, i - 1); 
end
fprintf('Solved the system for the second time\n');
C0(:, 2) = X(:, N + 1);
l = eig(C0)

integral = 0;
for i = 1:N+1
   integral = integral + h*(mu - 3*x1(i)^2*cos(x1(i))+x1(i)^3*sin(x1(i)) + mu); 
end
integral