clear; clc;
mu = 0.1;
alpha = 0.003;
T = 1000;
tau = 2;
m = 10000;
h = tau / m;
N = round(T / h);
%N = 10000000;
x1 = zeros(1, N + 1);
x2 = zeros(1, N + 1);
x1(1) = 0.1;
x2(1) = 0.1;
x10 = ones(1, m + 1);
x20 = ones(1, m + 1);
I = h*(x2(1)-x1(1))*tau;
for i = 1:N
    x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
    if (i - m - 1<= 0)
        prevX11(i) = x10(i);
        prevX21(i) = x20(i);
    else
        prevX11(i) = x1(i - m - 1); % подумать, тут i-m или i-m-1
        prevX21(i) = x2(i - m - 1);
    end
    prevX12(i) = x1(i);
    prevX22(i) = x2(i);
    I = I - (prevX21(i) - prevX11(i))*h + (prevX22(i) - prevX12(i))*h;
    %I = I - prevX21(i) * h + prevX22(i) * h; 
    x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * I);
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
end

plot(x1(1), x2(1), 'ro');
hold on; 
plot(x1(N + 1), x2(N + 1), 'yo');
hold on;
plot(x1, x2, 'k-');
hold on;

x1(1) = 1;
x2(1) = 1;

I = (x2(1)-x1(1))*tau;
for i = 1:N
    x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
    if (i - m - 1<= 0)
        prevX11(i) = x10(i);
        prevX21(i) = x20(i);
    else
        prevX11(i) = x1(i - m - 1); % подумать, тут i-m или i-m-1
        prevX21(i) = x2(i - m - 1);
    end
    I = I - (prevX21(i) - prevX11(i))*h + (prevX22(i) - prevX12(i))*h;
   % I = I - prevX21(i) * h + prevX22(i) * h; 
    x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i) + alpha * I);
    %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
end

plot(x1(1), x2(1), 'go');
hold on;  
plot(x1(N+1), x2(N+1), 'co'); 
hold on; 
plot(x1, x2, 'b-');
xlabel('x1');
ylabel('x2');