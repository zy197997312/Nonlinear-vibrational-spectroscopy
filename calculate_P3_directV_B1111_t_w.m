%%  P3_directV_B1111_t
% @ ��������*����˻�
%P3_directV_B1111_t ������ S1(t)@[S1(t)*S1(t+T)*S1(t+T+tao)]   

P3_directV_B1111_t=zeros(Nt,Nt1);
% 
%     S1t_w=fft(S1t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
%     S1t_S1tT_S1tTtao_w=fft(S1t_S1tT_S1tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任  
    S1t_c_S1t_S1tT_S1tTtao_w=S1t_w.*S1t_S1tT_S1tTtao_w;%Ƶ�����
    
    P3_directV_B1111_t=-24*B4(1)*A(3)*A(2)*A(1)*u1(1)^4*ifft(S1t_c_S1t_S1tT_S1tTtao_w,[],1);
    P3_directV_B1111_w=fft2(P3_directV_B1111_t)*(dt*dt1);
