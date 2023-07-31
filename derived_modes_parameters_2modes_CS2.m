%2. ��ģʽ����
%�ο�����J.Chem.Phys 106,2569(1997),����˹����ƽ�ָ�����ģʽ

    %1.1���ݲο�����J.Chem.Phys 106,2569(1997)�����Ĳ���
    A_ga=6.07;
    w_ga=35.9*2*pi*0.03; %THz=0.1884*cm-1
    A_d=[11.6,8.53];
    tao_d=[0.4,1.65];%ps
    w_d=[1/0.05,1/0.07];%THz
    
    %1.2��������S1(t)��S2(t)
    R1_gat=A_ga*t.*exp(-0.5*w_ga^2*t.^2);
    R1_d1t=0.5*R1_gat+A_d(1)/(2*w_d(1))*(exp(-t./tao_d(1))-exp(-(1/tao_d(1)+w_d(1)).*t));%�൱��S1t������
    R1_d2t=0.5*R1_gat+A_d(2)/(2*w_d(2))*(exp(-t./tao_d(2))-exp(-(1/tao_d(2)+w_d(2)).*t));%�൱��S2t������
    figure();
    plot(t,R1_d1t+R1_d2t);
    
    S1t=conj((R1_d1t)');
    S1t_M=zeros(Nt,NT);
    S1t_M=repmat(S1t,1,NT);% �����õľ���S1(t)
    
    S2t=conj((R1_d2t)');
    S2t_M=zeros(Nt,NT);
    S2t_M=repmat(S2t,1,NT);% �����õľ���S2(t)
    
    %1.3��������S1(T)��S2(T)
    R1_gaT=A_ga*T.*exp(-0.5*w_ga^2*T.^2);
    R1_d1T=0.5*R1_gaT+A_d(1)/(2*w_d(1))*(exp(-T./tao_d(1))-exp(-(1/tao_d(1)+w_d(1)).*T));%�൱��S1T������
    R1_d2T=0.5*R1_gaT+A_d(2)/(2*w_d(2))*(exp(-T./tao_d(2))-exp(-(1/tao_d(2)+w_d(2)).*T));%�൱��S2T������
    
    S1T=conj((R1_d1T)');
    S1T_M=zeros(Nt,NT);
    S1T_M=repmat(S1T,1,NT);% �����õľ���S1(T)
    
    S2T=conj((R1_d2T)');
    S2T_M=zeros(Nt,NT);
    S2T_M=repmat(S2T,1,NT);% �����õľ���S2(T)
    
    %1.3��������S1(t+T)��S2(t+T)
    S1tT_M=zeros(Nt,NT);
    for j1=1:NT
        R1_gatT=A_ga*(t+T(j1)).*exp(-0.5*w_ga^2*(t+T(j1)).^2);       
        S1tT_M(:,j1)=conj((0.5*R1_gatT+A_d(1)/(2*w_d(1))*(exp(-(t+T(j1))./tao_d(1))-exp(-(1/tao_d(1)+w_d(1)).*(t+T(j1)))))'); 
    end
    % �����õľ���S1(t+T)
    
    S2tT_M=zeros(Nt,NT);
    for j1=1:NT
        R1_gatT=A_ga*(t+T(j1)).*exp(-0.5*w_ga^2*(t+T(j1)).^2);       
        S2tT_M(:,j1)=conj((0.5*R1_gatT+A_d(2)/(2*w_d(2))*(exp(-(t+T(j1))./tao_d(2))-exp(-(1/tao_d(2)+w_d(2)).*(t+T(j1)))))'); 
    end
    % �����õľ���S2(t+T)
    
    
%     S1t_m_S1tT=S1t_M.*S1tT_M;%S1(t)*S1(t+T)����
%     S1t_m_S2tT=S1t_M.*S2tT_M;%S1(t)*S2(t+T)����
%     S2t_m_S1tT=S2t_M.*S1tT_M;%S2(t)*S1(t+T)����
%     S2t_m_S2tT=S2t_M.*S2tT_M;%S2(t)*S2(t+T)����

    S1t_S1tT=S1t_M.*S1tT_M;%S1(t)*S1(t+T)����
    S1t_S2tT=S1t_M.*S2tT_M;%S1(t)*S2(t+T)����
    S2t_S1tT=S2t_M.*S1tT_M;%S2(t)*S1(t+T)����
    S2t_S2tT=S2t_M.*S2tT_M;%S2(t)*S2(t+T)����
%% ������ھ����Ƶ����� 
    S1t_w=fft(S1t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
    S2t_w=fft(S2t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
    
    S1t_S1tT_w=fft(S1t_S1tT,[],1);%��ÿһ�зֱ�������Ҷ�任
    S1t_S2tT_w=fft(S1t_S2tT,[],1);%��ÿһ�зֱ�������Ҷ�任
    S2t_S1tT_w=fft(S2t_S1tT,[],1);%��ÿһ�зֱ�������Ҷ�任
    S2t_S2tT_w=fft(S2t_S2tT,[],1);%��ÿһ�зֱ�������Ҷ�任
    
    