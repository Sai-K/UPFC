% Voltage source converter using sinusoidal pulse width modulation

ma 		= 0.6;      %modulation factor
Vdc 	= 400;      %Dc voltage
tri_t 	= 0.2e-3;   %time period of triangular wave
tri_peak= 20;       %peak value of triangular wave
sine_peak= tri_peak*ma;
f 		=  1/tri_t; %frequency of tri wave
fs 		=  5000;   	%switching frequency

t 		= 0:tri_t/3000:tri_t*90;                 %initialising time array for computing waveform
Vtri 	= tri_peak*sawtooth(2*pi*fs*t,0.5);	
plot(t,Vtri);
hold on;
Vf 		= sine_peak *sin(2*pi*f/30*t);
 plot(t,Vf);

for i = 1:length(t);
	if Vf(i)>= 0 & Vf(i) > Vtri(i)
		Vab(i) = Vdc;                           %provide gate pulse for one cross pair
    
	elseif Vf(i)<0 & -(Vf(i)) > -Vtri(i);
    	Vab(i) = -Vdc;                          %provide gate pulse for other cross pair

	else
		Vab(i) = 0;
	end
end

plot (t, Vab); ylim([-500 500]),grid;
xlabel('Time in seconds');
ylabel('Amplitude in volts');
title('Sinusoidal pulse width modulated signal');
