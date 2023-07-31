%%  P3_directV_B2222_t
% @ 代表卷积，*代表乘积
%P3_directV_B2222_t 正比于 S2(t)@[S2(t)*S2(t+T)*S2(t+T+tao)]   

P3_directV_B2222_t=zeros(Nt,Nt1);

%     S2t_w=fft(S2t_M,[],1);%对每一列分别作傅里叶变换
%     S2t_S2tT_S2tTtao_w=fft(S2t_S2tT_S2tTtao,[],1);   
    S2t_c_S2t_S2tT_S2tTtao_w=S2t_w.*S2t_S2tT_S2tTtao_w;%频域相乘
    
    P3_directV_B2222_t=-24*B4(2)*u1(2)^4*A(3)*A(2)*A(1)*ifft(S2t_c_S2t_S2tT_S2tTtao_w,[],1);
    P3_directV_B2222_w=fft2(P3_directV_B2222_t)*(dt*dt1);
