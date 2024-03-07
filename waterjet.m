clc
clear all
%A waterjet with a kinetic power of 12.3 kW is equipped with a orifice of 0.3 mm in diameter. 
%Considering that the discharge coefficient is 0.65, the velocity coefficient is 0.98 and the water compressibility is 0.96.
%Calculate the pressure of the WJ is operating at (Assume water density is 1000 kg/m3).

pk = 12300; % Kinetic Power in Watts
cv = 0.98; % Velocity coefficient
phi = 0.96; % Water compression 
cc = 0.65; % Discharge coefficient 
dn = 0.0003; % Orifice nominal diameter in meters
rho = 1000; % Density in kg/m^3

% Calculate pressure
p = (pk / ((cv^2)*(phi^2)*cc*((dn^2)/4)*pi*sqrt(2/rho)))^(2/3);
%conversion to MPa
p_in_Mpa = p/1e6

% Also calculate the WJ thrust force considering a 20% loss in exit velocity and a 30° angle of deflection.
nvout = 0.8; %loss factor
vout = 30; %angle of deflection 

mw = rho*cc*pi*(((dn^2)/4)*10^6)*sqrt((2e6*p_in_Mpa)/rho); %water mass flow rate
%convertion to kg/s
mw_in_kgs= mw/10^6;

vj=cv*phi*sqrt((2e6*p_in_Mpa/rho)); %waterjet velocity

fz=mw_in_kgs*vj*(1+(nvout*cos(deg2rad(vout)))) %In N
