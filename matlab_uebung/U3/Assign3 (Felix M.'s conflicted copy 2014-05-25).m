%%%%%%% Ex1 b)
A = [10 10 10 10;10 10 10 10;10 10 10 10;10 10 10 10]; %
w_filter = [1 2 3; 0 0 0; 1 1 -1]; % Filter
A_neu = padarray(A ,[2 ,2]); %padding
A_filter = imfilter(A_neu ,w_filter); %calculation of filtered image

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
  end;
end;
imwrite(gaus_pic1,'gaus_pic2.jpg');

%%%%%%% Ex2 b)
% Gaussian noise
gaus_noise = imnoise(pic1, 'gaussian', 0, 0.25);
%%figure, imshow(gaus_noise)
imwrite(gaus_noise,'gaus_noise.jpg')
% reduce noise with the wiener filter
%%wiener_filter = wiener2(gaus_noise,[3 3]); %%MATLAB%%
%%figure, imshow(wiener_filter)
%imwrite(wiener_filter,'wiener_filter.jpg')

%%%%%%% Ex2 c)
pic2 = imread('5956571795_3ab815bea8_b.jpg');
pic2 = rgb2gray(pic2);
% Salt & Pepper Noise
sapep_noise = imnoise(pic2, 'salt & pepper', 0.2);
%%figure, imshow(sapep_noise)
% median filter can remove salt & pepper noise
for i=1:2:9
  median_filter = medfilt2(sapep_noise,[i i]);
  %%figure, imshow(median_filter)
  if i == 3
    imwrite(median_filter,'median_filter1.jpg')
  end;
end;
imwrite(median_filter,'median_filter2.jpg')

%%%%%%% Ex2 d)
pic3 = imread('12180107553_f0214171f6_b.jpg');
%pic3 = rgb2gray(pic3);
% kernels for the edges
hori = [-1 -1 -1;2 2 2;-1 -1 -1]; % horizontal filter
vert = [-1 2 -1;-1 2 -1;-1 2 -1]; % vertical filter
diag = [-1 -1 2;-1 2 -1;2 -1 -1]; % diagonal filter
hori_filter = imfilter(pic3, hori);
vert_filter = imfilter(pic3, vert);
diag_filter = imfilter(pic3, diag);
%%figure,imshow(hori_filter);
%%figure,imshow(vert_filter);
%%figure,imshow(diag_filter);
imwrite(hori_filter,'hori_filter.jpg');
imwrite(vert_filter,'vert_filter.jpg');
imwrite(diag_filter,'diag_filter.jpg');
%%%%%%% Ex3 a)
% generation of the picture
stripes = zeros(210, 233);
s = size(stripes);
s1 = s(1);
s2 = s(2);
for i = 0:8
  stripes(1:s1, i*24+18:i*24+24)=255;
end
%%figure('Name','stripes picture'), imshow(stripes)
imwrite(stripes,'stripes.jpg')
%o = im2uint8(od);
for i=1:2:7
  % arithmetic mean filter
  arit_filter = fspecial('average', i);
  arit_pic = imfilter(stripes,arit_filter , 'replicate');
  %%figure, imshow(arit_pic)
  % geometric mean filter
  geom_pic = gmean(stripes, i, i);
  %%figure, imshow(geom_pic)
  % harmonic mean filter
  harm_pic = harmean(stripes, i, i);
  %%figure, imshow(harm_pic)
  if i==3
    imwrite(arit_pic,'arit_pic1.jpg');%%
    imwrite(geom_pic,'geom_pic1.jpg');%%
    imwrite(harm_pic,'harm_pic1.jpg');%%
  end;
end;
imwrite(arit_pic,'arit_pic2.jpg');%%
imwrite(geom_pic,'geom_pic2.jpg');%%
imwrite(harm_pic,'harm_pic2.jpg');%%