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
% vector of break voltage Uh[V]
Uh = [-1.00;	-0.70;	-0.63;	-0.40;	-0.33;	-0.15;	-0.12;	-0.11;	-0.08;	-0.04];

% vector of light frequency v[THz]
v = [749; 705;	688;	600;	545;	521;	500;	480;	461; 444];

## OPERATIONS
% plotting the graph
plot(v,Uh,'-o;Uh=f(v);');
title("Uh=f(v)");
xlabel("Frequency v[THz]");
ylabel("Break voltage Uh[V]");
grid on;

% saving to file
print -djpeg figure-breakvoltage.jpeg;