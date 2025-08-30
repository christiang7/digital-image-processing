%-- 08.05.2014 15:13:23 --%
picture = imread('loewe.jpg');
mis = search(picture);
search
mis = search(picture);
si = size(picture)
mis = search(picture);
si(2)/2
mis = search(picture);
mis = search(picture)
picture = imread('spinne.jpg');
mis = search(picture)
picture = imread('esel.jpg');
mis = search(picture)
hist(picture)
picture = rgb2gray(picture);
hist(picture)
imhist(picture)
%damit wurde ein Histogramm erstellt
histoeq = histeq(picture, 256);
imshow(histoeq);
imhist(picture)
histoeq = histeq(picture, 256);
imhist(histoeq)
% damit wurde die Histogramm Equalization ausgeführt
% jetzt wird die transformation function berechnet
histnorm = imhist(picture)./numel(picture);
cdf = cumsum(histnorm)
% jetzt die Funktion plotten
x = linespace(0,1,256);
x = linspace(0,1,256);
plot(x,cdf);
%fertig
