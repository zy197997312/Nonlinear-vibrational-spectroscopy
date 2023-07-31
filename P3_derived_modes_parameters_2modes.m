%%
% time_axis=1;%����
%2. ��ģʽ����
if time_axis==1 %ʱ�����Ϊt��T
    %��ʱ Nt1=NT; t1=T; t1_matrix=T_matrix; dwt1=dwT;
%     tao=tao.*ones(1,Nt1);
    T=T.*ones(1,Nt1);
    if w(1)>=r(1) %ģʽ1
        epusilon(1)=sqrt(w(1)^2-r(1)^2);
        % �����õľ���S1(t)
        S1t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sin(epusilon(1)*t);
        S1t=conj(S1t');%ת��
        S1t_M=zeros(Nt,Nt1);
        S1t_M=repmat(S1t,1,Nt1);
        
        % �����õľ���S1(T)
        S1T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sin(epusilon(1)*T);
        S1T_M=zeros(Nt,Nt1);
        S1T_M=repmat(S1T,Nt,1);
        
        % �����õľ���S1(t+T)
        S1tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sin(epusilon(1)*(t+T(j1))))'); 
        end
        % �����õľ���S1(T+tao)
        S1Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S1Ttao_M(j1,:)=1./(m(1)*epusilon(1)).*exp(-r(1).*(T+tao.*ones(1,Nt1))).*sin(epusilon(1)*(T+tao.*ones(1,Nt1))); 
        end
        
        % �����õľ���S1(t+T+tao)
        S1tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S1tTtao_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1)+tao)).*sin(epusilon(1)*(t+T(j1)+tao)))'); 
        end
    else
        epusilon(1)=sqrt(-w(1)^2+r(1)^2);
        % �����õľ���S1(t)
%         S1t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sinh(epusilon(1)*t);
        S1t=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*t)-exp((-epusilon(1)-r(1)).*t));
        S1t=conj(S1t');%ת��
        S1t_M=zeros(Nt,Nt1);
        S1t_M=repmat(S1t,1,Nt1);
        
        % �����õľ���S1(T)
%         S1T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sinh(epusilon(1)*T);
        S1T=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*T)-exp((-epusilon(1)-r(1)).*T));
        S1T_M=zeros(Nt,Nt1);
        S1T_M=repmat(S1T,Nt,1);
        
        %�����õľ���S1(t+T)
        S1tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sinh(epusilon(1)*(t+T(j1))))');
           S1tT_M(:,j1)=conj((0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(t+T(j1)))-exp((-epusilon(1)-r(1)).*(t+T(j1)))))');
        end
        
        %�����õľ���S1(T+tao)
        S1Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S1Ttao_M(j1,:)=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(T+tao.*ones(1,Nt1)))-exp((-epusilon(1)-r(1)).*(T+tao.*ones(1,Nt1))));
        end
        
        %�����õľ���S1(t+T+tao)
        S1tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sinh(epusilon(1)*(t+T(j1))))');
           S1tTtao_M(:,j1)=conj((0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(t+T(j1)+tao))-exp((-epusilon(1)-r(1)).*(t+T(j1)+tao))))');
        end
    end

    if w(2)>=r(2) %ģʽ2
        epusilon(2)=sqrt(w(2)^2-r(2)^2);
        % �����õľ���S2(t)
        S2t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sin(epusilon(2)*t);
        S2t=conj(S2t');%ת��
        S2t_M=zeros(Nt,Nt1);
        S2t_M=repmat(S2t,1,Nt1);
        
        % �����õľ���S2(T)
        S2T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sin(epusilon(2)*T);
        S2T_M=zeros(Nt,Nt1);
        S2T_M=repmat(S2T,Nt,1);
        
        % �����õľ���S2(t+T)
        S2tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sin(epusilon(2)*(t+T(j1))))'); 
        end
        
        % �����õľ���S2(T+tao)
        S2Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S2Ttao_M(j1,:)=1./(m(2)*epusilon(2)).*exp(-r(2).*(T+tao.*ones(1,Nt1))).*sin(epusilon(2)*(T+tao.*ones(1,Nt1))); 
        end
        
        % �����õľ���S2(t+T+tao)
        S2tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S2tTtao_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1)+tao)).*sin(epusilon(2)*(t+T(j1)+tao)))'); 
        end
    else
        epusilon(2)=sqrt(-w(2)^2+r(2)^2);
        % �����õľ���S2(t)
%         S2t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sinh(epusilon(2)*t);
        S2t=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*t)-exp((-epusilon(2)-r(2)).*t));
        S2t=conj(S2t');%ת��
        S2t_M=zeros(Nt,Nt1);
        S2t_M=repmat(S2t,1,Nt1);
        
        % �����õľ���S2(T)
%         S2T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sinh(epusilon(2)*T);
        S2T=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*T)-exp((-epusilon(2)-r(2)).*T));
        S2T_M=zeros(Nt,Nt1);
        S2T_M=repmat(S2T,Nt,1);
        
        %�����õľ���S2(t+T)
        S2tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sinh(epusilon(2)*(t+T(j1))))');
           S2tT_M(:,j1)=conj((0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(t+T(j1)))-exp((-epusilon(2)-r(2)).*(t+T(j1)))))');
        end
        
        %�����õľ���S2(T+tao)
        S2Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S2Ttao_M(j1,:)=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(T+tao.*ones(1,Nt1)))-exp((-epusilon(2)-r(2)).*(T+tao.*ones(1,Nt1))));
        end
        
        %�����õľ���S2(t+T+tao)
        S2tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sinh(epusilon(2)*(t+T(j1))))');
           S2tTtao_M(:,j1)=conj((0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(t+T(j1)+tao))-exp((-epusilon(2)-r(2)).*(t+T(j1)+tao))))');
        end
    end
    
else %ʱ�����Ϊt��tao
    %��ʱ Nt1=Ntao; t1=tao; t1_matrix=tao_matrix; dwt1=dwtao;
    tao=tao.*ones(1,Nt1);
    T=T.*ones(1,Nt1);
    if w(1)>=r(1) %ģʽ1
        epusilon(1)=sqrt(w(1)^2-r(1)^2);
        % �����õľ���S1(t)
        S1t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sin(epusilon(1)*t);
        S1t=conj(S1t');%ת��
        S1t_M=zeros(Nt,Nt1);
        S1t_M=repmat(S1t,1,Nt1);
        
        % �����õľ���S1(T)
        S1T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sin(epusilon(1)*T);
        S1T_M=zeros(Nt,Nt1);
        S1T_M=repmat(S1T,Nt,1);
        
        % �����õľ���S1(t+T)
        S1tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sin(epusilon(1)*(t+T(j1))))'); 
        end
        
        % �����õľ���S1(T+tao)
        S1Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S1Ttao_M(j1,:)=1./(m(1)*epusilon(1)).*exp(-r(1).*(T+tao)).*sin(epusilon(1)*(T+tao)); 
        end
        
        % �����õľ���S1(t+T+tao)
        S1tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S1tTtao_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1)+tao(j1))).*sin(epusilon(1)*(t+T(j1)+tao(j1))))'); 
        end
    else
        epusilon(1)=sqrt(-w(1)^2+r(1)^2);
        % �����õľ���S1(t)
%         S1t=1./(m(1)*epusilon(1)).*exp(-r(1).*t).*sinh(epusilon(1)*t);
        S1t=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*t)-exp((-epusilon(1)-r(1)).*t));
        S1t=conj(S1t');%ת��
        S1t_M=zeros(Nt,Nt1);
        S1t_M=repmat(S1t,1,Nt1);
        
        % �����õľ���S1(T)
%         S1T=1./(m(1)*epusilon(1)).*exp(-r(1).*T).*sinh(epusilon(1)*T);
        S1T=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*T)-exp((-epusilon(1)-r(1)).*T));
        S1T_M=zeros(Nt,Nt1);
        S1T_M=repmat(S1T,Nt,1);
        
        %�����õľ���S1(t+T)
        S1tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sinh(epusilon(1)*(t+T(j1))))');
           S1tT_M(:,j1)=conj((0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(t+T(j1)))-exp((-epusilon(1)-r(1)).*(t+T(j1)))))');
        end
        
        %�����õľ���S1(T+tao)
        S1Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S1Ttao_M(j1,:)=0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(T+tao))-exp((-epusilon(1)-r(1)).*(T+tao)));
        end
        
        %�����õľ���S1(t+T+tao)
        S1tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S1tT_M(:,j1)=conj((1./(m(1)*epusilon(1)).*exp(-r(1).*(t+T(j1))).*sinh(epusilon(1)*(t+T(j1))))');
           S1tTtao_M(:,j1)=conj((0.5./(m(1)*epusilon(1)).*(exp((epusilon(1)-r(1)).*(t+T(j1)+tao(j1)))-exp((-epusilon(1)-r(1)).*(t+T(j1)+tao(j1)))))');
        end
    end

    if w(2)>=r(2) %ģʽ2
        epusilon(2)=sqrt(w(2)^2-r(2)^2);
        % �����õľ���S2(t)
        S2t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sin(epusilon(2)*t);
        S2t=conj(S2t');%ת��
        S2t_M=zeros(Nt,Nt1);
        S2t_M=repmat(S2t,1,Nt1);
        
        % �����õľ���S2(T)
        S2T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sin(epusilon(2)*T);
        S2T_M=zeros(Nt,Nt1);
        S2T_M=repmat(S2T,Nt,1);
        
        % �����õľ���S2(t+T)
        S2tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sin(epusilon(2)*(t+T(j1))))'); 
        end
        % �����õľ���S2(T+tao)
        S2Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S2Ttao_M(j1,:)=1./(m(2)*epusilon(2)).*exp(-r(2).*(T+tao)).*sin(epusilon(2)*(T+tao)); 
        end
        % �����õľ���S2(t+T+tao)
        S2tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
           S2tTtao_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1)+tao(j1))).*sin(epusilon(2)*(t+T(j1)+tao(j1))))'); 
        end
    else
        epusilon(2)=sqrt(-w(2)^2+r(2)^2);
        % �����õľ���S2(t)
%         S2t=1./(m(2)*epusilon(2)).*exp(-r(2).*t).*sinh(epusilon(2)*t);
        S2t=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*t)-exp((-epusilon(2)-r(2)).*t));
        S2t=conj(S2t');%ת��
        S2t_M=zeros(Nt,Nt1);
        S2t_M=repmat(S2t,1,Nt1);
        
        % �����õľ���S2(T)
%         S2T=1./(m(2)*epusilon(2)).*exp(-r(2).*T).*sinh(epusilon(2)*T);
        S2T=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*T)-exp((-epusilon(2)-r(2)).*T));
        S2T_M=zeros(Nt,Nt1);
        S2T_M=repmat(S2T,Nt,1);
        
        %�����õľ���S2(t+T)
        S2tT_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sinh(epusilon(2)*(t+T(j1))))');
           S2tT_M(:,j1)=conj((0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(t+T(j1)))-exp((-epusilon(2)-r(2)).*(t+T(j1)))))');
        end
        
        %�����õľ���S2(T+tao)
        S2Ttao_M=zeros(Nt,Nt1);
        for j1=1:Nt
           S2Ttao_M(j1,:)=0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(T+tao))-exp((-epusilon(2)-r(2)).*(T+tao)));
        end
        
        %�����õľ���S2(t+T+tao)
        S2tTtao_M=zeros(Nt,Nt1);
        for j1=1:Nt1
%            S2tT_M(:,j1)=conj((1./(m(2)*epusilon(2)).*exp(-r(2).*(t+T(j1))).*sinh(epusilon(2)*(t+T(j1))))');
           S2tTtao_M(:,j1)=conj((0.5./(m(2)*epusilon(2)).*(exp((epusilon(2)-r(2)).*(t+T(j1)+tao(j1)))-exp((-epusilon(2)-r(2)).*(t+T(j1)+tao(j1)))))');
        end
    end   
end
%�ѵõ��ľ���
    %S1t_M, �����õľ���S1(t)
    %S2t_M, �����õľ���S2(t)
    %S1T_M, �����õľ���S1(T)
    %S2T_M, �����õľ���S2(T)
    %S1tT_M, �����õľ���S1(t+T)
    %S2tT_M, �����õľ���S2(t+T)
    %S1Ttao_M, �����õľ���S1(T+tao)
    %S2Ttao_M, �����õľ���S2(T+tao)
    %S1tTtao_M, �����õľ���S1(t+T+tao)
    %S2tTtao_M, �����õľ���S2(t+T+tao)

%% ��ӵ��������ڼ������׷����Ե缫��ǿ�ȵľ���˻�
    S1t_S1tT_S1tTtao=S1t_M.*S1tT_M.*S1tTtao_M;%S1(t)*S1(t+T)*S1(t+T+tao)����
    S1t_S1tT_S2tTtao=S1t_M.*S1tT_M.*S2tTtao_M;%S1(t)*S1(t+T)*S2(t+T+tao)����
    S1t_S2tT_S1tTtao=S1t_M.*S2tT_M.*S1tTtao_M;%S1(t)*S2(t+T)*S1(t+T+tao)����
    S2t_S1tT_S1tTtao=S2t_M.*S1tT_M.*S1tTtao_M;%S2(t)*S1(t+T)*S1(t+T+tao)����
    
    S1t_S2tT_S2tTtao=S1t_M.*S2tT_M.*S2tTtao_M;%S1(t)*S2(t+T)*S2(t+T+tao)����
    S2t_S1tT_S2tTtao=S2t_M.*S1tT_M.*S2tTtao_M;%S2(t)*S1(t+T)*S2(t+T+tao)����
    S2t_S2tT_S1tTtao=S2t_M.*S2tT_M.*S1tTtao_M;%S2(t)*S2(t+T)*S1(t+T+tao)����
    
    S2t_S2tT_S2tTtao=S2t_M.*S2tT_M.*S2tTtao_M;%S2(t)*S2(t+T)*S2(t+T+tao)����
    
    S1t_S1T_S1Ttao=S1t_M.*S1T_M.*S1Ttao_M;%S1(t)*S1(T)*S1(T+tao)����
    S2t_S2T_S2Ttao=S2t_M.*S2T_M.*S2Ttao_M;%S2(t)*S2(T)*S2(T+tao)����
%% ������ھ����Ƶ�����    
    S1t_w=fft(S1t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
    S2t_w=fft(S2t_M,[],1);%��ÿһ�зֱ�������Ҷ�任
    
    S1t_S1tT_S1tTtao_w=fft(S1t_S1tT_S1tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    S1t_S1tT_S2tTtao_w=fft(S1t_S1tT_S2tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    S1t_S2tT_S1tTtao_w=fft(S1t_S2tT_S1tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    S2t_S1tT_S1tTtao_w=fft(S2t_S1tT_S1tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    
    S1t_S2tT_S2tTtao_w=fft(S1t_S2tT_S2tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    S2t_S1tT_S2tTtao_w=fft(S2t_S1tT_S2tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    S2t_S2tT_S1tTtao_w=fft(S2t_S2tT_S1tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    S2t_S2tT_S2tTtao_w=fft(S2t_S2tT_S2tTtao,[],1); %��ÿһ�зֱ�������Ҷ�任
    

    
    
    
    