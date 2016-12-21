mu = 0.1;
T = 1000; % определяем
N = 1000000;
h = T / N;
sigma = -0.21;


%for j = 1:10
    %m = mu + 0.1;
    x1 = zeros(1, N + 1);
    x2 = zeros(1, N + 1);
%    x1(1) = 0.1;
    x1(1) = 0.1 + sigma * randn(1);
    %x2(1) = 0.1;
    x2(1) = 0.1 + sigma * randn(1);
    for i = 1:N
        x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
        %x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i))) + sigma*sqrt(h)*randn(1); 
        %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i)) + sigma*sqrt(h)*randn(1);
        x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
    end
    %figure
    plot(x1(1), x2(1), 'ro');
    hold on;
    plot(x1, x2, 'k-');
    hold on;
    plot(x1(N+1), x2(N+1), 'co');
    
    %x1(1) = 1;
    x1(1) = 1 + sigma * randn(1);
    %x2(1) = 1;
    x2(1) = 1 + sigma * randn(1);
    for i = 1:N
        x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
        %x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i))) + sigma*sqrt(h)*randn(1); 
        %x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i)) + sigma*sqrt(h)*randn(1);
        x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
    end
    %figure
    plot(x1(1), x2(1), 'go');
    hold on;
plot(x1, x2, 'b-');
plot(x1(N+1), x2(N+1), 'yo');