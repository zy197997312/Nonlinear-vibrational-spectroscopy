%%  P2_B112_t
% @ 代表卷积，*代表乘积
%P2_B112_t 正比于 S1(t)@[S1(t)*S2(t+T)+S2(t)*S1(t+T)]+S2(t)@[S1(t)*S1(t+T)]   

P2_B112_t=zeros(Nt,Nt1);

%     S1t_w=fft(S1t_M,[],1);%对每一列分别作傅里叶变换
%     S2t_w=fft(S2t_M,[],1);%对每一列分别作傅里叶变换
%     S1t_S1tT_w=fft(S1t_S1tT,[],1);
%     S1t_S2tT_w=fft(S1t_S2tT,[],1);
%     S2t_S1tT_w=fft(S2t_S1tT,[],1);
    
    
    P2_B112_t=-6*B3(3)*A(3)*A(2)*u1(1)^2*u1(2)*ifft((S1t_w.*S1t_S2tT_w+S1t_w.*S2t_S1tT_w+S2t_w.*S1t_S1tT_w),[],1);
    P2_B112_w=fft2(P2_B112_t)*(dt*dt1);
%     Zeros_matrix(NT+1:2*NT,Nt+1:2*Nt)=P2_B112_t;
%     P2_B112_W=fft2(Zeros_matrix);

%% 画出时域和频域的二维谱图
%     Px_t=P2_B112_t;
%     Px_w=P2_B112_w;
%     plot_2Dfigure_t_w; %调用画图程序