function [diffVal loopBreak] = findValues( grayImage, transformedImage, n, payloadLength )
    % diffVal = double.empty;

    % [pixelCounts, grayLevels] = imhist(grayImage);
    % sortedCounts = sort(pixelCounts);

    % minCounts = sortedCounts(n);
    % maxCounts = sortedCounts(numel(sortedCounts) - n + 1);

    % maxHistVal = find(pixelCounts==maxCounts) - 1;
    % minHistVal = find(pixelCounts==minCounts) - 1;

    % checkValMax = 1;
    % checkValMin = 1;
    % check = ismember([maxHistVal(checkValMax) minHistVal(checkValMin)], diffValArray);
    
    % if check(1)
    %     while check(1)
    %         checkValMax = checkValMax + 1;
    %         check = ismember([maxHistVal(checkValMax) minHistVal], diffValArray);
    %     end
    % end

    % if check(2)
    %     while check(2)
    %         checkValMin = checkValMin + 1;
    %         check = ismember([maxHistVal minHistVal(checkValMin)], diffValArray);
    %     end
    % end


    % diffVal = [maxHistVal(checkValMax) minHistVal(checkValMin)];
    % loopBreak = 1;

    diffVal = double.empty;
    [pixelCounts, grayLevels] = imhist(grayImage);
    sortedCounts = sort(pixelCounts);

    


end

