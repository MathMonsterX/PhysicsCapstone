
r = 0.2794;%m   %~11in %radius of the wheel
v_o = 24.5872;%m/s  %55 mph
slip = 1 - ( r * w  ./ v );  

%% Maximize Slip

slip = 0:0.01:1;

f = rolling_friction( slip, 0.22, 0.9 );
hold on
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

fprintf('Max Friction Value at %.2f%% slip\n', val)
%%
v_o = 24.5872;%m/s  %55 mph
u_k = 