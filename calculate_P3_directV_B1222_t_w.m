%%  P3_directV_B1222_t
% @ 代表卷积，*代表乘积
%P3_directV_B1222_t 正比于 {S1(t)@[S1(t)*S2(t+T)*S2(t+T+tao)+S2(t)*S1(t+T)*S2(t+T+tao)+S2(t)*S2(t+T)*S1(t+T+tao)]+S1(t)@[S2(t)*S2(t+T)*S2(t+T+tao)]}   

P3_directV_B1222_t=zeros(Nt,Nt1);
    
    P3_directV_B1222_t=-24*B4(5)*u1(1)*u1(2)^3*A(3)*A(2)*A(1)*ifft(S2t_w.*(S1t_S2tT_S2tTtao_w+S2t_S1tT_S2tTtao_w+S2t_S2tT_S1tTtao_w)+S1t_w.*S2t_S2tT_S2tTtao_w,[],1);
    P3_directV_B1222_w=fft2(P3_directV_B1222_t)*(dt*dt1);
