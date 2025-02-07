
imageFolder = 'D:\EIT Images';
imageFiles = dir(fullfile(imageFolder, '*.jpg')); 

totalVolume = 0;
malignantImages = {};
nonMalignantImages = {};

for i = 1:length(imageFiles) 
    img = imread(fullfile(imageFolder, imageFiles(i).name)); 
    
    img_filtered = imgaussfilt(img, 2); 
    img_normalized = mat2gray(img_filtered);      
  
    level = graythresh(img_normalized);
    bw = imbinarize(img_normalized, level); 
    bw_cleaned = imopen(bw, strel('disk', 5)); 

    stats = regionprops(bw_cleaned, 'Area', 'Perimeter', 'BoundingBox', 'Centroid');

  
    volume = 0;
    isMalignant = false;     

    if ~isempty(stats)
        for k = 1:length(stats)
            volume = volume + stats(k).Area; 
            
            if classifyCancer(stats(k).Area) 
                isMalignant = true; 
                fprintf('Malignant area detected at: %.2f, %.2f\n', stats(k).Centroid);
                fprintf('Area: %.2f pixels\n', stats(k).Area);
                
             
            end
        end
    end


    if isMalignant
        fprintf('Malignant Detected! Total Volume: %.2f\n', volume);

        
    else
        fprintf('Not Malignant.\n');
    end

    imshow(img); 
    
    hold on;
    
    for k = 1:length(stats)
        if classifyCancer(stats(k).Area) 
         
        end
    end
    
    hold off;
end


function isMalignant = classifyCancer(area)
    thresholdArea = 100; 
    isMalignant = area > thresholdArea;


end
