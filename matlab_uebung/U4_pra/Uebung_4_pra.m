%%%%%%
% Präsenz Übung 4
%%%%%%

%%%%%% Aufgabe 1
% lapcian filter
lap_filter = fspecial('laplacian');
% create a laplacian filter in frequency domain
lap_freq_filter = freqz2(lap_filter,[32 32]); % 3 x 3 Kernel
%%figure('Name','Aufg1: Diagramm des Filters'), freqz2(lap_filter,[32 32]) % Diagramm des Filters

%%%%%% Aufgabe 2
% 1.padding with the m function paddedzise()
% 2.filter function with the m function dftuv(), function, fftshift() zu H
[U, V] = dftuv(500, 500); 
sigma = 50;
H = exp(-(U.^2+V.^2)/(2*sigma^2)); % Gaussian function is a low pass filter
%%figure('Name','Aufg2: Diagramm des low-pass Filters'), mesh(double(H));
figure('Name','Aufg2: Bild des Filters in Graustufen'), imshow(abs(H), [])

%%%%%% Aufgabe 3
% Steps
% 1.padding with the m function paddedzise()
% 2.fourier transform with fft2() to F
% 3.filter function with the m function dftuv(), function, fftshift() zu H
% 4.G=H.*F
% 5.real part of G
% 6.Cropping the image
sob_filter = fspecial('sobel')
sob_freq_filter = freqz2(sob_filter);
pic = imread('checked.jpg');
pad_size = paddedsize(size(pic))
H = freqz2(pic, pad_size(1), pad_size(2));
imshow(abs(H), []);
H1 = ifftshift(H); % zentrieren
imshow(abs(H1), []);
gs=imfilter(pic, H);
gf=dftfilt(pic, H1);
imshow(gs - gf, []);