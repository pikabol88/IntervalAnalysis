function [W,B]=CutBox(W)
%
% Функция CutBox расширяет брус отрисовки W на 40% 
% (чтобы лучше видеть неограниченность)
% и выбирает брус B обрезки решения вдвое шире бруса отрисовки W 

   radius=[(W(2,1)-W(1,1))/2 (W(2,2)-W(1,2))/2];
   W=W+.4*[-radius; radius];


%% (Matlab делает прямоугольное окно, поэтому при равном масштабе по осям 
%% надо существенно увеличить брус обрезки, чтобы не увидеть саму обрезку -
%% эвристически выбрано увеличение в два раза.
%% Другой выход для бесконечного множества решений не брать равный масштаб 
%% по осям - axis equal.)

   radius=[(W(2,1)-W(1,1))/2 (W(2,2)-W(1,2))/2];
   B=W+2*[-radius; radius];

end