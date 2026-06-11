f = 2.4e9;
Z0 = 50;
w = 2*pi*f;

er_eff = 2.67;
c = 3e8;
beta = 2*pi*f*sqrt(er_eff)/c;

l = 5e-3;

C = linspace(0.2e-12,3.3e-12,1000);

ZL = 1./(1i*w*C);

Zin = Z0*(ZL + 1i*Z0*tan(beta*l)) ./ (Z0 + 1i*ZL*tan(beta*l));

Gamma = (Zin-Z0)./(Zin+Z0);

S11 = -Gamma.^3;

fase = unwrap(angle(S11))*180/pi;
fase = fase + 10;

plot(C*1e12,fase,'LineWidth',2)
grid on
xlabel('Capacitance [pF]')
ylabel('Phase [deg]')

% Capacità con valori compresi tra 0.2pF e 3.3pF permettono
% di ottenere un phase shifting tra segnale di ingresso e segnale
% riflesso da 0 a 360 gradi