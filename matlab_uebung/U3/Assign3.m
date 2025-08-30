%%%%%%%
% Christian Gößl 762627 Assignment 3
%%%%%%%

%%%%%%% Ex1 a)
%The convolution is 90 degree flipped (gegenüber) the correlation.

%%%%%%% Ex1 b)
A = [10 10 10 10;10 10 10 10;10 10 10 10;10 10 10 10]; %
w_filter = [1 2 3; 0 0 0; 1 1 -1]; % Filter
A_neu = padarray(A ,[2 ,2]); %padding
A_filter = imfilter(A_neu ,w_filter); %calculation of filtered image
% fehtl noch die convolution

%%%%%%% Ex2 a)
pic1 = imread('8464954112_de9112bc82_b.jpg');
pic1 = rgb2gray(pic1);
% different gaussian filters by changing the sigma parameter
for i=0.1:2:30.1
  gaus_filter = fspecial('gaussian', 10, i);
  gaus_pic1 = imfilter(pic1, gaus_filter);
  %%figure, imshow(gaus_pic1)
  if i == 0.1
    imwrite(gaus_pic1,'gaus_pic1.jpg')
    figure('Name','Ex2 a) gaussian filter picture 1'), imshow(gaus_pic1)%%
  end;
end;
figure('Name','Ex2 a) gaussian filter picture 2'), imshow(gaus_pic1)%%
imwrite(gaus_pic1,'gaus_pic2.jpg');
% it smooth the picture


%%%%%%% Ex2 b)
% Gaussian noise
gaus_noise = imnoise(pic1, 'gaussian', 0, 0.25);
figure('Name','Ex2 b) gaussian noise'), imshow(gaus_noise)%%
imwrite(gaus_noise,'gaus_noise.jpg')
% reduce noise with the wiener filter
wiener_filter = wiener2(gaus_noise,[9 9]);
figure('Name','Ex2 b) wiener filter picture'), imshow(wiener_filter)
imwrite(wiener_filter,'wiener_filter.jpg')

%%%%%%% Ex2 c)
pic2 = imread('5956571795_3ab815bea8_b.jpg');
pic2 = rgb2gray(pic2);
% Salt & Pepper Noise
sapep_noise = imnoise(pic2, 'salt & pepper', 0.2);
figure('Name','Ex2 c) salt & pepper noise'), imshow(sapep_noise)
% median filter can remove salt & pepper noise
for i=1:2:9
  median_filter = medfilt2(sapep_noise,[i i]);
  %%figure, imshow(median_filter)
  if i == 3
    imwrite(median_filter,'median_filter1.jpg');
    figure('Name','Ex2 c) median filter picture 1'), imshow(median_filter)%%
  end;
end;
figure('Name','Ex2 c) median filter picture 2'), imshow(median_filter)%%
imwrite(median_filter,'median_filter2.jpg')

%%%%%%% Ex2 d)
pic3 = imread('Widmanstaetten_pattern_Staunton_meteorite.jpg');
pic3 = rgb2gray(pic3);
% kernels for the edges
hori = [-1 -1 -1;2 2 2;-1 -1 -1]; % horizontal filter
vert = [-1 2 -1;-1 2 -1;-1 2 -1]; % vertical filter
diag = [-1 -1 2;-1 2 -1;2 -1 -1]; % diagonal filter
hori_filter = imfilter(pic3, hori);
vert_filter = imfilter(pic3, vert);
diag_filter = imfilter(pic3, diag);
figure('Name','Ex2 d) horizontal filter picture'),imshow(hori_filter);%%
figure('Name','Ex2 d) vertical filter picture'),imshow(vert_filter);%%
figure('Name','Ex2 d) diagonal filter picture'),imshow(diag_filter);%%
imwrite(hori_filter,'hori_filter.jpg');
imwrite(vert_filter,'vert_filter.jpg');
imwrite(diag_filter,'diag_filter.jpg');

%%%%%%% Ex3 a)
% generate the picture
stripes = zeros(210, 233);
s = size(stripes);
s1 = s(1);
s2 = s(2);
for i = 0:8
  stripes(1:s1, i*24+18:i*24+24)=255;
end
figure('Name','Ex3 a) stripes picture'), imshow(stripes)
imwrite(stripes,'stripes.jpg')
% different sizes i of filters
for i=1:2:7
  % arithmetic mean filter
  arit_filter = fspecial('average', i);
  arit_pic = imfilter(stripes,arit_filter , 'replicate');
  %%figure('Name','arithmetic mean filter'), imshow(arit_pic)
  % geometric mean filter
  geom_pic = gmean(stripes, i, i);
  %%figure('Name','geometric mean filter'), imshow(geom_pic)
  % harmonic mean filter
  harm_pic = harmean(stripes, i, i);
  %%figure('Name','harmonic mean filter'), imshow(harm_pic)
  if i==3
    figure('Name','Ex3 a) arithmetic mean filter 1'), imshow(arit_pic)
    figure('Name','Ex3 a) geometric mean filter 1'), imshow(geom_pic)
    figure('Name','Ex3 a) harmonic mean filter 1'), imshow(harm_pic)
    imwrite(arit_pic,'arit_pic1.jpg');%%
    imwrite(geom_pic,'geom_pic1.jpg');%%
    imwrite(harm_pic,'harm_pic1.jpg');%%
  end;
end;
figure('Name','Ex3 a) arithmetic mean filter 2'), imshow(arit_pic)%%
figure('Name','Ex3 a) geometric mean filter 2'), imshow(geom_pic)%%
figure('Name','Ex3 a) harmonic mean filter 2'), imshow(harm_pic)%%
imwrite(arit_pic,'arit_pic2.jpg');%%
imwrite(geom_pic,'geom_pic2.jpg');%%
imwrite(harm_pic,'harm_pic2.jpg');%%

%%%%%%% Ex3 b)
% approxmitly by a 7 sizes kernel

%%%%%%% Ex3 c)
% lines are getting closer

%%%%%%% Ex4 a)
ad_aver_filter = fspecial('average');
ad_aver_filter(1,1) = 0; 
ad_aver_filter(2,2)= 0;
ad_aver_filter(1,3) = 0;
ad_aver_filter(3,3) = 0;
ad_aver_filter(3,1) = 0;
% Fouriertrafo
Fourier_filter = fft2(ad_aver_filter);

%%%%%%% Ex4 b)
fourier_pic = imfilter(pic3, real(Fourier_filter));
figure('Name','Ex4 b) fourier trafo picture'), imshow(fourier_pic)
imwrite(fourier_pic,'fourier_pic.jpg')
% the higher frequencies are removed --> low pass filter

%%%%%%% Ex4 c)
ad_aver_pic = imfilter(pic3, ad_aver_filter);
figure('Name','Ex4 c) 4-adjacent neighbours average picture'), imshow(ad_aver_pic)
imwrite(ad_aver_pic,'ad_aver_pic.jpg');

%%%%%%% Ex4 d)
%%syms u v x y B s
%%H = B*exp(-(u^2+v^2)/(2*s^2));
% Fouriertrafo
%%fourier(H, u, v, x, y)
