## Copyright (C) 2017 Krzysztof Stezala <krzste09@outlook.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.
##
## Purpose of the program
## Calculating and presenting data obtained at laboratory 
## measurements at Poznan University of Technology.
##
## LinearRegression() function is defined in LinearRegression.m file and distributed under
## GPLv3 licence, Copyright (C) 2007-2013 Andreas Stahel <Andreas.Stahel@bfh.ch>

## CLEANUP
clear;
clc;
close all;




## DATA
% refractive index vector with respect to the concetration (without X)
refrIndexConc = [1.331; 1.343; 1.368; 1.395; 1.424; 1.469];

% concentration of glicerol vector (without X)
conGlicerol = [0,10,30,50,70,100];

% vectors for linear regression
m = length(conGlicerol);
V = [ones(m,1) conGlicerol(:)];

% refractive index vector with respect to the temperature
% of 100% concentration of glicerol
refrIndexTemp = [1.469, 1.468, 1.467, 1.467, 1.466, 1.465, 1.465, 1.464, 1.464, 1.463, 1.463, 1.461, 1.460, 1.460, 1.459]; 
                 
% temperature of 100% glicerol
temp = [28,31,34,37,40,43,46,49,52,55,58,61,64,67,70];

% X concentration refractive index value
y = 1.382;


## FUNCTIONS
% calculating slope coeffcient of linear regression
function slopeCoefficent = calcSlopeCoeff(y_1, y_2, x_1, x_2)
  slopeCoefficent = (y_1 - y_2)/(x_1 - x_2);  
  endfunction
 
% calculating the value on the Y axis for linear regression
function yAxis = calcYAxis(y,x,a)
    yAxis = y-(a*x);
endfunction



## OPERATIONS
% calculating linear regression
[p,e_var,r,p_var,y_var] = LinearRegression(V,refrIndexConc);
VFit = V*p;

% calculating slope coefficient
aR = calcSlopeCoeff(VFit(1),VFit(2),conGlicerol(1),conGlicerol(2));

% calcualting Y axis value
yAxis = calcYAxis(VFit(3),conGlicerol(3),aR);

% plotting the graph
subplot(311);
plot(conGlicerol,refrIndexConc,'-o;R=f(c);');
title("R=f(c)");
xlabel("Glicerol concentration [%]");
ylabel("Refractive index");
grid on;

subplot(312);
plot(conGlicerol,refrIndexConc,'-o;R=f(c);',conGlicerol,VFit,'-;lin.reg.;');
title("R=f(c)");
xlabel("Glicerol concentration [%]");
ylabel("Refractive index");
grid on;

subplot(313);
plot(temp, refrIndexTemp,'-o;R=f(t);');
title("R=f(t)");
xlabel("Temperature [Celsius Degrees]");
ylabel("Refractive index");
grid on;

% X concentration variable [%]
X = (y-yAxis)/aR

% saving to file
print -djpeg figure.jpeg;


