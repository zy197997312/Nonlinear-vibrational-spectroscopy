%2. 振动模式参数
    %模式1
    if w(1)>=r(1)
        epusilon(1)=sqrt(w(1)^2-r(1)^2);
        S1t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sin(epusilon(1)*t);
        S1t=conj(S1t');%转置
        S1t_M=zeros(Nt,NT);
        S1t_M=repmat(S1t,1,NT);% 构建好的矩阵S1(t)
        
        S1T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sin(epusilon(1)*T);
        S1T_M=zeros(Nt,NT);
        S1T_M=repmat(S1T,Nt,1);% 构建好的矩阵S1(T)
        
        
        S1tT_M=zeros(Nt,NT);
        for j1=1:NT
           S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sin(epusilon(1)*(t+T(j1))))'); 
        end
        % 构建好的矩阵S1(t+T)
    else
        epusilon(1)=sqrt(-w(1)^2+r(1)^2);
%         S1t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sinh(epusilon(1)*t);
        S1t=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*t)-exp((-epusilon(1)-r(1)).*t));
        S1t=conj(S1t');%转置
        S1t_M=zeros(Nt,NT);
        S1t_M=repmat(S1t,1,NT);% 构建好的矩阵S1(t)
        
%         S1T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sinh(epusilon(1)*T);
        S1T=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*T)-exp((-epusilon(1)-r(1)).*T));
        S1T_M=zeros(Nt,NT);
        S1T_M=repmat(S1T,Nt,1);% 构建好的矩阵S1(T)
        
        S1tT_M=zeros(Nt,NT);
        for j1=1:NT
%            S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sinh(epusilon(1)*(t+T(j1))))');
           S1tT_M(:,j1)=conj((0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(t+T(j1)))-exp((-epusilon(1)-r(1)).*(t+T(j1)))))');
        end
        %构建好的矩阵S1(t+T)
        
    end
    
    %模式2
    if w(2)>=r(2)
        epusilon(2)=sqrt(w(2)^2-r(2)^2);
        S2t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sin(epusilon(2)*t);
        S2t=conj(S2t');%转置
        S2t_M=zeros(Nt,NT);
        S2t_M=repmat(S2t,1,NT);% 构建好的矩阵S2(t)
        
        S2T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sin(epusilon(2)*T);
        S2T_M=zeros(Nt,NT);
        S2T_M=repmat(S2T,Nt,1);% 构建好的矩阵S2(T)
        
        S2tT_M=zeros(Nt,NT);
        for j1=1:NT
           S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sin(epusilon(2)*(t+T(j1))))'); 
        end
        % 构建好的矩阵S2(t+T)
    else
        epusilon(2)=sqrt(-w(2)^2+r(2)^2);
%         S2t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sinh(epusilon(2)*t);
        S2t=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*t)-exp((-epusilon(2)-r(2)).*t));
        S2t=conj(S2t');%转置
        S2t_M=zeros(Nt,NT);
        S2t_M=repmat(S2t,1,NT);% 构建好的矩阵S2(t)
        
%         S2T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sinh(epusilon(2)*T);
        S2T=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*T)-exp((-epusilon(2)-r(2)).*T));
        S2T_M=zeros(Nt,NT);
        S2T_M=repmat(S2T,Nt,1);% 构建好的矩阵S2(T)
        
        S2tT_M=zeros(Nt,NT);
        for j1=1:NT
%            S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sinh(epusilon(2)*(t+T(j1))))');
           S2tT_M(:,j1)=conj((0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(t+T(j1)))-exp((-epusilon(2)-r(2)).*(t+T(j1)))))');
        end
        %构建好的矩阵S2(t+T)
        
    end
    
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
    
    