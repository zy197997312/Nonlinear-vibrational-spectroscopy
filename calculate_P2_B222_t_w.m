%%  P2_B111_t
% @ 代表卷积，*代表乘积
%P2_B222_t 正比于 S2(t)@(S2(t)*S2(t+T))    
P2_B222_t=zeros(Nt,Nt1);
    
%     S2t_w=fft(S2t_M,[],1);%对每一列分别作傅里叶变换
%     S2t_S2tT_w=fft(S2t_S2tT,[],1);
    S2t_c_S2t_S2tT_w=S2t_w.*S2t_S2tT_w;%频域相乘
    
    P2_B222_t=-6*B3(2)*A(3)*A(2)*u1(2)^3*ifft(S2t_c_S2t_S2tT_w,[],1);
    P2_B222_w=fft2(P2_B222_t)*(dt*dt1);

%% 画出时域和频域的二维谱图
%     Px_t=P2_B222_t;
%     Px_w=P2_B222_w;
%     plot_2Dfigure_t_w; %调用画图程序
