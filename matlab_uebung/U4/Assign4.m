%%%%%%%
% Assignment 4 Christian Gößl 762627
%%%%%%%

%%%%%%% Exercise 1
% Creation of the 256x256 picture
pic1 = ones(256,256);
for i=size(pic1)/2:1:size(pic1)
	for j=1:1:size(pic1)
		pic1(i,j) = 0;
	end;
end;
figure('Name','Black and White Picture'), imshow(pic1);

%%%%%%% a.)
% frequenzy domain without padding
% size of the picture
[M,N] = size(pic1);
% Fouriertrafo 
pic1_four_1 = fft2(pic1);
% creation of the filter function in frequency domain
% coordinates U and V
[V,U] = dftuv(M,N);
% calculation of the distance 
distance = hypot(U,V);
% limit frequency
D_0 = 10;
% filter function
H = exp( -( distance.^2) /( 2*( D_0^2)));
% apply the filter to the image
G_1 = H.*pic1_four_1;
% invers fouriertrafo
g_1 = ifft2( G_1);
figure('Name','Ex1:a:1 Gaussian filter without padding'), imshow(g_1);

% frequenzy domain with padding
% padding
padsize = paddedsize(size(pic1));
% fourier trafo
pic1_four_2 = fft2( pic1, padsize(1), padsize(2));
% creation of the filter function in frequency domain
% coordinates U and V
[V,U] = dftuv( padsize(1), padsize(2));
% calculation of the distance 
distance = hypot(U,V);
% filter function
H = exp( -( distance.^2) /( 2*( D_0^2)));
G_2 = H.*pic1_four_2;
g_2 = ifft2( G_2);
figure('Name','Ex1:a:2 Gaussian filter with padding'), imshow(g_2);

%%%%%%% b.)
% You have to use padding to avoid the called wraparound error. This error accour by convolving periodic functions at the adjents periods. 

%%%%%%% Exercise 2
%%%%%%% a.)
D_0 = 40;
pic2 = imread('grayscale-pencils.jpg');
pic2 = rgb2gray(pic2);
figure( 'Name', 'Ex2:b original picture'), imshow( pic2);
[M,N] = size(pic2);
% fourier trafo
pic2_four_1 = fft2( pic2, M, N);
% creation of the filter function in frequency domain
% coordinates U and V
[V,U] = dftuv( M, N);
% calculation of the distance 
distance = hypot( U, V);
% filter function high pass filter
H = double( distance >= D_0);
G = H.*pic2_four_1;
g = ifft2( G);
figure('Name', 'Ex2:a High-pass filter'), imshow( g);

%%%%%%% b.)
D_0 = 30.;
% filter function high pass filter
% order of n
n = 3.;
H = 1. - 1./ ( 1. + ( distance .* D_0.^(-1.)).^(2. * n));
G = H.*pic2_four_1;
g = ifft2( G);
figure('Name', 'Ex2:b butterworth High-pass filter'), imshow( g);
% histrogram equalization
histoeq = histeq(g, 256);
figure('Name', 'Ex2:b Histoeq pic'), imshow(histoeq);
figure('Name', 'Ex2:b Histogram of Histoeq'), imhist(histoeq);
% Sadly the combination makes not a better result.

%%%%%%% Exercise 3
%%%%%%% a.)
% Gaussian noise
pic3 = imread('grayscale-bokeh.jpg');
pic3 = rgb2gray(pic3);
gaus_noise = imnoise(pic3, 'gaussian', 0, 0.25);
figure('Name','Ex3 a) gaussian noise'), imshow(gaus_noise)%%
% selection of the region of interest
[ selection, column, row] = roipoly( gaus_noise, [200 400 400 200], [200 200 400 400]);
% histogram of the region of interest
[ histo, npix] = histroi( gaus_noise, column, row);
figure('Name', 'Ex3:a Histogram of the region of interest'), bar( histo, 1);

%%%%%%% b.)
% mean and variance 
[ moments, unnorm_moments] = statmoments( histo, 2);

%%%%%%% Exercise 4
%%%%%%% a.)
pic4 = imread('nature-leaf.jpg');
pic4 = rgb2gray(pic4);
figure('Name','Ex4 a) original pic'), imshow( pic4, []);
sizes = size(pic4);
for i=1:1:sizes(1)
	for j=1:1:size(1)
		pic4_n(i,j) = pic4(i,j);
	end;
end;
sizes = size(pic4_n);
% periodic noise
[ r, R, S] = imnoise3( sizes(1), sizes(2), [0 (sizes(2)/2-sizes(2)/4);(sizes(1)/2-sizes(1)/4) 0;0 -(sizes(2)/2-sizes(2)/4);-(sizes(1)/2-sizes(1)/4) 0]);%
%%figure('Name','Ex4 a) periodic noise S'), imshow(S, []); % spectrum
%%figure('Name','Ex4 a) periodic noise r'), imshow(r, []); % values of r [0,1] additive noise eta
pic4_noise = double(pic4_n) + double(r.*256); % convert to grayscale with r*256 - noise image
figure('Name','Ex4 a) periodic noise pic'), imshow( pic4_noise, []);

%%%%%%% b.)
% frequenzy domain without padding
% Fouriertrafo 
pic4_four = fft2(pic4_noise);
% creation of the filter function in frequency domain
% coordinates U and V
[V,U] = dftuv( sizes(1), sizes(2));
% calculation of the distance 
distance = hypot(U,V);
% shift to the center
distance_new = fftshift(distance);
% limit frequency
D_0 = (sizes(2)/2-sizes(2)/4);
% filter function ideal bandreject
limit_up = distance_new <= D_0 - 1;
limit_down = distance_new >= D_0 + 1;
H =1-tofloat( limit_up | limit_down); % ideal bandreject wfilter
% apply the filter to the image
G = H.*pic4_four;
% invers fouriertrafo
g = ifft2( G);
figure('Name','Ex4:b ideal bandreject filter picture'), imshow(g);
