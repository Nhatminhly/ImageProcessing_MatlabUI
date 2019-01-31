%%%This function takes an image, theta max and theta step  %%%
%%%and returns a 2D matrix where each row is the projection%%%
%%%of the original image at different angles               %%%
%%%by rotating the image and summing the pixels            %%%
function [hinhanh] = RadonTransform(img, theta, thetaStep)

    %Obtain the image size in the x-direction
    [x,y] = size(img);
    %Set a matrix R to hold the projection data
    R = zeros((theta/thetaStep)+1,x);
    %Set vector for the angles to take projections at
    angles = 0:thetaStep:theta;
    %Matrix to hold all the rotated images separately to prevent blurring
    rotatedImage = zeros(x,y,length(angles));

    %Loop to rotate image and add up values for the projections
    for i = 1:(length(angles))
        %rotate the image starting with theta = 0 degrees
        rotatedImage(:,:,i) = imrotate(img,angles(i),'nearest', 'crop');
        %Sum the columns of img to get projection data
        %Each row of R contains a projection at a certain theta
        R(i,:) = sum(rotatedImage(:,:,i),1);
    end

    %Convert the matrix to a gray scale image in the range 0 to 255
    R = mat2gray(R);

%     figure
%     axes(handles.axes3);
%    imshow(R)
%    title('The sinogram of Radon transform')
    hinhanh = R; 
end