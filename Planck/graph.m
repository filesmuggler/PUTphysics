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

## DATA
% generating step vector
u1 = [10 : -0.5 : 0];

% vector with U1 voltage (obtained from transposed vector)
U1 = u1';

% vector with U2[mV] voltage (obtained from experiment)
u2 = [11.46; 11.30; 11.14; 11.01; 10.82; 10.59; 10.36; 10.14; 9.86; 9.55; 9.20; 8.63; 7.99; 7.23; 6.44; 5.47; 4.48; 3.42; 2.45; 1.54; 0.79];

% 1/1000 coefficient
a = 0.001;

% vector with U2[V]
U2 = a .* u2;

% resistance R = 10 MOhms
R = 10000000;

## OPERATIONS
% calculating vector of current
I = U2/R;

% plotting the graph
plot(U1,I,'-o;I=f(U1);');
title("I=f(U1)");
xlabel("Voltage U1[V]");
ylabel("Current I [A]");
grid on;
     
% saving to file
print -djpeg figure-plots.jpeg;