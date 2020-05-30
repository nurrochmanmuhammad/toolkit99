clear all;clc;
[seismic,text_header,binary_header]=read_segy_file_legacy('C:\Users\R\Documents\MATLAB\model-hrs-tomo0-gli.sgy');

bentangan=((seismic.headers(11,1)-seismic.headers(11,end))^2+(seismic.headers(12,1)-seismic.headers(12,end))^2)^0.5;

d=length(seismic.traces(:,1));
b=930; %original bottom model from hrs (segy)
top=0; %original top model from hrs
dz=[top:((b)/(d-1)):b+top];
r=seismic.headers(3,end);

X=[-10.6,8590];
dx=[X(1):(X(2)-X(1))/(r-1):X(2)];

[XX,YY] = meshgrid(dx,dz);
dx2=[X(1)-100:10:X(2)+100];
dz2=[-200:10:b+top];
[XX2,YY2] = meshgrid(dx2,dz2);

V2=TriScatteredInterp(XX(:),YY(:),seismic.traces(:),'nearest');

Ve=V2(XX2,YY2);

i=XX2(:);
j=XX2(:);
k=YY2(:);
vel=Ve(:);
vel(isnan(vel))=352;
vel(vel==0)=352;

XYZ=[i,j,k,vel];
% for i=1:d
%     xyz(1+(i-1)*r:(i-1)*r+r,1)=dx';
%     xyz(1+(i-1)*r:(i-1)*r+r,2)=dx';
%     xyz(1+(i-1)*r:(i-1)*r+r,3)=ones(r,1)*dz(i);
%     xyz(1+(i-1)*r:(i-1)*r+r,4)=seismic.traces(i,:)';
% end

save('c:\testreshape.dat','XYZ','-ascii');

