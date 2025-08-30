%%%%%%%
% present Assignment 5 Christian Gößl 762627
%%%%%%%

%%%%%%% Exercise 1
pic1 = imread('m16_32block.jpg');
%%figure('Name','Ex1:1 original Bild'), imshow(pic1);
% Anteile herausfiltern
blau_anteil = pic1(:, :, 3);
%%figure('Name','Ex1:1 blau Anteil'), imshow(blau_anteil);
gelb_anteil = pic1(:, :, 2);
%%figure('Name','Ex1:2 gelb Anteil'), imshow(gelb_anteil);
rot_anteil = pic1(:, :, 1);
%%figure('Name','Ex1:3 rot Anteil'), imshow(rot_anteil);
sizes = size(rot_anteil);
% zusammenfügen der Farbanteile in ein Bild
% Beschreibung von cat: cat(anzahl bilder, rotanteil, gelbanteil,
% blauanteil)
pic1_neu = cat(3,rot_anteil,  gelb_anteil, zeros(sizes(1), sizes(2)));
%%figure('Name','Ex1:2 zusammengesetztes Bild wobei ein Farbanteil fehlt'), imshow(pic1_neu);

%%%%%%% Exercise 2
pic2 = imread('EndlessAutumnx.jpg');
pic2 = rgb2gray(pic2);
% extraieren der Colormap gray2ind(Bild, Länge der Colormap )
[pic2, colourmap] = gray2ind(pic2, 256); 
%%figure('Name','Ex2:1 '), imshow(pic2);
% Bild einfärben mittels ind2rgb auswahl der Colormap --> Pseudocolor image
pic2_farbe = ind2rgb(pic2, hsv);
%%figure('Name','Ex2:2 '), imshow(pic2_farbe);

%%%%%%% Exercise 3
% a.) intensität verändern
%%pic_neu = ice('image', pic1);
% einfach den oberen Punkt nach unten verschieben

% b.) komplement finden
%%pic_neu = ice('image', pic1);
% den unteren Punkt nach oben den oberen Punkt nach unter verschieben

% c.) tonal correction and color balancing
%%pic_neu = ice('image', pic1);
% mit der mittleren Maustaste neue Punkte hinzufügen und damit rumspielen

%%pic_neu = ice('image', pic1);
% den unteren Punkt nach oben den oberen Punkt nach unter verschieben

%%%%%%% Exercise 4
% zum smoothen der Farbbilder wird der Average filter benutzt
% fspecial mit 'average' auf alle Farben anwenden im rgb system 
% beim hsi system braucht man nur die intensität verändern
% danach die Anteile wieder zusammenfügen
% oder pic_neu = ice('image', pic1); verwenden und den Punkt smooth
% verwenden

%%%%%%% Exercise 5
