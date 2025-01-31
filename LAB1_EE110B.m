% question one: part one 

n = 0:50
x = cos((pi/2) * n);

stem(n,x)
xlabel('n')
ylabel('x[n]');
title('plot of x[n] = cos(pi/2 *n');

%question one: part two

n = 0:50
x = cos(5*pi/2 *n);

stem(n,x);
xlabel('n');
ylabel('x[n');
title('plot of x[n] = cos((5pi/2) * (n))');

%question one: part three 
n = 0:50
x = cos(pi*n);

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = cos(pi*n)');

%question one: part four
n = 0:50
x = cos(0.2*n);

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = cos(0.2 * n)');

%question one: part five 
n = 0:50
x = 0.9.^n.* cos(pi/5 * n);

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = 0.9^n * cos(pi/5 * n)');

%question one: part six 
n = 0:50
x = 1.1.^n .*cos(pi/5 * n);

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = 1.1. ^n . * cos(pi/5 *n)');

%question one: part seven
n = 0:50
x = cos(pi/5 * n).*cos(pi/25 * n);

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = cos(pi/25 * n)');

%question one: part eight 
n = 0:50
x = cos(pi/100 * n.^2);

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = cos(pi/100 * n.^2)'); 

%question one: part nine 
n = 0:50
x = (cos(pi/5 * n)).^2;

stem(n,x);
xlabel('n');
ylabel('x[n]');
title('plot of x[n] = (cos(pi/5 8 n)).^2');

n = 0:50; 
figure; 

%% Question 2 - Part 1: Even and Odd Components
x = rand(1, length(n));

Xe = (x + flip(x)) / 2;
Xo = (x - flip(x)) / 2;

subplot(5,2,1);
stem(n, Xe);
title('Even Component Xe[n]');
xlabel('n');
ylabel('Xe[n]');
grid on;

subplot(5,2,2);
stem(n, Xo);
title('Odd Component Xo[n]');
xlabel('n');
ylabel('Xo[n]');
grid on;

%% Question 2 - Part 2: Time Scaling x[2n]
n = 0:25;
x = rand(1, length(n));

subplot(5,2,3);
stem(n, x);
title('Original Sequence x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(5,2,4);
stem(2*n, x);
title('Scaled Sequence x[2n]');
xlabel('n');
ylabel('x[2n]');
grid on;

%% Question 2 - Part 3: Time Scaling x[5n]
n = 0:10;
x = rand(1, length(n));

subplot(5,2,5);
stem(n, x);
title('Original Sequence x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(5,2,6);
stem(5*n, x);
title('Scaled Sequence x[5n]');
xlabel('n');
ylabel('x[5n]');
grid on;

%% Question 2 - Part 4: Summation of Delayed Sequences
n = 4:50;
x = rand(1, length(n));
sum_x = zeros(1, length(n)); 
m = 0:4;

for i = 1:length(n)
    for j = 1:length(m)
        idx = n(i) - m(j);
        if idx >= 1 && idx <= length(x) 
            sum_x(i) = sum_x(i) + x(idx);
        end
    end
end

subplot(5,2,7);
stem(n, x);
title('Original Sequence x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(5,2,8);
stem(n, sum_x);
title('Summation \Sigma_{m=0}^{4} x[n-m]');
xlabel('n');
ylabel('Sum');
grid on;

%% Question 2 - Part 5: Product of x[n] and x[-n]
n = 0:50;
x = rand(1, length(n) + 50);


x_extended = [zeros(1, length(n)), x];      
x_extended(length(n) + 1) = 0;              

product_sequence = zeros(size(n));          

for m = -50:50
    for i = 1:length(n)
        idx1 = m + length(n);
        idx2 = n(i) - m + length(n);
        
        % Check for valid indices
        if idx1 >= 1 && idx1 <= length(x_extended) && ...
           idx2 >= 1 && idx2 <= length(x_extended)
            product_sequence(i) = product_sequence(i) + x_extended(idx1) * x_extended(idx2);
        end
    end
end

subplot(5,2,9);
stem(n, x(1:length(n)));
title('Original Sequence x[n]');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(5,2,10);
stem(n, product_sequence);
title('Product Sequence x[n] * x[-n]');
xlabel('n');
ylabel('x[n] * x[-n]');
grid on;

