function u = rolling_friction( slip, slip_o, u_o )
if ~isvector(slip)
    error('Input must be a vector' )
end
if ~isscalar( slip_o )
    error('slip_o must be a scalar')
end
if ~isscalar( u_o )
    error('u_o must be a scalar')
end

u = 2*u_o .* ((slip_o .* slip) ./ (slip_o^2 + slip.^2));

end