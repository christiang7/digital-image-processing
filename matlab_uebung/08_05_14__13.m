%-- 08.05.2014 13:00:24 --%
% starten
pic = 1;
%matrix mit pic definiert
% heute guter tag
pic < 100
der = pic < 100;
pic = [1, 10, 500, 1]
der = pic < 100;
der
pic1 = imread('elefant1.jpg');
pic2 = imread('elefant2.jpg');
pic = rgb2gray('elefant.jpg');
pic = imread('elefant.jpg');
pic = rgb2gray(pic);
pic1 = pic(1:250,1:250);
% 1. umwandeln in gray
pic = rgb2gray(pic);
% ausschneiden von 1 bis 250 in x und y richtung
pic1 = pic(1:250,1:250);
pic2 = pic(1:250,250:499);
minuspic = minus(pic1,pic2);
imshow(minuspic);
minuspic = minus(pic2,pic1);
imshow(minuspic);
% voneinander abziehen
%jetzt alle hellen strukturen herausnehmen
pic2 = pic(1:250,251:499);
minuspic = minus(pic2,pic1);
pic2 = pic(1:250,250:499);
pic2 = pic(1:250,249:498);
minuspic = minus(pic2,pic1);
imshow(minuspic);
minuspic = minus(pic1,pic1);
imshow(minuspic);
pic = imread('esel.jpg');
pic = rgb2gray(pic);
pic1 = pic(1:198,1:250);
pic2 = pic(1:198,250:499);
minuspic = minus(pic2,pic1);
imshow(minuspic);
s = size(pic);
s = size(pic)
bwlabel
