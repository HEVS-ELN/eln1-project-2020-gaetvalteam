path = 'C:\Users\Ga�tan\Desktop\data\ConductiveProbe\';
freq = [];
V1=[];
V2=[];
for k=0:4
file = [path 'R10k_' num2str(k) '.csv'];
data = readmatrix(file, 'Range', 2);

freq(:,k+1) = data(:,1);
V2(:,k+1) = 10.^(data(:,3)/20).*exp(1j*data(:,4)*pi/180);
Amp2(:,k+1) = 10.^(data(:,3)/20);
Phase2(:,k+1) = data(:,4)*pi/180;
end
R1 = 10000;
Rpr = (R1 * Amp2 .* sqrt(tan(Phase2).^2 + 1)) ./ (1 - (Amp2 .* sqrt(tan(Phase2).^2 + 1)));
Cpr = - tan(Phase2) .* ((Rpr + R1) ./ (Rpr * R1)) .* (1./(2*pi*freq));

figure(1)
loglog(freq, Rpr);
title("Rpr en fonction de freq");
grid on;
hold on;
figure(2)
loglog(freq, Cpr);
title("Cpr en fonction de freq");
grid on;
hold on;
