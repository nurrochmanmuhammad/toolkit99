clear all;clc;

%UBAH LOKASI FILE YANG DIEDIT
[seismic2,ebcdic_header2,binary_header2]=read_segy_file_legacy('D:\STATIK\output.sgy',{'format','ibm'});
