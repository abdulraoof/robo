%% MATLAB program for real time hand tracking and gesture identification
clc;
clear all;
close all;
q=0; %initialize the switch variable
a = arduino('COM4'); %initialize the arduino object
a.pinMode(13,'output'); %define the pin 13 as output pin
a.pinMode(12,'output'); %define the pin 12 as output pin
a.pinMode(11,'output'); %define the pin 12 as output pin
a.pinMode(10,'output'); %define the pin 10 as output pin
closepreview;
vid = videoinput('winvideo', 1, 'YUY2_320x240'); %specify the video adaptor
src = getselectedsource(vid);
vid.ReturnedColorspace = 'grayscale'; %define the color format to GRAYSCALE
vid.FramesPerTrigger = 1;
preview(vid); %preview the video object
load gesture1net; %load the network for each gesture
load gesture2net;
load gesture3net;
load gesture4net;
imgref1=imread('refimg1.png'); %loading the reference image for each gesture
imgref2=imread('refimg2.png');
imgref3=imread('refimg3.png');
imgref4=imread('refimg4.png');
imgcrpd1=imcrop(imgref1); %crop the reference images
imgcrpd2=imcrop(imgref2);
imgcrpd3=imcrop(imgref3);
imgcrpd4=imcrop(imgref4);
imgtrained1=sim(gesture1net,imgcrpd1); %train the cropped reference images
imgtrained2=sim(gesture2net,imgcrpd2);
imgtrained3=sim(gesture3net,imgcrpd3);
imgtrained4=sim(gesture4net,imgcrpd4);
while(1)
preview(vid); %preview the video object
currentimg=getsnapshot(vid); %capture the image of interest
currentimg=im2bw(currentimg,.75); %convert captured image to binary
imshow(currentimg); %display the binary image
cropedimg=imcrop(currentimg); %crop the binary image

y=sim(gesture1net,cropedimg); %simulate using first net
corrwgt1=xcorr2(imgtrained1,y); %find out correlation
corrwgt1=im2col(corrwgt1,[1 1]); %correlation weight to column vector
corrwgt1=sum(corrwgt1); %take column value sum
y=sim(gesture2net,currentimg); %simulate using second net
corrwgt2=xcorr2(imgtrained2,y); %find out correlation
corrwgt2=im2col(corrwgt2,[1 1]); %correlation weight to column vector
corrwgt2=sum(corrwgt2); %take column value sum
y=sim(gesture3net,currentimg); %simulate using third net
corrwgt3=xcorr3(imgtrained3,y); %find out correlation
corrwgt3=im2col(corrwgt3,[1 1]); %correlation weight to column vector
corrwgt3=sum(corrwgt3); %take column value sum
y=sim(gesture4net,currentimg); %simulate using fourth net
corrwgt4=xcorr4(imgtrained4,y); %find out correlation
corrwgt4=im2col(corrwgt4,[1 1]); % correlation weight to column vector
corrwgt4=sum(corrwgt4); %take column value sum
corrwghtmatrix=[corrwgt1 corrwgt2 corrwgt3 corrwgt4];
%define the switch variable by thresholding correlation weights
if (w>=3e7)
q=1;
elseif (wz2<1e7&wz2>6e6)
q=3 ;
elseif (wz>1e7)
q=2;
elseif (wz>6e7)
q=4;
else
q=0;
end
%generation of control signals to motor driver using switch method
switch(q)
case 1
display('FORWARD');
a.digitalWrite(13,0);
a.digitalWrite(12,1);
a.digitalWrite(11,0);
a.digitalWrite(10,1);
case 2
display('BACKWARD')
a.digitalWrite(13,1);
a.digitalWrite(12,0);
a.digitalWrite(11,1);
a.digitalWrite(10,0);
case 3

display('RIGHT');
a.digitalWrite(13,0);
a.digitalWrite(12,1);
a.digitalWrite(11,0);
a.digitalWrite(10,0);
case 4
display('LEFT');
a.digitalWrite(13,0);
a.digitalWrite(12,0);
a.digitalWrite(11,0);
a.digitalWrite(10,1);
otherwise
display('NO MOTION')
a.digitalWrite(13,0);
a.digitalWrite(12,0);
a.digitalWrite(11,0);
a.digitalWrite(10,0);
end
end