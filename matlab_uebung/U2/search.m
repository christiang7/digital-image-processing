function [mistakes] = search(picture)
%MISTAKES
% This function can calculate the counts of mistakes of a puzzle picture
%rgb color to gray
picture = rgb2gray(picture);
%determination of the size of the picture
sizes = size(picture);
% extract to single pictures
picture1 = picture(1:sizes(1),1:(round(sizes(2)/2)-1));%
picture2 = picture(1:sizes(1),(round(sizes(2)/2+1)):sizes(2));%
% extraction of the mistakes
minuspic1 = minus(picture2,picture1);
%imshow(minuspic1);
%count and determine of mistakes
[struc,mistakes] = bwlabel(minuspic1);
