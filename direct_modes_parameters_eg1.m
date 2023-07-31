%% 画图与否
     plot_R1=1;

%% 一.振子信息
    %1.振子信息
    N_modes=2;%模式数目
    yita0=0.01*[1,1];
    m=[1,1]; %M 质子质量

    %1.1 模式单位由cm-1转向THz
%     w_cm_1=[12.9,39.2];%cm^-1
%     w_THz=2*pi*0.03*w_cm_1;%THz
%     w=w_THz;%[7.6699,34.0178]; %THz
%     r_cm_1=0.5*[43.0,63.7];%cm^-1
%     r_THz=2*pi*0.03*r_cm_1;%THz
%     r=r_THz;%[0.1885,0.1885]; %1/ps

    %1.2 模式单位直接给出THz    
    w=[1,5]; %THz
    T0=2*pi./w;%两个共振模式的周期
    r=[0.2,2]; %1/ps
%% 二. 非简谐性系数和非线性参数
%2.1 anharmonic 信息和nonlinearity信息
    u0=[1,1];%u_1^0,u_2^0,单位q0*a0
    u1=0.1*u0;%[0.1,0.1]; %q0 电子电量,两个模式的一阶,yita0=u1^2/m
    u2=0.1*u1;%[0.01,0.01]; %q0*a0-1, a0为波尔半径，两个模式的二阶
    u3=0.1*u2;%[0.001,0.001],%q0*a0-2
    B3=[1,1,1,1]*1.6E-5; %u2(1)*[1,1,1,1];%;[1,1,1,1]*1.6E-5; %B111,B222,B112,B122,单位：q0^2/(4*Pi*epusilon_0*a0^4)
    B4=[1,1,1,1,1]*1.6E-6; %u3(1)*[1,1,1,1,1];%[1,1,1,1,1]*1.6E-6; %B1111,B2222,B1112,B1122,B1222,单位：q0^2/(4*Pi*epusilon_0*a0^5)
%2.2 场的信息
    A=[1,1,1];%A1,A2,A3三个入射脉冲的电场幅度，单位：q0/(4*Pi*epusilon_0*a0^2)

%% 三. 线性响应函数    
%3 画出振子的线性响应函数
%3.1 线性响应函数构建
    Lt0=20*max(T0);%1;%ps，决定了时间窗口的长度，也决定了频域二维谱的分辨率;计算时域二维谱时为:Lt=2*max(T0);计算频域二维谱时为:Lt=20*max(T0)
    dt0=1/4*min(T0);%ps,;计算时域二维谱时为:dt=1/40*min(T0);计算频域二维谱时为dt=1/4*min(T0),有时需要改变为dt=1/8*min(T0)以扩大频率观察范围
    Nt0=floor(Lt0/dt0);%与Lt共同决定时域二维谱的时间分辨率dt=Lt/(Nt-1)
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
    
%3.2 线性响应函数频谱
    dw0=2*pi/(Lt0);
    if(mod(Nt0,2)==0)
        wt0 = (-Nt0/2:Nt0/2-1)*dw0; %如果采用这样的设定则下面不需要再用fftshift和ifftshift
    else
        wt0 = (-(Nt0-1)/2:(Nt0-1)/2)*dw0;
    end
    R1w=fftshift(fft(R1t)*dt0);%注意乘以dt0才得出真实的频谱
    
%3.3 入射场为delta函数时的线性电极化强度
    P1t=A(3)*R1t;
    
    
%3.4 画出线性响应函数
    % 颜色大小设定
    %画图字体线宽等
    %figure 窗口大小：[5 5 16 12];
    % 最终所需图形尺寸                画图线宽（pt）                            坐标值字号                    坐标轴宽度（pt）
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
        my_colormap=jet;%gray; jet; parula; hot; colormap(my_colormap);%二维图的颜色模式
        
        figure();
        plot(t0,R1t,'b','linewidth',my_linewidth);
        xlabel('t(ps)','fontname',my_font,'fontsize',my_fontsize);
        ylabel('R^{(1)}(t)','fontname',my_font,'fontsize',my_fontsize);
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %图线的宽度
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%设置坐标轴刻度值的字体和字号
        
        figure();
        plot(wt0,abs(R1w),'b','linewidth',my_linewidth);
        xlabel('\omega(THz)','fontname',my_font,'fontsize',my_fontsize);
        ylabel('R^{(1)}(\omega)','fontname',my_font,'fontsize',my_fontsize);
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %图线的宽度
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%设置坐标轴刻度值的字体和字号
        
    end

