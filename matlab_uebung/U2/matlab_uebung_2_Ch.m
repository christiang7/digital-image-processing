% picture input
picture = imread('flower.jpg');
% create a histogram
hist(picture);
imhist(picture);
% histrogram equalization
histoeq = histeq(picture, 256);
imshow(histoeq);
imhist(histoeq);
% transformation function
histnorm = imhist(picture)./numel(picture);
cdf = cumsum(histnorm);
x = linspace(0,1,256);
%plot
plot(x,cdf),  xlabel ( ' x ' ), ylabel ( ' f(x) ' );
%contrast enhancement
low = log(double(picture));
imshow(low);
high = 10.^(double(low));
imshow(high);
% gamma correction
gamma1 = picture.^(0.5);
gamma2 = picture.^(2.0);
imshow(gamma1), figure, imshow(gamma2);
%binary pictures
binpic1 = im2bw(picture);
imshow(binpic1);
binpic2 = im2bw(gamma1);
imshow(binpic2);
binpic2 = im2bw(gamma2);
% enhancement technices
imshow(picture);
imshow(histoeq);
adjustpic = imadjust(picture);
imshow(adjustpic);
adapthistpic = adapthistoeq(picture);
imshow(adapthistpic);