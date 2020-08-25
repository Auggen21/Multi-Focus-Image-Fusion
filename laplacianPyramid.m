function lp = laplacianPyramid(I)
    
    N=5;
    A=I;
    for i=1:N
%         I =  double(I);
        G = imgaussfilt(I, 2);
        filt=floor(size(G)/2)+1;
        G = double(G);
        I = upConv(G,filt,'circular'); %Upsampled version of Gaussian image
        I = double(abs(real(I)));
        I = I-G.*I+G.*I;
        figure();
        imshow(I);title('L');
        lp = I + G;
    end
    return 
