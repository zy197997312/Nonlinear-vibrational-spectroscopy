%2. 振动模式参数
%参考文献J.Chem.Phys 106,2569(1997),将高斯部分平分给两个模式

    %1.1根据参考文献J.Chem.Phys 106,2569(1997)给定的参数
    A_ga=6.07;
    w_ga=35.9*2*pi*0.03; %THz=0.1884*cm-1
    A_d=[11.6,8.53];
    tao_d=[0.4,1.65];%ps
    w_d=[1/0.05,1/0.07];%THz
    
    %1.2构建矩阵S1(t)和S2(t)
    R1_gat=A_ga*t.*exp(-0.5*w_ga^2*t.^2);
    R1_d1t=0.5*R1_gat+A_d(1)/(2*w_d(1))*(exp(-t./tao_d(1))-exp(-(1/tao_d(1)+w_d(1)).*t));%相当于S1t行向量
    R1_d2t=0.5*R1_gat+A_d(2)/(2*w_d(2))*(exp(-t./tao_d(2))-exp(-(1/tao_d(2)+w_d(2)).*t));%相当于S2t行向量
    figure();
    plot(t,R1_d1t+R1_d2t);
    
    S1t=conj((R1_d1t)');
    S1t_M=zeros(Nt,NT);
    S1t_M=repmat(S1t,1,NT);% 构建好的矩阵S1(t)
    
    S2t=conj((R1_d2t)');
    S2t_M=zeros(Nt,NT);
    S2t_M=repmat(S2t,1,NT);% 构建好的矩阵S2(t)
    
    %1.3构建矩阵S1(T)和S2(T)
    R1_gaT=A_ga*T.*exp(-0.5*w_ga^2*T.^2);
    R1_d1T=0.5*R1_gaT+A_d(1)/(2*w_d(1))*(exp(-T./tao_d(1))-exp(-(1/tao_d(1)+w_d(1)).*T));%相当于S1T行向量
    R1_d2T=0.5*R1_gaT+A_d(2)/(2*w_d(2))*(exp(-T./tao_d(2))-exp(-(1/tao_d(2)+w_d(2)).*T));%相当于S2T行向量
    
    S1T=conj((R1_d1T)');
    S1T_M=zeros(Nt,NT);
    S1T_M=repmat(S1T,1,NT);% 构建好的矩阵S1(T)
    
    S2T=conj((R1_d2T)');
    S2T_M=zeros(Nt,NT);
    S2T_M=repmat(S2T,1,NT);% 构建好的矩阵S2(T)
    
    %1.3构建矩阵S1(t+T)和S2(t+T)
    S1tT_M=zeros(Nt,NT);
    for j1=1:NT
        R1_gatT=A_ga*(t+T(j1)).*exp(-0.5*w_ga^2*(t+T(j1)).^2);       
        S1tT_M(:,j1)=conj((0.5*R1_gatT+A_d(1)/(2*w_d(1))*(exp(-(t+T(j1))./tao_d(1))-exp(-(1/tao_d(1)+w_d(1)).*(t+T(j1)))))'); 
    end
    % 构建好的矩阵S1(t+T)
    
    S2tT_M=zeros(Nt,NT);
    for j1=1:NT
        R1_gatT=A_ga*(t+T(j1)).*exp(-0.5*w_ga^2*(t+T(j1)).^2);       
        S2tT_M(:,j1)=conj((0.5*R1_gatT+A_d(2)/(2*w_d(2))*(exp(-(t+T(j1))./tao_d(2))-exp(-(1/tao_d(2)+w_d(2)).*(t+T(j1)))))'); 
    end
    % 构建好的矩阵S2(t+T)
    
    
%     S1t_m_S1tT=S1t_M.*S1tT_M;%S1(t)*S1(t+T)乘以
%     S1t_m_S2tT=S1t_M.*S2tT_M;%S1(t)*S2(t+T)乘以
%     S2t_m_S1tT=S2t_M.*S1tT_M;%S2(t)*S1(t+T)乘以
%     S2t_m_S2tT=S2t_M.*S2tT_M;%S2(t)*S2(t+T)乘以

    S1t_S1tT=S1t_M.*S1tT_M;%S1(t)*S1(t+T)乘以
    S1t_S2tT=S1t_M.*S2tT_M;%S1(t)*S2(t+T)乘以
    S2t_S1tT=S2t_M.*S1tT_M;%S2(t)*S1(t+T)乘以
    S2t_S2tT=S2t_M.*S2tT_M;%S2(t)*S2(t+T)乘以
%% 求出用于卷积的频域矩阵 
    S1t_w=fft(S1t_M,[],1);%对每一列分别作傅里叶变换
    S2t_w=fft(S2t_M,[],1);%对每一列分别作傅里叶变换
    
    S1t_S1tT_w=fft(S1t_S1tT,[],1);%对每一列分别作傅里叶变换
    S1t_S2tT_w=fft(S1t_S2tT,[],1);%对每一列分别作傅里叶变换
    S2t_S1tT_w=fft(S2t_S1tT,[],1);%对每一列分别作傅里叶变换
    S2t_S2tT_w=fft(S2t_S2tT,[],1);%对每一列分别作傅里叶变换
    
    