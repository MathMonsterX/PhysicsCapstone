% Name: Sheyla Trudo
% Course: PHYS 499A
% Project: Physics Capstone: The Physics of Braking
% File Creation Date: 3/23/2015
% Sources:
%         Nymandoro, Otis T.C;  Pedro, Jimoh O.; Dwoltazky, Barry; Dahunsi, Olurotimi A. 
%             "State Feedback Based Linear Slip Control Formulation for Vehicular Antilock Braking System". 
%             Proceedings of the World Congress on Engineering. Vol. 1, 2011.
% 
%         Owen, Frank PHD PE. "Modeling of Car Braking with and Without ABS". Cal Poly. 13 July 2012.

%% Initial Variables

g = 9.8; %m/s^2
B = 0.08; %kgm^2/s
t_b = 10000; %Nm
J = 0.8; %kgm^3
v_o = 24.5872; %m/s  %55 mph
u_o = 0.9;
l_o = 0.22;
r = 0.3; %m
M = 440; %kg
F_z = M * g;

%% Equations
syms t x v r w l; %time, distance to wall, velocity of car, wheel radius, angular velocity of wheels, slip

% a = diff( v, t );
% alpha = diff( w, t );
% 
% diff( w, t ) = diff( r, t, 2 );
% diff( v, t ) = diff( x, t, 2 );

% l = ( v - r*w ) / v;
% u = symfun(( l_o * l ) / ( (l_o^2) + (l^2) ), l);
% 
% diff( r, t, 2 ) = ( ( 2 * u_o * l_o * r * v * F_z * ( v - r * w ) ) /( (v^2)*(l_o^2) + ((v - r * w)^2) ) ) - B*w - t_b;
% diff( x, t, 2 ) = ( ( 2 * u_o * l_o * v * F_z )*( r * w - v ) )/ ( M * ( ( (v - r*w)^2 ) + (l_o^2)*(v^2) ) );

dsolve( 'Dv = D2x', ...
                      'Dw = D2r', ...
                      'l = ( v - r*w ) / v', ...
                      'u = ( l_o * l ) / ( (l_o^2) + (l^2) )', ...
                      'D2r = ( ( 2 * u_o * l_o * r * v * F_z * ( v - r * w ) ) /( (v^2)*(l_o^2) + ((v - r * w)^2) ) ) - B*w - t_b', ...
                      'D2x = ( ( 2 * u_o * l_o * v * F_z )*( r * w - v ) )/ ( M * ( ( (v - r*w)^2 ) + (l_o^2)*(v^2) ) )', ...
                      'g = 9.8', ... %m/s^2
                      'B = 0.08', ... %kgm^2/s
                      't_b = 10000', ... %Nm
                      'J = 0.8', ... %kgm^3
                      'v_o = 24.5872', ... %m/s  %55 mph
                      'u_o = 0.9', ...
                      'l_o = 0.22', ...
                      'r = 0.3', ...%m
                      'M = 440', ... %kg
                      'F_z = M * g', ...
                      'v', 'w', 'x', 'u', 'r' ...
                      )

%f = solve( [a, alpha], [v, w])
%%

