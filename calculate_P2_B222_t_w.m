%%  P2_B111_t
% @ ��������*����˻�
%P2_B222_t ������ S2(t)@(S2(t)*S2(t+T))    
P2_B222_t=zeros(Nt,Nt1);
    
%     S2t_w=fft(S2t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
%     S2t_S2tT_w=fft(S2t_S2tT,[],1);
    S2t_c_S2t_S2tT_w=S2t_w.*S2t_S2tT_w;%Ƶ�����
    
    P2_B222_t=-6*B3(2)*A(3)*A(2)*u1(2)^3*ifft(S2t_c_S2t_S2tT_w,[],1);
    P2_B222_w=fft2(P2_B222_t)*(dt*dt1);

%% ����ʱ���Ƶ��Ķ�ά��ͼ
%     Px_t=P2_B222_t;
%     Px_w=P2_B222_w;
%     plot_2Dfigure_t_w; %���û�ͼ����
