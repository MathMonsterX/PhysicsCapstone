%% Euler Method of Computing
%hold on
x_max_array = [];
t_max_array = [];
u_max_array = [];
l_max_array = [];

t_o = 0;        % s
g = 9.81;       % m/s^2
J = 0.8;        % kg*m^2 - 
B = 0.08;        % kg*m^2/s
%tau = 500;       % N*m - braking torque
l_o = 0.22;
u_o = 0.9;
M = 220;        % kg - Normal Mass
r = 0.28;       % m - radius of wheel
delta_t = 0.001; % s - time step
v_o = 25; %m/s

for tau=linspace(562, 564, 10)

    t = t_o;
    v_i = v_o;
    w_o = v_i / r;
    w_i = w_o;
    x = 0;
    mult = 1;
    
    w_array = [];
    v_array = [];
    t_array = [];
    l_array = [];
    u_array = [];
    x_array = [];

    fprintf('%5s \t %10s \t %10s \t %10s \t %10s \t %10s \n', 't', 'v', 'w', 'u(l)', 'l', 'x')
    

    while ( v_i > 1 )
    
            l = 1 - ( (r*w_i) / v_i );
%             if ( l > 1 ) 
%                 l = 1;
%             elseif ( l < 0 )
%                 l = 0;
%             end

            u = 2*u_o*( (l_o * l) / ( (l_o^2) + (l^2) ) );

            v_i1 = v_i - u * g * delta_t;

            w_i1 = (delta_t/J)*( u * M * g * r - 0 * w_i - tau ) + w_i;
            if( w_i1 <= 0 )
                mult = 0;
            else
                mult = 1;
            end
            w_i1 = mult*w_i1;

            x_1 = v_i*delta_t + x;

            fprintf('%5.2f \t %10.4f \t %10.4f \t %10.4f \t %10.4f \t %10.4f\n', t, v_i1, w_i1, u, l, x)

            t = t + delta_t;
            v_i = v_i1;
            w_i = w_i1;
            x = x_1;

            plot( t_array, l_array )
            w_array = cat(1, w_array, w_i);
            v_array = cat(1, v_array, v_i);
            t_array = cat(1, t_array, t);
            l_array = cat(1, l_array, l);
            u_array = cat(1, u_array, u);
            x_array = cat(1, x_array, x);
            
    end;

    %plot( t_array, x_array )
    x_max_array = cat(1, x_max_array, [max( x_array ), tau]);
    t_max_array = cat(1, t_max_array, [max( t_array ), tau]);
    u_max_array = cat(1, u_max_array, [max( u_array ), tau]);
    l_max_array = cat(1, l_max_array, [max( l_array ), tau]);
end;
plotx =  x_max_array(:,1)
ploty = x_max_array(:,2)
plot( plotx, ploty )
min(t_max_array)
max(u_max_array)

%% Midpoint  Approximation - Computing Using 2 Timesteps 
t_o = 0;        % s
g = 9.81;       % m/s^2
J = 0.8;        % kg*m^2 - 
B = 0.08;        % kg*m^2/s
tau = 500;       % N*m - braking torque
l_o = 0.22;
u_o = 0.9;
M = 220;        % kg - Normal Mass
r = 0.28;       % m - radius of wheel
delta_t = 0.001; % s - time step

t = t_o;

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
mult1 = 1;
mult2 = 1;
while ( v_i > 0.1 )
    
        % First block ------------------
        l_1 = 1 - ( (r*w_i) / v_i );
        if ( l_1 > 1 ) 
            l_1 = 1;
        elseif ( l_1 < 0 )
            l_1 = 0;
        end
        
        u_1 = 2*u_o*( (l_o * l_1) / ( (l_o^2) + (l_1^2) ) );
        
        w_i1 = mult1*(delta_t/J)*( u_1 * M * g * r - B * w_i - tau ) + w_i;
        if( w_i1 <= 0 )
            mult1 = 0;
        else
            mult1 = 1;
        end
        
        v_i1 = v_i - u_1 * g * delta_t;
        x_1 = v_i1*delta_t + x;
        % -------------------------------
        
        % Second Block ------------------
        
        l_2 = 1 - ( (r*w_i1) / v_i1 );
        if ( l_2 > 1 ) 
            l_2 = 1;
        elseif ( l_2 < 0 )
            l_2 = 0;
        end
        
        u_2 = 2*u_o*( (l_o * l_2) / ( (l_o^2) + (l_2^2) ) );
        w_i2 = mult2*(delta_t/J)*( u_2 * M * g * r - B * w_i1 - tau ) + w_i1;
        if( w_i2 <= 0 )
            mult2 = 0;
        else
            mult2 = 1;
        end
        v_i2 = v_i1 - u_2 * g * delta_t;
        x_2 = v_i2*delta_t + x_1;
        %----------------------------------
        % Mid points -----------------------
        u = (u_1 + u_2) / 2;
        l = (l_1 + l_2) / 2;
        v = (v_i1 + v_i2) / 2;
        w = (w_i2 + w_i1) / 2;
        x = (x_2 + x_1) / 2 ;
        
        fprintf('%5.2f \t %10.4f \t %10.4f \t %10.4f \t %10.4f \t %10.4f\n', t, v, w, u, l, x)
    
        w_array = cat(1, w_array, w);
        v_array = cat(1, v_array, v);
        t_array = cat(1, t_array, t);
        l_array = cat(1, l_array, l);
        u_array = cat(1, u_array, u);
        x_array = cat(1, x_array, x);
        
        t = t + delta_t;
        v_i = v;
        w_i = w;
end;
%plot(  t_array, u_array )
%plot(  t_array, l_array )
%plot(  t_array, v_array )
%plot(  t_array, w_array )
%plot(  t_array, x_array )
%plot(  w_array, v_array )
plot3( t_array, v_array, w_array )