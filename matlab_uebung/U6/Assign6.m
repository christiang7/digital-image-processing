%%%%%%%
% Assignment 6 Christian Gößl 762627
%%%%%%%

%%%%%%% Exercise 2
%%%%%%% a.)
pic2 = imread('lightning_facts_big.jpg');
pic2 = im2bw(pic2); % rgb to binary image
%pic2 = rgb2gray(pic2);
%pic2 = pic1 > 0;
%%figure('Name','Ex2:a original image'), imshow(pic2);
pic2_skel = bwmorph(pic2,'skel',100); % produce a skeleton image
%%figure('Name','Ex2:a skeleton image'), imshow(pic2_skel);

%%%%%%% b.)
pic2_endp = endpoints(pic2);
%%figure('Name','Ex2:b endpoints'), imshow(pic2_endp);

%%%%%%% Exercise 3
%%%%%%% a.)
pic3 = imread('mars.bmp');
pic3_ind = grayslice(pic3, 3);
%[pic3_ind, map] = rgb2ind(pic3, 3, 'nodither'); % create indexed image with colormap
%%figure('Name','Ex3:a indexed image'), imshow(pic3_ind, lines);

%%%%%%% b.)
planet = pic3_ind > 0; % extraction of the ice and planet to binary image
struc_elem = strel('square', 3); % creation of a structure element for morphing
planet = imclose(planet, struc_elem); % fill out the holes with the closing operation
%%figure('Name','Ex3:b planet binary image'), imshow(planet);
center_planet = bwmorph(planet,'shrink', 200); % shrink the structure to a center
%%figure('Name','Ex3:b center planet'), imshow(center_planet);

%%%%%%% c.)
%ice_cap = pic3_ind > 1;
sizes = size(pic3_ind);
ice_cap = zeros(sizes(2),sizes(1)); % (x,y)
for i=1:1:sizes(2)*1/4 % extraction of the ice_cap
	for j=1:1:sizes(1)
		ice_cap(i,j) = pic3_ind(i,j) > 1;
	end;
end;
%%figure('Name','Ex3:c image'), imshow(ice_cap);
center_ice_cap = bwmorph(ice_cap,'shrink', 200);
%%figure('Name','Ex3:b center ice cap'), imshow(center_ice_cap);

%%%%%%% d.)
for i=3:1:(sizes(1)-3)
	for j=3:1:(sizes(2)-3)
		if (center_ice_cap(i,j) > 0)
		c_x = i;
		c_y = j;
		elseif (center_planet(i,j) > 0)
		p_x = i;
		p_y = j;
		end
	end
end
distance = ((p_x - c_x).^2+(p_y - c_y).^2).^(1/2)
