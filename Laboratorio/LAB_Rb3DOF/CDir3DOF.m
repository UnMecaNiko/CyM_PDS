function [Pfin] = CDir3DOF(Angs)
%CDir3DOF Modelo cinemático directo 3DOF
%   función que calcula la posición final de un manipulador antropormórfico
%   de 3 grados de libertad (3DOF).
%   Los parámteros de entrada son los ángulos de las articulaciones
%   La salida corresponde a la posición del estremo final del brazo
%Input:
%   Angs: vector 3x1 con valores de ángulos en radianes
%Output:
%   Pfin: vector 3x1 con coordenadas cartesianas del extremo final del
%   brazo

a = [0 10 10];

A01 = [cos(Angs(1)) 0 sin(Angs(1)) 0;
       sin(Angs(1)) 0 -cos(Angs(1)) 0;
       0 1 0 0;
       0 0 0 1];
A12 = [cos(Angs(2)) -sin(Angs(2)) 0 a(2)*cos(Angs(2));
       sin(Angs(2)) cos(Angs(2)) 0 a(2)*sin(Angs(2));
       0 0 1 0;
       0 0 0 1];
A23 = [cos(Angs(3)) -sin(Angs(3)) 0 a(3)*cos(Angs(3));
       sin(Angs(3)) cos(Angs(3)) 0 a(3)*sin(Angs(3));
       0 0 1 0;
       0 0 0 1];

A03 = A01*A12*A23;

Pfin = A03(1:3,4);
end