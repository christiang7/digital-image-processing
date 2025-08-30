%-- 13.05.2014 16:19:46 --%
ave = fspecial(average);
ave = fspecial('average');
lap = fspecial('laplacian');
sob = fspecial('sobel');
% damit wurden jetzt alle kernels eingelesen
% jetzt  den max filter mit der funktion >ordfilt2<
maxfilter = ordfilt2(pic,max(max(filter)),filer(5));
pic = imread('flower.jpg');
maxfilter = ordfilt2(pic,max(max(filter)),filer(5),'zeros');
maxfilter = ordfilt2(pic,max(max(filter)),filter(5),'zeros');
maxfilter = ordfilt2(pic ,max (max (true )), true( 5), 'zeros');
maxfilter = ordfilt2(pic ,max (max (ones )), ones( 5, 0), 'zeros');
maxfilter = ordfilt2(pic ,max (max (ones )), ones( 5), 'zeros');
imshow(maxfilter);
maxfilter = ordfilt2(pic ,max (max (ones )), ones( 3), 'zeros');
maxfilter_3 = ordfilt2(pic ,max (max (ones )), ones( 3), 'zeros');
maxfilter_5 = ordfilt2(pic ,max (max (ones )), ones( 5), 'zeros');
imshow(maxfilter_3);
imshow(maxfilter_5);
imshow( maxfilter_3), figure, imshow( maxfilter_5);;
maxfilter_7 = ordfilt2(pic ,max (max (ones )), ones( 7), 'zeros');
imshow( maxfilter_3), figure, imshow( maxfilter_5), figure, imshow(maxfilter_7 );
maxfilter_3 = ordfilt2(pic , ones( 3, 3)  ones( 3), 'zeros');
maxfilter_3 = ordfilt2(pic , ones[ 3, 3]  ones( 3), 'zeros');
maxfilter_3 = ordfilt2(pic , ones( 3, 3) , ones( 3), 'zeros');
maxfilter_3 = ordfilt2(pic , ones [ 3, 3] , ones( 3), 'zeros');
ones(3)
maxfilter_3 = ordfilt2(pic , filter [ 3, 3] , filter( 3), 'zeros');
maxfilter_3 = ordfilt2(pic , filter ( 3, 3) , filter( 3), 'zeros');
filter
filter(3);
filter(3,3)
filter(3,3) = 1
maxfilter_3 = ordfilt2(pic , 9, 'zeros');
imshow(maxfilter_3);
maxfilter_3 = ordfilt2(pic , 9, ones(3), 'zeros');
imshow(maxfilter_3);
% jetzt aufgabe 3
%a
avefilter = imfilter( pic, ave);
imshow(avefilter);
lapfilter = imfliter( pic, lab);
lap
lapl = fspecial('laplacian');
lapfilter = imfliter( pic, labl);
labl;
lapl
imshow(labfilter);
lapfilter = imfliter( pic, lap);
imfilter
lapfilter = imfilter( pic, lap);
imshow(labfilter);
imshow(lapfilter);
% b sob filter
sobfilter = imfilter( pic, sob);
imshow(sobfilter);
% smoothen ist der average filter
%c
pic_c = add( pic, lapfilter);
pic_c = plus( pic, lapfilter);
imshow( pic_c);
% d
imshow( pic_c);
sobfilter = imfilter( int8( pic), sob);
imshow( sobfilter);
imshow( mat2gray( double( pic), labfilter)/4 + double( pic)));
imshow( mat2gray( imfilter(double( pic), labfilter)/4 + double( pic)));
imshow( mat2gray( imfilter(double( pic), lapfilter)/4 + double( pic)));
lapfilter = fspecial( 'laplacian');
imshow( mat2gray( imfilter(double( pic), lapfilter)/4 + double( pic)));
imshow( mat2gray( - imfilter(double( pic), lapfilter)/4 + double( pic)));
% dies ist die richtige Lösung für Laplacian Filter
