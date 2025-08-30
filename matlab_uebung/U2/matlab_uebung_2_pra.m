%-- 29.04.2014 16:11:24 --%
% zeige spalte
a=[1 2;3 4]
a(1,:)
%zeigte zeile an
% jetzt spalte
f=imread('20080509094050_tropfen11962537-1.jpg')
f=imread('20080509094050_tropfen11962537-1.jpg');
%Bild wurde eingelesen
% transformieren
g= intrans(f,'neg',0.5);
imshow('band.jpg');
imshow('flower.jpg');
% Übung 2
% 1. Aufgabe
invert = invert('updwon.jpg');
tform = projective2d(a)
imshow('updown.jpg');
% zum invertieren einfach rotieren lassen
%rot = rotate();
%oder einfach das kommando flip verwenden
f2 = flipdim(f,1);
imshow(f2);
pic1 = imread('updown');
pic1 = imread('updown.jpg');
fpic1 = flipdim(pic1,1);
imshow(fpic1);
%Aufgabe 2
pic2 = imread('flower.jpg');
maximum = max(max((pic2));
maximum = max(max(pic2));
% Maximum des Gray levels
% nun in jeder Zeile/Spalte die Formel Bildneu = Maximum - Bildalt
npic(Maximum,2)
npic(maximum,2)
npic = (maximum,2)
npic = maximum - pic2;
imshow(npic);
lpic = log(1+pic2);
lpic = log(1+im2unit8(pic2));
lpic = log(1+im2uint8(pic2));
% logarithmische transformation
lpic = log(1+mat2grey(pic2));
im2unit8(pic2)
im2uint8(pic2)
lpic = log(1+pic2);
lpic = log(1+double(pic2));
imshow(pic2);
%contrast stretching
cpic = 1./(1+(mean2(f)./(f+eps))*0.4);
imshow(cpic);
cpic = 1./(1+(mean2(f)./(f+eps))*0.4)
imshow(cpic);
% Aufgabe 3
picpart1 = imread('imgpart1.jpg');
picpart2 = imread('imgpart2.jpg');
addpic = picpart1 + picpart2;
imshow(addpic);
addpic = picpart1 + picpart2
addpic = picpart1. + picpart2.;
addpic = picpart1 + picpart2;
imshow(addpic);
addpic = picpart1 +. picpart2;
addpic = plus(picpart1,picpart2);
imshow(addpic);
picpart1 = unit16(picpart1);
picpart1 = uint16(picpart1);
picpart2 = uint16(picpart2);
addpic = picpart1 + picpart2;
imshow(addpic);
addpic = imadd(picpart1,picpart2);
imshow(addpic);
imshow(addpic,[]);
% das [] muss in imshow drin sein sonst zeigt es das Bild nur schwarz an
imshow(addpic,[0,256]);
imshow(addpic,[0,257]);
imshow(addpic,[0,258]);
imshow(addpic,[]);
%Aufgabe 4
%Histogramm
hpic = imread('band.jpg);
hpic = imread('band.jpg');
hist(hpic);
imhist(hpic);
improfile
imshow(hpic);
improfile
% mit der maus einen bereich auswählen und im dia anzeigen lassen
gpic1 = imread('im2grey.jpg');
gpic1 = imread('im2gray.jpg');
gpic2 = imread('im2gray.jpg');
gpic1 = imread('im1gray.jpg');
a1 = bitget(gpic1,4)*2^8;
b1 = bitget(gpic2,6)*2^8;
p1=imadd(uint16(a1),uint16(b1));
imshow(p1);
imshow(p1, []);
% Aufgabe 6
% a.)
fpic = imread('flower.jpg');
imhist(fpic);
% b.)
p = manualhist
%fertig
histeq(f,p);
%jetzt fertig
