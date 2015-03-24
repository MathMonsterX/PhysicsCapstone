% Name: Sheyla Trudo
% Course: PHYS 499A
% Project: Physics Capstone: The Physics of Braking
% File Creation Date: 3/20/2015
% Sources:
%         Nymandoro, Otis T.C;  Pedro, Jimoh O.; Dwoltazky, Barry; Dahunsi, Olurotimi A. 
%             "State Feedback Based Linear Slip Control Formulation for Vehicular Antilock Braking System". 
%             Proceedings of the World Congress on Engineering. Vol. 1, 2011.


r = 0.2794;%m   %~11in %radius of the wheel
v_o = 24.5872;%m/s  %55 mph
slip = 1 - ( r * w  ./ v );  

%% Maximize Slip

slip = 0:0.01:1;

hold on
f = rolling_friction( slip, 0.22, 0.9 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.8 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.7 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.6 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.5 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.4 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.3 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.2 );
plot( slip, f )
f = rolling_friction( slip, 0.22, 0.1 );
plot( slip, f )
hold off

[val, s] = max(f);

fprintf('Max Friction Value at %.2f%% slip\n', s)
%%
v_o = 24.5872;%m/s  %55 mph