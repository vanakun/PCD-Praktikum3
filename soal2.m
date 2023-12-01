% Nama : Dava Nabila Muzaky
% Nbi : 1462100153


ImgInput = imread('kobi.png');
ImgInput = imresize(ImgInput, 0.25);
ImgInput = double(ImgInput);
ImgInputHSV = rgb2hsv(ImgInput);
imgInputYcbcr = rgb2ycbcr(ImgInput);
imgInputNtsc = rgb2ntsc(ImgInput);
imgInputCielab = rgb2lab(ImgInput);
imgInputGray = rgb2gray(ImgInput);

kmean_rgb = 3;

% hsv
% size
[x, y, z] = size(ImgInputHSV);
% bentuk vector
imgInputVector = reshape(ImgInputHSV, x*y, z);
% clustering
[index, c] = kmeans(imgInputVector, kmean_rgb);
% vector ke matrix
kmean_m = reshape(index, x, y);
kmean_hsv = label2rgb(kmean_m);


% ycbcr
% size
kmean_rgb = 3;
[x, y, z] = size(imgInputYcbcr);
% bentuk vector
imgInputVector = reshape(imgInputYcbcr, x*y, z);
% clustering
[index, c] = kmeans(imgInputVector, kmean_rgb);
% vector ke matrix
kmean_m = reshape(index, x, y);
kmean_ycbcr = label2rgb(kmean_m);

% rgb
% size
kmean_rgb = 3;
[x, y, z] = size(ImgInput);
% bentuk vector
imgInputVector = reshape(ImgInput, x*y, z);
% clustering
[index, c] = kmeans(imgInputVector, kmean_rgb);
% vector ke matrix
kmean_m = reshape(index, x, y);
kmean_rgb = label2rgb(kmean_m);

% cielab
% size
kmean_rgb = 3;
[x, y, z] = size(imgInputCielab);
% bentuk vector
imgInputVector = reshape(imgInputCielab, x*y, z);
% clustering
[index, c] = kmeans(imgInputVector, kmean_rgb);
% vector ke matrixa
kmean_m = reshape(index, x, y);
kmean_cielab = label2rgb(kmean_m);

% ntsc
% size
kmean_rgb = 3;
[x, y, z] = size(imgInputNtsc);
% bentuk vector
imgInputVector = reshape(imgInputNtsc, x*y, z);
% clustering
[index, c] = kmeans(imgInputVector, kmean_rgb);
% vector ke matrix
kmean_m = reshape(index, x, y);
kmean_ntsc = label2rgb(kmean_m);


subplot(2, 2, 1), imshow(kmean_ycbcr), title(' ycbcr');
subplot(2, 2, 2), imshow(kmean_hsv), title(' hsv');
subplot(2, 2, 3), imshow(kmean_cielab), title(' cielab');
subplot(2, 2, 4), imshow(kmean_ntsc), title(' ntsc');

% citra mengalami segmentasi menggunakan k-means pada ruang warna hsv, ycbcr, rgb, cielab, dan ntsc. Citra awal diubah ke vektor setelah konversi ke berbagai ruang warna.
% Proses k-means dengan tiga klaster diterapkan untuk memisahkan citra ke dalam tiga kelompok warna. Hasilnya ditampilkan dalam empat subplot untuk setiap ruang warna, 
% memberikan gambaran visual terhadap distribusi warna. Proses segmentasi ini memungkinkan pemisahan yang jelas antara area dengan warna yang serupa. 
% Output dari empat subplot memberikan pemahaman yang lebih baik tentang struktur warna dalam citra, memudahkan analisis.