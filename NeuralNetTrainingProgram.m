%% This program is used to make the neural network for the identification of the gesture1. Same program can be used for other gestures also by replacing the sample images with the images corresponding to that gesture
clc;
clear all;
%% Load the sample images (of different posses) to make net for gesture1
img1=imread('firsgesture1.png');
img2=imread('firsgesture2.png');
img3=imread('firsgesture3.png');
img4=imread('firsgesture4.png');
img5=imread('firsgesture5.png');
img6=imread('firsgesture6.png');
img7=imread('firsgesture7.png');
img8=imread('firsgesture8.png');
img9=imread('firsgesture9.png');
img10=imread('firsgesture10.png');
img11=imread('firsgesture11.png');
img12=imread('firsgesture12.png');
img13=imread('firsgesture13.png');
img14=imread('firsgesture14.png');
img15=imread('firsgesture15.png');
img16=imread('firsgesture16.png');
img17=imread('firsgesture17.png');
img18=imread('firsgesture18.png');
img19=imread('firsgesture19.png');
img20=imread('firsgesture20.png');
img21=imread('firsgesture21.png');
img22=imread('firsgesture22.png');
img23=imread('firsgesture23.png');
img24=imread('firsgesture24.png');
img25=imread('firsgesture25.png');
img26=imread('firsgesture26.png');
img27=imread('firsgesture27.png');
img28=imread('firsgesture28.png');
img29=imread('firsgesture29.png');
img30=imread('firsgesture30.png');
img31=imread('firsgesture31.png');
img32=imread('firsgesture32.png');

img33=imread('firsgesture33.png');
img34=imread('firsgesture34.png');
img35=imread('firsgesture35.png');

%% Crop the sample images

imgcpd1=imcrop(a1);
imgcpd2=imcrop(a2);
imgcpd3=imcrop(a3);
imgcpd4=imcrop(a4);
imgcpd5=imcrop(a5);
imgcpd6=imcrop(a6);
imgcpd7=imcrop(a7);
imgcpd8=imcrop(a8);
imgcpd9=imcrop(a9);
imgcpd10=imcrop(a10);
imgcpd11=imcrop(a11);
imgcpd12=imcrop(a12);
imgcpd13=imcrop(a13);
imgcpd14=imcrop(a14);
imgcpd15=imcrop(a15);
imgcpd16=imcrop(a16);
imgcpd17=imcrop(a17);
imgcpd18=imcrop(a18);
imgcpd19=imcrop(a19);
imgcpd20=imcrop(a20);
imgcpd21=imcrop(a21);
imgcpd22=imcrop(a22);
imgcpd23=imcrop(a23);
imgcpd24=imcrop(a24);
imgcpd25=imcrop(a25);
imgcpd26=imcrop(a26);
imgcpd27=imcrop(a27);
imgcpd28=imcrop(a28);
imgcpd29=imcrop(a29);
imgcpd30=imcrop(a30);
imgcpd31=imcrop(a31);
imgcpd32=imcrop(a32);
imgcpd33=imcrop(a33);
imgcpd34=imcrop(a34);
imgcpd35=imcrop(a35);

%% Train the network. p is the input vector and t is the target vector
p=[imgcpd1,imgcpd2,imgcpd3,imgcpd4,imgcpd5,imgcpd6,imgcpd7,imgcpd8,imgcpd9,
imgcpd10,imgcpd11,imgcpd12,imgcpd13,imgcpd14,imgcpd15,imgcpd16,imgcpd17,
imgcpd18,imgcpd19,imgcpd20,imgcpd21,imgcpd22,imgcpd23,imgcpd24,imgcpd25,
imgcpd26,imgcpd27,imgcpd28,imgcpd29,imgcpd30,imgcpd31,imgcpd32,imgcpd33,
imgcpd34,imgcpd35];
t=[imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,
imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,
imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,
imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1,imgcpd1];
p=double(p);

t=double(t);
net=newrb(p,t,.001,.1,1000,25); %train using RBF net
save('gesture1net','net'); %save the network