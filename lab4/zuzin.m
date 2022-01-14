C = kinterval([1, -1;3, 2], [2, -3;4, 3]);
d = kinterval([-22;18],[2;40]);


%Zuzin 
E = innerminus(C, diag(diag(C)));
n = 15;
x = kinterval([-5; 0], [6; 20]);
figure
plot([inf(x(1)), inf(x(1)), sup(x(1)), sup(x(1)), inf(x(1))], [inf(x(2)), sup(x(2)), sup(x(2)), inf(x(2)), inf(x(2))], 'b')
hold on
plot(mid(x(1)), mid(x(2)))
hold on

x_seq = [x];
invD = diag(inv(diag(C)));
for i=1:n-1
    x = invD * innerminus(d, E * x);
    x_seq = [x_seq x];
    plot([inf(x(1)), inf(x(1)), sup(x(1)), sup(x(1)), inf(x(1))], [inf(x(2)), sup(x(2)), sup(x(2)), inf(x(2)), inf(x(2))])
    hold on
    plot(mid(x(1)), mid(x(2)))
    hold on
end
x

x = invD * innerminus(d, E * x);
x_seq = [x_seq x];
plot([inf(x(1)), inf(x(1)), sup(x(1)), sup(x(1)), inf(x(1))], [inf(x(2)), sup(x(2)), sup(x(2)), inf(x(2)), inf(x(2))], 'r')
hold on
plot(mid(x(1)), mid(x(2)))
hold on

figure
rads = rad(x_seq);
plot(rads(1, :))
hold on
plot(rads(2, :))
hold on
legend('x1', 'x2')
