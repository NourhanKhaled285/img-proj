function [centers , radi , matrix] = bright(Pic)

histogram(Pic);  
binaryImage=im2bw(Pic);
totalPixels = numel(binaryImage);
numWhitePixels = sum(binaryImage(:));
numBlackPixels = totalPixels - numWhitePixels;
 disp(numWhitePixels);
 disp(numBlackPixels);



if(numWhitePixels/numBlackPixels>=0.9)
   level = 0.87;
      disk=strel('disk',1);
   disk1=strel('disk',4);
   
else
   level = 0.6;
   disk=strel('disk',6);
   disk1=strel('disk',9);
   
end   
temp= im2bw(Pic,level);
pic=imerode(temp,disk);
pic1=imdilate(pic,disk1);
figure ,imshow(pic1),title('hough transform detected img dilate');
[centers, radi,matrix] = imfindcircles(pic1,[15 110],'ObjectPolarity','bright');%15 5000
viscircles(centers, radi,'EdgeColor','r');
end
