mu = 0.26;
T = 100; % определяем
N = 10000000;
h = T / N;

%for j = 1:10
    %m = mu + 0.1;
    x1 = zeros(1, N + 1);
    x2 = zeros(1, N + 1);
    x1(1) = 0;
    x2(1) = 4;
    for i = 1:N
        x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
        x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
    end
    %figure
    plot(x1(1), x2(1), 'ro');
    hold on;
    plot(x1, x2, 'k-');
    hold on;
    
    
    x1(1) = 7;
    x2(1) = 70;
    for i = 1:N
        x1(i + 1) = x1(i) + h * (mu * x1(i) + x2(i) - x1(i)^3 * cos(x1(i)));
        x2(i + 1) = x2(i) + h * (-x1(i) + mu * x2(i));
    end
    %figure
    plot(x1(1), x2(1), 'go');
    hold on;
  plot(x1, x2, 'b-');