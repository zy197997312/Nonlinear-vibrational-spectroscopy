%%  P2_B111_t
% @ 代表卷积，*代表乘积
%P2_B111_t 正比于 S1(t)@(S1(t)*S1(t+T))

P2_B111_t=zeros(Nt,Nt1);

%     S1t_w=fft(S1t_M,[],1);%对每一列分别作傅里叶变换
%     S1t_S1tT_w=fft(S1t_S1tT,[],1);
    S1t_c_S1t_S1tT_w=S1t_w.*S1t_S1tT_w;%频域相乘
    
    P2_B111_t=-6*B3(1)*A(3)*A(2)*u1(1)^3*ifft(S1t_c_S1t_S1tT_w,[],1);
    P2_B111_w=fft2(P2_B111_t)*(dt*dt1);

%% 画出时域和频域的二维谱图
%     Px_t=P2_B111_t;
%     Px_w=P2_B111_w;
%     plot_2Dfigure_t_w; %调用画图程序