%% MATLAB FUCTION imcrop TO CROP THE CAPTURED IMAGE
function imgout=imgcrop(imgin) %function definition
imgin = imresize(cropimg,[240,240]); %resize the original image
columnsum=sum(cropimg); %find the sum of column entries
rowsum=sum(cropimg'); %find the sum of row entries
q1=1;
q2=240;
q3=1;
q4=240;
for w=1:240 %search for the vertical cropping boundary
  if (columnsum(1,w)>=10)
    q1=w;
    break;
  end
end
for w=q1:240 %search for the vertical cropping boundary
  if (columnsum(1,w)>=10)
    q2=w;
  end
end
for w=1:240 %search for the horizontal cropping boundary
  if (rowsum(1,w)>=10)
    q3=w;
    break;
  end
end
for w=q3:240 %search for the horizontal cropping boundary
  if (rowsum(1,w)>=50)
    q4=w;
  end
end
%crop the image between boundaries and resize to original
imgout=cropimg(q3:q4,q1:q2);
imgout=[zeros(q4-q3+1,160-(q2-q1+1)),imgout;zeros(120-(q4-q3+1),160)];
imgout=imresize(imgout,[120,160]);
imgout=double(imgout); %convert the image type to double for future use
