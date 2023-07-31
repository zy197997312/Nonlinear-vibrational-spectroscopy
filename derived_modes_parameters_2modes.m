%2. 振动模式参数
    %模式1
    if w(1)>=r(1)
        epusilon(1)=sqrt(w(1)^2-r(1)^2);
        S1_t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sin(epusilon(1)*t);
        S1_t=conj(S1_t');%转置
        S1_t_M=zeros(Nt,NT);
        S1_t_M=repmat(S1_t,1,NT);% 构建好的矩阵S1(t)
        
        S1_T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sin(epusilon(1)*T);
        S1_T_M=zeros(Nt,NT);
        S1_T_M=repmat(S1_T,Nt,1);% 构建好的矩阵S1(T)
        
        
        S1_Tt_M=zeros(Nt,NT);
        for j1=1:NT
           S1_Tt_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sin(epusilon(1)*(t+T(j1))))'); 
        end
        % 构建好的矩阵S1(t+T)
    else
        epusilon(1)=sqrt(-w(1)^2+r(1)^2);
%         S1_t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sinh(epusilon(1)*t);
        S1_t=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*t)-exp((-epusilon(1)-r(1)).*t));
        S1_t=conj(S1_t');%转置
        S1_t_M=zeros(Nt,NT);
        S1_t_M=repmat(S1_t,1,NT);% 构建好的矩阵S1(t)
        
%         S1_T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sinh(epusilon(1)*T);
        S1_T=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*T)-exp((-epusilon(1)-r(1)).*T));
        S1_T_M=zeros(Nt,NT);
        S1_T_M=repmat(S1_T,Nt,1);% 构建好的矩阵S1(T)
        
        S1_Tt_M=zeros(Nt,NT);
        for j1=1:NT
%            S1_Tt_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sinh(epusilon(1)*(t+T(j1))))');
           S1_Tt_M(:,j1)=conj((0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(t+T(j1)))-exp((-epusilon(1)-r(1)).*(t+T(j1)))))');
        end
        %构建好的矩阵S1(t+T)
        
    end
    
    %模式2
    if w(2)>=r(2)
        epusilon(2)=sqrt(w(2)^2-r(2)^2);
        S2_t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sin(epusilon(2)*t);
        S2_t=conj(S2_t');%转置
        S2_t_M=zeros(Nt,NT);
        S2_t_M=repmat(S2_t,1,NT);% 构建好的矩阵S2(t)
        
        S2_T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sin(epusilon(2)*T);
        S2_T_M=zeros(Nt,NT);
        S2_T_M=repmat(S2_T,Nt,1);% 构建好的矩阵S2(T)
        
        S2_Tt_M=zeros(Nt,NT);
        for j1=1:NT
           S2_Tt_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sin(epusilon(2)*(t+T(j1))))'); 
        end
        % 构建好的矩阵S2(t+T)
    else
        epusilon(2)=sqrt(-w(2)^2+r(2)^2);
%         S2_t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sinh(epusilon(2)*t);
        S2_t=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*t)-exp((-epusilon(2)-r(2)).*t));
        S2_t=conj(S2_t');%转置
        S2_t_M=zeros(Nt,NT);
        S2_t_M=repmat(S2_t,1,NT);% 构建好的矩阵S2(t)
        
%         S2_T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sinh(epusilon(2)*T);
        S2_T=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*T)-exp((-epusilon(2)-r(2)).*T));
        S2_T_M=zeros(Nt,NT);
        S2_T_M=repmat(S2_T,Nt,1);% 构建好的矩阵S2(T)
        
        S2_Tt_M=zeros(Nt,NT);
        for j1=1:NT
%            S2_Tt_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sinh(epusilon(2)*(t+T(j1))))');
           S2_Tt_M(:,j1)=conj((0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(t+T(j1)))-exp((-epusilon(2)-r(2)).*(t+T(j1)))))');
        end
        %构建好的矩阵S2(t+T)
        
    end
    
    S1_t_m_S1_Tt=S1_t_M.*S1_Tt_M;%S1(t)*S1(t+T)乘以
    S1_t_m_S2_Tt=S1_t_M.*S2_Tt_M;%S1(t)*S2(t+T)乘以
    S2_t_m_S1_Tt=S2_t_M.*S1_Tt_M;%S2(t)*S1(t+T)乘以
    S2_t_m_S2_Tt=S2_t_M.*S2_Tt_M;%S2(t)*S2(t+T)乘以
    
    