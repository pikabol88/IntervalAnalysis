function [A,b,cnmty] = ClearRows(A,b)
%
% Функция ClearRows пересматривает строки 
% системы линейных неравенств Ax >= b, где  
%   A - прямоугольная вещественная матрица, 
%   b - вектор с элементами из расширенной числовой прямой.
% Выход - 
%   система (новые матрица A и вектор b), эквивалентная исходной,
%   и параметр cnmty (Control of NoneMpTiness), который 
%   контролирует совместность исходной системы неравенств. 
%   Параметр cnmty принимает значения
%     true - система возможно совместна 
%            (т.е. множество решений может быть непустым),
%     false - система несовместна 
%            (т.е множество решений пусто).
%   Если на выходе параметр cnmty равен true, то новая система 
%   неравенств не содержит нулевых строк-коэффициентов в A и 
%   бесконечностей в правой части b.

   [m,n] = size(A);
   cnmty = true;
   p = [];

   for i=1:m

      if b(i)==Inf
         cnmty = false;
         return;
      end
      if b(i)==-Inf
         p = [p i];
         continue;
      end

%      if single(A(i,:)) == zeros(1,n)
      if max(abs(A(i,:)))<1.e-8
         p = [p i];
%         if 0 < b(i)
         if b(i)>1e-12
            cnmty = false;
            return;
         end
      end
   end
   
   A(p,:) = [];
   b(p,:) = [];
               
end                
