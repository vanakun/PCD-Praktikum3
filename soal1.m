% Nama : Dava Nabila Muzaky
% Nbi : 1462100153

% Citra Input
ImageInput = imread('kobi.png');
ImageInput = imresize(ImageInput, 0.25);
ImageInput = rgb2ycbcr(ImageInput);
hue = ImageInput(:,:,1);

% Mendapatkan ukuran citra
[rows, cols, ~] = size(hue);

% panjang gelombang
pnjg_gelombang_min = 4/sqrt(2);
pnjg_gelombang_max = hypot(rows, cols);
n = floor(log2(pnjg_gelombang_max / pnjg_gelombang_min));
wavelength = 2.^(0:(n-2)) * pnjg_gelombang_min;

% orientasi
teta = 45;
orientasi = 0:teta:(180-teta);

% panjang wave dan orientasi
x = gabor(wavelength, orientasi);

% besaran gabor
gabormag = imgaborfilt(hue, x);

% smoothing
for i = 1:length(x)
    sigma = 0.5 * x(i).Wavelength;
    K = 3;
    gabormag(:,:,i) = imgaussfilt(gabormag(:,:,i), K * sigma);
end

% klasifikasi
X = 1:cols;
Y = 1:rows;
[X, Y] = meshgrid(X, Y);
featureSet = cat(3, gabormag, X);
featureSet = cat(3, featureSet, Y);

% convert ke vector
numPoints = rows * cols;
X = reshape(featureSet, rows * cols, []);

% normalisasi
X = bsxfun(@minus, X, mean(X));
X = bsxfun(@rdivide, X, std(X));

% segmentasi (NBI 5)
k = 3;
L = kmeans(X, k);
L = reshape(L, [rows cols]);
outputImg = label2rgb(L);

figure, imshow(outputImg);
title('Soal 1');

% pemrosesan citra menggunakan filter Gabor untuk mengekstrak fitur tekstur. Setelah membaca dan menyesuaikan ukuran citra, filter Gabor diterapkan dengan variasi 
% panjang gelombang dan orientasi. Fungsi Gaussian filter digunakan untuk melicinkan respons Gabor. Hasil ekstraksi fitur digabungkan dengan koordinat piksel dan 
% diubah menjadi vektor. Normalisasi dilakukan dengan mengurangkan rata-rata dan membagi dengan deviasi standar. Selanjutnya, dilakukan segmentasi menggunakan 
% algoritma k-means dengan tiga klaster, dan hasilnya ditampilkan dalam citra warna yang sudah diklasifikasi.