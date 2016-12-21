clear; clc;
mu = 0.1;
alpha = 0.2624;
T = 1000;
tauMax = 2;
m = 10000;
h = tauMax / m;
N = round(T / h);
%N = 10000000;
x1 = zeros(1, N + 1);
x2 = zeros(1, N + 1);
x1(1) = 0.1;
x2(1) = 0.1;
x10 = ones(1, m + 1);
x20 = ones(1, m + 1);

t = 0:h:T;

% TODO: доделать
for i = 1:N
        x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
   
        %prevX1 = x10(i);
        %prevX2 = x20(i);
        index = floor((t(i) - (exp(-t(i)) + 1))/h) + 1;
        if (index <= 0)
            prevX1 = x10(m + index + 1);
            prevX2 = x20(m + index + 1);
        else
            prevX1 = x1(index);
            prevX2 = x2(index);
        end
    %x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i))) + alpha*  prevX1;
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * prevX2);
    x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * (prevX2 - prevX1));
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
        %prevX1 = x10(i);
        %prevX2 = x20(i);
        index = floor((t(i) - (exp(-t(i)) + 1))/h) + 1;
        if (index <= 0)
            prevX1 = x10(m + index + 1);
            prevX2 = x20(m + index + 1);
        else
            prevX1 = x1(index);
            prevX2 = x2(index);
        end
        %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * prevX2);
        x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * (prevX2 - prevX1));
end

plot(x1(1), x2(1), 'go');
hold on;  
plot(x1(N+1), x2(N+1), 'co'); 
hold on; 
plot(x1, x2, 'b-');
xlabel('x1');
ylabel('x2');