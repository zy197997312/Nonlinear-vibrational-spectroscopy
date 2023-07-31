%% ��ͼ���
     plot_R1=1;

%% һ.������Ϣ
    %1.������Ϣ
    N_modes=2;%ģʽ��Ŀ
    yita0=0.01*[1,1];
    m=[1,1]; %M ��������

    %1.1 ģʽ��λ��cm-1ת��THz
%     w_cm_1=[12.9,39.2];%cm^-1
%     w_THz=2*pi*0.03*w_cm_1;%THz
%     w=w_THz;%[7.6699,34.0178]; %THz
%     r_cm_1=0.5*[43.0,63.7];%cm^-1
%     r_THz=2*pi*0.03*r_cm_1;%THz
%     r=r_THz;%[0.1885,0.1885]; %1/ps

    %1.2 ģʽ��λֱ�Ӹ���THz    
    w=[1,5]; %THz
    T0=2*pi./w;%��������ģʽ������
    r=[0.2,2]; %1/ps
%% ��. �Ǽ�г��ϵ���ͷ����Բ���
%2.1 anharmonic ��Ϣ��nonlinearity��Ϣ
    u0=[1,1];%u_1^0,u_2^0,��λq0*a0
    u1=0.1*u0;%[0.1,0.1]; %q0 ���ӵ���,����ģʽ��һ��,yita0=u1^2/m
    u2=0.1*u1;%[0.01,0.01]; %q0*a0-1, a0Ϊ�����뾶������ģʽ�Ķ���
    u3=0.1*u2;%[0.001,0.001],%q0*a0-2
    B3=[1,1,1,1]*1.6E-5; %u2(1)*[1,1,1,1];%;[1,1,1,1]*1.6E-5; %B111,B222,B112,B122,��λ��q0^2/(4*Pi*epusilon_0*a0^4)
    B4=[1,1,1,1,1]*1.6E-6; %u3(1)*[1,1,1,1,1];%[1,1,1,1,1]*1.6E-6; %B1111,B2222,B1112,B1122,B1222,��λ��q0^2/(4*Pi*epusilon_0*a0^5)
%2.2 ������Ϣ
    A=[1,1,1];%A1,A2,A3������������ĵ糡���ȣ���λ��q0/(4*Pi*epusilon_0*a0^2)

%% ��. ������Ӧ����    
%3 �������ӵ�������Ӧ����
%3.1 ������Ӧ��������
    Lt0=20*max(T0);%1;%ps��������ʱ�䴰�ڵĳ��ȣ�Ҳ������Ƶ���ά�׵ķֱ���;����ʱ���ά��ʱΪ:Lt=2*max(T0);����Ƶ���ά��ʱΪ:Lt=20*max(T0)
    dt0=1/4*min(T0);%ps,;����ʱ���ά��ʱΪ:dt=1/40*min(T0);����Ƶ���ά��ʱΪdt=1/4*min(T0),��ʱ��Ҫ�ı�Ϊdt=1/8*min(T0)������Ƶ�ʹ۲췶Χ
    Nt0=floor(Lt0/dt0);%��Lt��ͬ����ʱ���ά�׵�ʱ��ֱ���dt=Lt/(Nt-1)
    t0=linspace(0,Lt0,Nt0);
    R1t_M=zeros(N_modes,Nt0);
    for j1=1:N_modes
       if w(j1)>=r(j1)
           R1t_M(j1,:)=yita0(j1)./sqrt(w(j1)^2-r(j1)^2)*exp(-r(j1).*t0).*sin(sqrt(w(j1)^2-r(j1)^2).*t0);
       else
%            R1t_M(j1,:)=yita0(j1)./sqrt(-w(j1)^2+r(j1)^2)*exp(-r(j1).*t0).*sinh(sqrt(-w(j1)^2+r(j1)^2).*t0);
           R1t_M(j1,:)=yita0(j1)./sqrt(-w(j1)^2+r(j1)^2)*(exp((sqrt(-w(j1)^2+r(j1)^2)-r(j1)).*t0)-exp((-sqrt(-w(j1)^2+r(j1)^2)-r(j1)).*t0));
       end
           
    end
    R1t=sum(R1t_M,1);
    
%3.2 ������Ӧ����Ƶ��
    dw0=2*pi/(Lt0);
    if(mod(Nt0,2)==0)
        wt0 = (-Nt0/2:Nt0/2-1)*dw0; %��������������趨�����治��Ҫ����fftshift��ifftshift
    else
        wt0 = (-(Nt0-1)/2:(Nt0-1)/2)*dw0;
    end
    R1w=fftshift(fft(R1t)*dt0);%ע�����dt0�ŵó���ʵ��Ƶ��
    
%3.3 ���䳡Ϊdelta����ʱ�����Ե缫��ǿ��
    P1t=A(3)*R1t;
    
    
%3.4 ����������Ӧ����
    % ��ɫ��С�趨
    %��ͼ�����߿��
    %figure ���ڴ�С��[5 5 16 12];
    % ��������ͼ�γߴ�                ��ͼ�߿�pt��                            ����ֵ�ֺ�                    �������ȣ�pt��
    % 80*60mm                        1.0pt                                       18                                 0.6pt
    % 60*45mm                        1.0pt                                       20                                 0.6pt
    % 50*37.5mm                      0.8pt                                       22                                 0.6pt
    % 40*30mm                        0.8pt                                       24                                 0.6pt

    if plot_R1==1
        my_font='arial';%'arial';%'Times New Roman';%'arial';'Helvetica'
        my_fontsize=22; 
        my_figuresize=[5 5 16 12];%
        my_fontweight='normal';%'normal';%'light'
        my_linewidth=0.8;
        contour_lines=100;
        my_colormap=jet;%gray; jet; parula; hot; colormap(my_colormap);%��άͼ����ɫģʽ
        
        figure();
        plot(t0,R1t,'b','linewidth',my_linewidth);
        xlabel('t(ps)','fontname',my_font,'fontsize',my_fontsize);
        ylabel('R^{(1)}(t)','fontname',my_font,'fontsize',my_fontsize);
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %ͼ�ߵĿ��
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%����������̶�ֵ��������ֺ�
        
        figure();
        plot(wt0,abs(R1w),'b','linewidth',my_linewidth);
        xlabel('\omega(THz)','fontname',my_font,'fontsize',my_fontsize);
        ylabel('R^{(1)}(\omega)','fontname',my_font,'fontsize',my_fontsize);
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %ͼ�ߵĿ��
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%����������̶�ֵ��������ֺ�
        
    end

