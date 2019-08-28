function [ grayImage, finalPayload ] = decoding( grayImage, diffValArray )
    loopCount = numel(diffValArray)/2
    payload = double.empty;
    finalPayload = double.empty;
    while loopCount >= 1
        diffVal = diffValArray(loopCount, :);

        if diffVal(1) < diffVal(2) 
            for i = 1:256
                for j = 1:256
                    if grayImage(i, j) == diffVal(1) 
                        payload = [payload 0];
                    end
                    if grayImage(i, j) == diffVal(1) + 1
                        payload = [payload 1]
                    end
                end
            end

            for i = 1:256
                for j = 1:256
                    if grayImage(i, j) >= diffVal(1) && grayImage(i, j) < diffVal(2)
                        grayImage(i, j) = grayImage(i ,j) - 1;
                    end
                end
            end

        end

        if diffVal(1) > diffVal(2) 
            for i = 1:256
                for j = 1:256
                    if grayImage(i, j) == diffVal(1) 
                        payload = [payload 0];
                    end
                    if grayImage(i, j) == diffVal(1) - 1
                        payload = [payload 1];
                    end
                end
            end

            for i = 1:256
                for j = 1:256
                    if grayImage(i, j) < diffVal(1) && grayImage(i, j) >= diffVal(2)
                        grayImage(i, j) = grayImage(i ,j) + 1;
                    end
                end
            end

        end
        loopCount = loopCount - 1;
        finalPayload = [payload finalPayload];
    end
end

