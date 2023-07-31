%%  calculate_P2_u2_mode1_t_w.m
% @ 代表卷积，*代表乘积
%P2_B111_t 正比于 S1(t)@(S1(t)*S1(t+T))

    P2_u2_mode1_t=zeros(Nt,Nt1);
    P2_u2_mode1_t=u2(1)*A(3)*A(2)*u1(1)^2*S1t_M.*(S1T_M+S1tT_M);
    P2_u2_mode1_w=fft2(P2_u2_mode1_t)*(dt*dt1);

%% 画出时域和频域的二维谱图
%     Px_t=P2_u2_mode1_t;
%     Px_w=P2_u2_mode1_w;
%     plot_2Dfigure_t_w; %调用画图程序