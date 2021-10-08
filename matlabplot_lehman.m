format shortg

projFolder = fileparts(matlab.desktop.editor.getActiveFilename);
addpath(genpath(projFolder));
spx_lehman912 = xlsread('spx_pade_data_lehman912.csv');
decomp_lehman912 = xlsread('spx_decomp_lehman912.csv');
s0 = 1247.82;
data1 = spx_lehman912;

spx_lehman915 = xlsread('spx_pade_data_lehman915.csv');
decomp_lehman915 = xlsread('spx_decomp_lehman915.csv');
s0 = 1210.21;
data2 = spx_lehman915;

T_unique = unique(data1(:,1));
K_unique = unique(data1(:,2));
T_size = size(T_unique,1);
K_size = size(K_unique,1);
lowest_vol = floor(min([data1(:,5:8) data2(:,5:8) decomp_lehman912(:,6) decomp_lehman915(:,6)],[],'all')*100)/100;
max_vol = ceil(max([data1(:,5:8) data2(:,5:8) decomp_lehman912(:,6) decomp_lehman915(:,6)],[],'all')*100)/100;

colortype = [[1 0 0];[0.1176 0.5647 1]];

marker = ['o', 'x', 's', 'd', '*'];


%pick a time maturity, i=1,...,T_size
hold on;
box on;
i = 4;
start_pt = (i-1)*K_size+1;
end_pt = i*K_size;
plt_spx1 = plot(data1(start_pt:end_pt,2), data1(start_pt:end_pt,5));
plt_spx1.Color = colortype(1,:);
plt_spx1.LineStyle = '--';
plt_spx1.LineWidth = 2;
plt2 = plot(data1(start_pt:end_pt,2), data1(start_pt:end_pt,6),marker(1));
plt2.Color = colortype(1,:);
plt2.MarkerSize = 10;
plt3 = plot(data1(start_pt:end_pt,2), data1(start_pt:end_pt,7),marker(2));
plt3.Color = colortype(1,:);
plt3.MarkerSize = 10;
plt4 = plot(data1(start_pt:end_pt,2), data1(start_pt:end_pt,8),marker(3));
plt4.Color = colortype(1,:);
plt3.MarkerSize = 10;
plt5 = plot(data1(start_pt:end_pt,2), data1(start_pt:end_pt,9),marker(4));
plt5.Color = colortype(1,:);
plt3.MarkerSize = 10;
plt_decom912 = plot(data1(start_pt:end_pt,2), decomp_lehman912(start_pt:end_pt,6),marker(5));
plt_decom912.Color = colortype(1,:);
plt_decom912.MarkerSize = 10;

plt_spx2 = plot(data2(start_pt:end_pt,2), data2(start_pt:end_pt,5));
plt_spx2.Color = colortype(2,:);
plt_spx2.LineStyle = '--';
plt_spx2.LineWidth = 2;
plt6 = plot(data2(start_pt:end_pt,2), data2(start_pt:end_pt,6),marker(1));
plt6.Color = colortype(2,:);
plt6.MarkerSize = 10;
plt7 = plot(data2(start_pt:end_pt,2), data2(start_pt:end_pt,7),marker(2));
plt7.Color = colortype(2,:);
plt7.MarkerSize = 10;
plt8 = plot(data2(start_pt:end_pt,2), data2(start_pt:end_pt,8),marker(3));
plt8.Color = colortype(2,:);
plt8.MarkerSize = 10;
plt9 = plot(data2(start_pt:end_pt,2), data2(start_pt:end_pt,9),marker(4));
plt9.Color = colortype(2,:);
plt_decom915 = plot(data2(start_pt:end_pt,2), decomp_lehman915(start_pt:end_pt,6),marker(5));
plt_decom915.Color = colortype(2,:);
plt_decom915.MarkerSize = 10;


xlabel('Log-moneyness') 
ylabel('Implied Volatility') 
title(['T $$\approx$$ ' num2str(T_unique(i),'%.2f')],'interpreter','latex');
ylim([lowest_vol-0.01 max_vol+0.01]);
%legend('SPX Implied Volatility' ,'Pade (7,2)','Pade (6,3)','Pade (5,4)','GPade')
hold off;

set(gcf, 'Color', 'w');

%export_fig 'padespx_lehman1.75.png' -native


