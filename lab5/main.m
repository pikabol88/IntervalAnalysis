addpath(genpath('./m'))

x = [4; 10; 12];       
y = [34; 54; 74];        


epsilon = [8; 9; 11]; 

X = [ x.^0 x ];                               
lb = [-inf 0];                                
irp_steam = ir_problem(X, y, epsilon, lb);

figure
ir_plotbeta(irp_steam)
grid on
set(gca, 'fontsize', 12)
xlabel('\beta_1')
ylabel('\beta_2')

## ¬нешние интервальние оценки параметров модели y = beta1 + beta2 * x 
b_int = ir_outer(irp_steam)

## ¬ершины информационного множества задачи построени€ интервальной регрессии
vertices = ir_beta2poly(irp_steam)

## ƒиаметр и наиболее удаленные вершины информационного множества 
[rhoB, b1, b2] = ir_betadiam(irp_steam)

## ¬нешние интервальние оценки параметров модели y = beta1 + beta2 * x 
b_int = ir_outer(irp_steam)

## “очечные оценки параметров 
b_maxdiag = (b1 + b2) / 2    # как середина наибольшей диагонали информационного множества
b_maxdiag
b_gravity = mean(vertices)   # как центр т€жести информационного множества 
b_gravity
b_lsm = (X \ y)'             # методом наименьших квадратов
b_lsm

plot(b_maxdiag(1), b_maxdiag(2), ';max. diagonals center;mo')
plot(b_gravity(1), b_gravity(2), ';gravity center;k+')
plot(b_lsm(1), b_lsm(2), ';LS;rx')
legend()

figure 
xlimits = [0 25];
ir_plotmodelset(irp_steam, xlimits)     # коридор совместных зависимостей
hold on
ir_scatter(irp_steam,'b.')              # интервальные измерени€

grid on
set(gca, 'fontsize', 12)
xlabel('x')
ylabel('y')

figure 
x_p = [3;6; 9; 15; 22];
ir_plotmodelset(irp_steam, xlimits)
hold on
ir_scatter(irp_steam,'b.')
hold on 
X_p = [x_p.^0 x_p];
y_p = ir_predict(irp_steam, X_p);
y_p
ypmid = mean(y_p,2);
yprad = 0.5 * (y_p(:,2) - y_p(:,1));
ir_scatter(ir_problem(X_p,ypmid,yprad),'k.');
grid on
xlabel('x')
ylabel('y')