%%  calculate_P2_u2_mode2_t_w.m
% @ ��������*����˻�
%P2_B111_t ������ S1(t)@(S1(t)*S1(t+T))

    P2_u2_mode2_t=zeros(Nt,Nt1);
    P2_u2_mode2_t=u2(2)*A(3)*A(2)*u1(2)^2*S2t_M.*(S2T_M+S2tT_M);
    P2_u2_mode2_w=fft2(P2_u2_mode2_t)*(dt*dt1);

%% ����ʱ���Ƶ��Ķ�ά��ͼ
%     Px_t=P2_u2_mode2_t;
%     Px_w=P2_u2_mode2_w;
%     plot_2Dfigure_t_w; %���û�ͼ����