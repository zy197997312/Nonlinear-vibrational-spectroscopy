%%  P2_B111_t
% @ ��������*����˻�
%P2_B111_t ������ S1(t)@(S1(t)*S1(t+T))

P2_B111_t=zeros(Nt,Nt1);

%     S1t_w=fft(S1t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
%     S1t_S1tT_w=fft(S1t_S1tT,[],1);
    S1t_c_S1t_S1tT_w=S1t_w.*S1t_S1tT_w;%Ƶ�����
    
    P2_B111_t=-6*B3(1)*A(3)*A(2)*u1(1)^3*ifft(S1t_c_S1t_S1tT_w,[],1);
    P2_B111_w=fft2(P2_B111_t)*(dt*dt1);

%% ����ʱ���Ƶ��Ķ�ά��ͼ
%     Px_t=P2_B111_t;
%     Px_w=P2_B111_w;
%     plot_2Dfigure_t_w; %���û�ͼ����