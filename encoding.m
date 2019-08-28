grayImage = imread('test1.jpg');
transformedImage = grayImage;

[pixelCounts, grayLevels] = imhist(grayImage);

diffValArray = double.empty;
overHeadArray = double.empty;
diffVal = double.empty;

payload = (randi([0 1],10,1))';

loopCount = 1;
loopBreak = 0;
while true
    if loopBreak == 1
        disp('within');
        break;
    end

    [diffValArray loopBreak] = findValues(grayImage(:), transformedImage, loopCount, numel(payload));
    % diffValArray = [diffValArray; diffVal];
    % overHeadArray(:, :, loopCount) = overHead;
    % checkLength = checkLength + pixelCounts(diffVal(1));
    
    loopCount = loopCount + 1;
    % findValues(grayImage(:), transformedImage, loopCount, diffValArray);
end


for loopCount = 1:numel(diffValArray)/2
    diffVal = diffValArray(loopCount, :);
    overHead = uint8.empty;

    if pixelCounts(diffVal(2) + 1) > 0
        for i = 1:256
            for j = 1:256
                if transformedImage(i, j) == diffVal(2)
                    transformedImage(i, j) = 0;
                    overHead = [overHead; i j];
                end
            end
        end
        pixelCounts(minHistVal + 1) = 0;
    end

    if diffVal(1) < diffVal(2)
        for i = 1:256
            for j = 1:256
                if transformedImage(i, j) > diffVal(1) && transformedImage(i, j) < diffVal(2)
                    transformedImage(i, j) = transformedImage(i, j) + 1;
                end
            end
        end

        payloadBit = 1;

        for i = 1:256
            for j = 1:256
                if transformedImage(i, j) == diffVal(1) 
                    if payload(payloadBit) == 0
                        ;
                    else
                        transformedImage(i, j) = transformedImage(i, j) + 1;
                    end
                    payloadBit = payloadBit + 1;
                    if payloadBit == numel(payload)
                        break;
                    end
                end
            end
            if payloadBit == numel(payload)
                break;
            end
        end
    end

    if diffVal(1) > diffVal(2)
        for i = 1:256
            for j = 1:256
                if transformedImage(i, j) > diffVal(2) && transformedImage(i, j) < diffVal(1)
                    transformedImage(i, j) = transformedImage(i, j) - 1;
                end
            end
        end

        payloadBit = 1;

        for i = 1:256
            for j = 1:256
                if transformedImage(i, j) == diffVal(1) 
                    if payload(payloadBit) == 0
                        ;
                    else
                        transformedImage(i, j) = transformedImage(i, j) - 1;
                    end
                    payloadBit = payloadBit + 1;
                    if payloadBit == numel(payload)
                        break;
                    end
                end
            end
            if payloadBit == numel(payload)
                break;
            end
        end
    end

end




subplot(2,2,1);
imshow(grayImage); title('original image');

subplot(2,2,2);
imshow(transformedImage); title(psnr(transformedImage, grayImage));

subplot(2, 2, 3);
imhist(grayImage); title('original histogram');

subplot(2, 2, 4);
imhist(transformedImage); title('transformed image hostogram');
