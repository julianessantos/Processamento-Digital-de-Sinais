function [X, W] = dtft_A(x,n)
    M = 220;
    k = -M:M;
    X = x * exp(-1j * (pi/M) * n' * k);
    W = k*(pi/M);
end
