%%%%%%%
% Assignment 5 Christian Gößl 762627
%%%%%%%

%%%%%%% Exercise 1
pic1 = imread('blacksun_lafferty_1600.jpg');
pic1 = rgb2gray(pic1);
pic1_h = imfilter(pic1, fspecial('motion', 10, 45), 'circular'); % h(picture) function with motion with length 2 and angle 45 degree
add_noise = imnoise(pic1, 'gaussian', 0.10, 12); % additive noise
pic1_noise = pic1_h + add_noise; % noise picture
figure('Name','Ex1: original Image '), imshow(pic1);
figure('Name','Ex1: Noise Image'), imshow(pic1_noise, []);

%%%%%%% a.)
pic1_denoise1 = deconvwnr(pic1_noise, double(pic1_h)); % with noise-to-signal power ratio = 0
figure('Name','Ex1:a denoise Image with noise-to-signal power ratio = 0'), imshow(pic1_denoise1, []);

%%%%%%% b.)
% find out the noise-to-signal power ratio NSR
spec_noise = abs(fft2(add_noise)).^2; % noise power spectrum
noise_average = sum(spec_noise(:))/numel(add_noise); % noise average power
spec_pic = abs(fft2(pic1)).^2; % image power spectrum
pic_average = sum(spec_pic(:))/numel(pic1); % image average power
NSR = noise_average/pic_average; % noise-to-signal power ratio NSR
pic1_denoise2 = deconvwnr(pic1_noise, double(pic1_h), NSR); % with noise-to-signal power ratio
figure('Name','Ex1:b denoise Image with noise-to-signal power ratio'), imshow(pic1_denoise2, []);

%%%%%%% Exercise 2
%%%%%%% a.)
pic2 = imread('thundercloud_dyer_2000.jpg');
pic2_hsi = rgb2hsi(pic2); % convert from rgb to hsi
figure('Name','Ex2:a HSI Image '), imshow(pic2_hsi); % imshow try to output in rgb colors 
pic2_rgb = hsi2rgb(pic2_hsi);
figure('Name','Ex2:a RGB Image '), imshow(pic2_rgb);
% HSI and RGB are color models. RGB model can represent with a color cube(cardesian coord.) and the 
% HSI model can represent as a cylinder(cylinder coordinates) or a cone. Both function convert 
% between these color models(coordinatesystems).

%%%%%%% b.)
pic2_i = pic2_hsi(:,:,3); % extraction of the intensity component
% histrogram equalization
pic2_i = histeq(pic2_i);
pic2_hsi_eq = cat(3, pic2_hsi(:,:,1), pic2_hsi(:,:,2)-0.05, pic2_i); % merge it together and shift the saturation
figure('Name','Ex2:b histrogram equalization HSI Image '), imshow(hsi2rgb(pic2_hsi_eq));

%%%%%%% c.)
laplacian_filter = [1 1 1;1 -8 1;1 1 1]; % set the laplacian filter kernel
pic2_sharped = tofloat(pic2) - imfilter(tofloat(pic2), laplacian_filter, 'replicate'); % sharped image
figure('Name','Ex2:c sharped RGB Image '), imshow(pic2_sharped);

%%%%%%% Exercise 3
%%%%%%% a.)
% An indexed image consist of a data matrix and map. The map is an array, where the colors of the 
% image are defined. The length of the map is the number of colors of the image. The number of rows 
% are 3(rgb system), which used to construe each defined color. Each number of the data matrix relate 
% to a row(number) with colerated color of the map. This composition create the picture. Example: The % picture can consists of 200 colors. So we can produce a color map of 200 colors and create an indexed image.

%%%%%%% b.)
pic3 = imread('volcano_reitze_1280.jpg');
% produce a indexed image with a 12 colors colormap with or without dither
[pic3_ind1, map1] = rgb2ind(pic3, 12, 'nodither'); 
[pic3_ind2, map2] = rgb2ind(pic3, 12, 'dither');
figure('Name','Ex3:b original RGB Image '), imshow(pic3);
figure('Name','Ex3:b indexed RGB Image with 12 colors and without dither'), imshow(pic3_ind1, map1);
figure('Name','Ex3:b indexed RGB Image with 12 colors and with dither'), imshow(pic3_ind2, map2);
% The dither method try to make good transistions.

%%%%%%% c.)
pic3_c = imread('PIA15254_LMC2048.jpg');
pic3_c = rgb2gray(pic3_c);
pic3_c_ind = grayslice(pic3_c, 20); % indexed grayscale image with 20 gray levels
figure('Name','Ex3:c indexed Grayscale Image with hsv colormap'), imshow(pic3_c_ind, hsv); % hsv colormap

%%%%%%% c.)
pic3_d = imread('PIA15254_LMC2048.jpg');
figure('Name','Ex3:d original RGB Image '), imshow(pic3_d);
% image segmentation with colorseg
pic3_d_seg1 = colorseg('euclidean', pic3_d, 100, [150;150;0]); % euclidean method with a threshold T of 100 and average color m (midpoint of the choosen color in rgb space)
pic3_d_seg2 = colorseg('mahalanobis', pic3_d, 100, [0;0;150]); % mahalanobis method with a threshold of 100 and average color m 
figure('Name','Ex3:d Image segmentation with euclidean method'), imshow(pic3_d_seg1);
figure('Name','Ex3:d Image segmentation with mahalanobis method'), imshow(pic3_d_seg2);
% The 3. value of colorseg is the maxima distance to middle point (4. value of colorseg) of the color % space. Colorseg select a specific color region in color space.

