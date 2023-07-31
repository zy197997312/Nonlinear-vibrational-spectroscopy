%%  P3_directU_u3_mode2_t
% @ 代表卷积，*代表乘积
%P3_directU_u3_mode2_t 正比于S2(t)*S2(T)*S2(T+tao)+S2(t)*S2(t+T)*S2(t+T+tao)  

P3_directU_u3_mode2_t=zeros(Nt,Nt1);

    
    P3_directU_u3_mode2_t=u3(2)*u1(2)^3*A(3)*A(2)*A(1)*(S2t_S2T_S2Ttao+S2t_S2tT_S2tTtao);
    P3_directU_u3_mode2_w=fft2(P3_directU_u3_mode2_t)*(dt*dt1);
