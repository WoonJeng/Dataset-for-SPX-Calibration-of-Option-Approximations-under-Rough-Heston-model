format shortg
projFolder = fileparts(matlab.desktop.editor.getActiveFilename);
addpath(genpath(projFolder));

spx = xlsread('spx_pade_data.csv');
spx_decom = xlsread('spx_decomp.csv');
s0 = 4221.86;
data = spx;


T_unique = unique(spx(:,1));
K_unique = unique(spx(:,2));
T_size = size(T_unique,1);
K_size = size(K_unique,1);
lowest_vol = floor(min([spx(:,5:8) spx_decom(:,6)],[],'all')*100)/100;
max_vol = ceil(max([spx(:,5:8) spx_decom(:,6)],[],'all')*100)/100;

colortype = [[1 0 0];[0 1 0];[0 0.4470 0.7410];[1 0.07451 0.65098];[0.71765 0.27451 1];[0.5 0.5 0.5];[0.79 0.43 0.12]];

marker = ['o', 'x', 's', 'd','*'];


%pick a time maturity, i=1,...,T_size
hold on;
box on;
i = 1;
plot_color = colortype(i,:);
start_pt = (i-1)*K_size+1;
end_pt = i*K_size;
plt_spx1 = plot(data(start_pt:end_pt,2), data(start_pt:end_pt,5));
plt_spx1.Color = colortype(1,:);
plt_spx1.LineStyle = '--';
plt_spx1.LineWidth = 2;
plt2 = plot(data(start_pt:end_pt,2), data(start_pt:end_pt,6),marker(1));
plt2.Color = colortype(2,:);
plt2.MarkerSize = 10;

plt3 = plot(data(start_pt:end_pt,2), data(start_pt:end_pt,7),marker(2));
plt3.Color = colortype(3,:);
plt3.MarkerSize = 10;

plt4 = plot(data(start_pt:end_pt,2), data(start_pt:end_pt,8),marker(3));
plt4.Color = colortype(4,:);
plt4.MarkerSize = 10;

plt5 = plot(data(start_pt:end_pt,2), data(start_pt:end_pt,9),marker(4));
plt5.Color = colortype(5,:);
plt5.MarkerSize = 10;

plt6 = plot(data(start_pt:end_pt,2), spx_decom(start_pt:end_pt,6),marker(5));
plt6.Color = colortype(6,:);
plt6.MarkerSize = 10;

xlabel('Log-moneyness') 
ylabel('Implied Volatility') 
title(['T = ' num2str(T_unique(i),'%.2f')]);
ylim([lowest_vol-0.01 max_vol+0.01]);
%legend('SPX Implied Volatility' ,'Pade (7,2)','Pade (6,3)','Pade (5,4)','GPade')
hold off;

set(gcf, 'Color', 'w');

%export_fig 'padespx1.5.png' -native

