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


## DATA
v = [7.49481E+14,	7.05394E+14,	6.87597E+14,	5.99585E+14,	5.45077E+14,	5.21378E+14,	4.99654E+14,	4.79668E+14,	4.61219E+14,	4.44137E+14];
Ek = [1.60218E-19;	1.12152E-19;	1.00937E-19;	6.40871E-20;	5.28718E-20; 2.40326E-20;	1.92261E-20;	1.76239E-20;	1.28174E-20;	6.40871E-21];
m=length(v);
V=[ones(m,1) v(:)];


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
[p,e_var,r,p_var,y_var] = LinearRegression(V,Ek);
VFit = V*p;

% calculating standard deviation
d = Ek.-VFit;
s = d.*d;

summary = 0;

for entry = [1:1:length(d)]
  summary = summary + s(entry);
end;

stnd_dev = sqrt(summary/length(d))

% calculating slope coefficient
aR = calcSlopeCoeff(VFit(1),VFit(2),v(1),v(2));

% calcualting Y axis value
yAxis = calcYAxis(VFit(5),v(5),aR)

% calculating threshold frequency for metal
v_threshold = - yAxis/aR;

% calcualting planck constant
planck = VFit(5)/(v(5)-v_threshold)

% calculating work function
wf = planck * v_threshold

% plotting the graph
plot(v,Ek,'-o;Ek=f(v);',v,VFit,'-o');
title("Ek=f(v)");
xlabel("Frequency v[THz]");
ylabel("Kinetic energy Ek[J]");
grid on;

% saving to file
print -djpeg figure-planck.jpeg;