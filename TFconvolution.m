function res = TFconvolution ( im1, im2, lignes, colonnes) 
% TFconvolution : convolue deux images par FFT en imposant la taille NxN
% USAGE : res = TFconvolution ( im1, im2, N) 
% ENTREES:
%    im1 : image d'entree 1 (centree en haut a gauche)
%    im2 : image d'entree 2 (centree en haut a gauche)
%    lignes, colonnes : taille voulue
% SORTIES : 
%    res : resultat de la convolution
%
%

% creation des TF
FFT1 = fft2(im1,lignes,colonnes) ;
FFT2 = fft2(im2,lignes,colonnes) ;

% convolution des images
conv = FFT1.*FFT2 ;
res = ifft2(conv) ;

end