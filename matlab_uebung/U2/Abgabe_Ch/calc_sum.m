max = 1000; % maximal number
sum = zeros(1,max); 
x = 1:1:max;
% computation of the sum
for i = 1:1:max
	for j = 1:1:i
	sum(i) = sum(i) + ((-1).^(j)/(2*j+1));
	end;
end;
plot1 = semilogx(x,sum); %log axis
xlabel ( ' x ' ) ; %labeling the axes
ylabel ( ' sum ' ) ;
% computation of the sum for the a, b and c.)
x = zeros(1,3);
sum = zeros(1,3); 
for i = 2:2:6
	for j = 1:1:10.^(i)
	sum(round(i/2)) = sum(round(i/2)) + ((-1).^(j)/(2*j+1));
	end;
  x(round(i/2))= 1*10.^(i)
end;
plot2 = semilogx(x,sum); %log axis
xlabel ( ' x ' ) ;
ylabel ( ' sum ' ) ;
%title( 'sum' ) ;