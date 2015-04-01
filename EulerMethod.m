%% Euler Method of Computing
t_o = 0;
g = 9.81; % m/s^2
J = 0.8;    %kg*m^2
B = 0.0;   %kg*m^2/s
tau = 75;  %braking torque
l_o = 0.22;
u_o = 0.9;
M = 220;    %kg - Normal Mass
r = 0.22; %m - radius of wheel
delta_t = 0.1;  %time step

t = delta_t;

v_o = 25; %m/s
v_i = v_o;

w_o = v_i / r;
w_i = w_o;

x = 0;

w_array = [];
v_array = [];
t_array = [];
l_array = [];
u_array = [];
x_array = [];

fprintf('%5s \t %10s \t %10s \t %10s \t %10s \t %10s \n', 't', 'v', 'w', 'u(l)', 'l', 'x')

while ( v_i > 0.00001 )
    
        
    
        l = 1 - ( (r*w_i) / v_i );
        u = (l_o * l) / ( (l_o^2) + (l^2) );
    
        v_i1 = v_i - u * g * delta_t;
        w_i1 = (delta_t/J)*( u * M * g * r - B * w_i - tau );
        x_1 = v_i*delta_t + x;
    
        fprintf('%5.2f \t %10.4f \t %10.4f \t %10.4f \t %10.4f \t %10.4f\n', t, v_i1, w_i1, u, l, x)
    
        t = t + delta_t;
        v_i = v_i1;
        w_i = w_i1;
        x = x_1;
        
        w_array = cat(1, w_array, w_i);
        v_array = cat(1, v_array, v_i);
        t_array = cat(1, t_array, t);
        l_array = cat(1, l_array, l);
        u_array = cat(1, u_array, u);
        x_array = cat(1, x_array, x);
end;

comet( t_array, u_array )
shading flat