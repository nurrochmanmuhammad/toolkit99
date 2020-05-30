% Extract the individual red, green, and blue color channels.
[seismic1,text_header1,binary_header]=read_segy_file('C:\Users\R\Documents\MATLAB\model-hrs-tomo0-gli.sgy');
[seismic2,text_header2,binary_header]=read_segy_file('C:\Users\R\Documents\MATLAB\model-hrs-tomo0-gli.sgy');
[seismic3,text_header3,binary_header]=read_segy_file('C:\Users\R\Documents\MATLAB\model-hrs-tomo0-gli.sgy');

x=seismic1.traces;
y=seismic2.traces;
z=seismic3.traces;

a=1;
aR=1*a;
aG=1*a;
aB=1*a;
redChannel = ((x)./max(x(:)))*aR;
greenChannel = ((y)./max(y(:)))*aG;
blueChannel = ((z)./max(z(:)))*aB;


% Recombine separate color channels into an RGB image.
rgbImage = cat(3, redChannel, greenChannel, blueChannel);
% rgbImage = cat(3, x,y,z);
imshow(rgbImage)