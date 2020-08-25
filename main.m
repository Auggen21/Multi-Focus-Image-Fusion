clc;
clear all;
close all;

[imagename1, imagepath1]=uigetfile('images-test\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
A=imread(strcat(imagepath1,imagename1));    
[imagename2, imagepath2]=uigetfile('images-test\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the second input image');
B=imread(strcat(imagepath2,imagename2));  
if size(A)~=size(B)
    error('two images are not the same size.');
end
A=imresize(A,[256 256]);
B=imresize(B,[256 256]);
Ain=A;
Bin=B;
 aBl=imfilter(A,fspecial('motion',10,5),'replicate');
 bNo=B;
figure,subplot(121),imshow(A);title('Input Image 1');
subplot(122),imshow(B);title('Input Image 2')

if size(A,3)==3
A=rgb2gray(A);%gray
B=rgb2gray(B);
end

I = A;
I =  double(I);
lp=laplacian(I,'laplace',5);
for i=1:5
    figure();
    imshow(lp{1,i});
    title(['Laplacian Pyramid level ',num2str(i)]);
end