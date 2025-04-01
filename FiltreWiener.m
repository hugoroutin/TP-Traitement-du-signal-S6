function res = FiltreWiener( img, h, lambda, lignes, colonnes)
% FiltreWiener : deconvolue une image par filtre de Wiener.
% USAGE : out = FiltreWiener( img, h, lambda, lignes, colonnes)
% ENTREES:
%    img : image d'entree (centree en haut a gauche)
%    h : noyau de convolution à compenser (centre en haut a gauche)
%    lambda : parametre du filtre (scalaire)
%    lignes, colonnes : taille voulue
% SORTIES : 
%    res : resultat de la convolution
%
% Note : implemente le filtre de Wiener pour un bruit blanc, lambda est une
% constante de regularistation liée à la puisssance du bruit
%

% creation des TF
FFTi = fft2(img,lignes,colonnes) ;
FFTh = fft2(h,lignes,colonnes) ;

FFTW = conj(FFTh)./(abs(FFTh).^2+lambda) ;
outf = FFTi.*FFTW;

res = real(ifft2(outf)); 
% le real est là pour éliminer la partie réelle résiduelle
