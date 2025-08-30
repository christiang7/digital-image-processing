function [dic] = distance(radius1, angle1, radius2, angle2);
%Abfrage abstände und winkel
%x = r * cos( phi );
%y = r * sin( phi );
%winkel = winkel1 - winkel2;
dic = (radius1^2 + radius2^2 - 2 * radius1 * radius2 * cos( angle1 - angle2 ))^(1 / 2);
