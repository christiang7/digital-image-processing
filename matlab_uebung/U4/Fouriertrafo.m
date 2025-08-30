% Fouriertrafo
pic = im2uint8(zeros(512,512));
for i=(size(pic)/2-10):1:(size(pic)/2+10)
	for j=(size(pic)/2-20):1:(size(pic)/2+20)
		pic(i,j) = 252;
	end;
end;
%figure, imshow(pic);
pic_f = fft2(pic);
pic_fc = fftshift(pic_f);
%figure, imshow(abs(pic_f), []);
%figure, imshow(abs(pic_fc), []);