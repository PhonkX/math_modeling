clear; clc;
mu = 0.1;
alpha = 0.7873;
T = 2000;
tau = 2;
m = 10000;
h = tau / m;
N = round(T / h);
%N = 10000000;
x1 = zeros(1, N + 1);
x2 = zeros(1, N + 1);
x1(1) = 0.1;
x2(1) = 0.1;
x10 = ones(1, m);
x20 = ones(1, m);
for i = 1:N
    x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
    if (i - m <= 0)
        prevX1(i) = x10(i);
        prevX2(i) = x20(i);
    else
        prevX1(i) = x1(i - m);
        prevX2(i) = x2(i - m);
    end
    x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * (prevX1(i) - prevX2(i)));
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * prevX2(i));
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
end

plot(x1(1), x2(1), 'ro');
hold on; 
plot(x1(N + 1), x2(N + 1), 'yo');
hold on; 
plot(x1, x2, 'k-');

x1(1) = 1;
x2(1) = 1;

for i = 1:N
    x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
    if (i - m <= 0)
        prevX1(i) = x10(i);
        prevX2(i) = x20(i);
    else
        prevX1(i) = x1(i - m);
        prevX2(i) = x2(i - m);
    end
    x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * (prevX1(i) - prevX2(i)));
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * prevX2(i));
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
end

plot(x1(1), x2(1), 'go');
hold on;  
plot(x1(N+1), x2(N+1), 'co'); 
hold on; 
plot(x1, x2, 'b-');
xlabel('x1');
ylabel('x2');