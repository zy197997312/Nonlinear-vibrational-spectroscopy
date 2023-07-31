%%  P3_directU_u3_mode1_t
% @ 代表卷积，*代表乘积
%P3_directU_u3_mode1_t 正比于S1(t)*S1(T)*S1(T+tao)+S1(t)*S1(t+T)*S1(t+T+tao)  

P3_directU_u3_mode1_t=zeros(Nt,Nt1);

    
    P3_directU_u3_mode1_t=u3(1)*u1(1)^3*A(3)*A(2)*A(1)*(S1t_S1T_S1Ttao+S1t_S1tT_S1tTtao);
    P3_directU_u3_mode1_w=fft2(P3_directU_u3_mode1_t)*(dt*dt1);
