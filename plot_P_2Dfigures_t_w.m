%% plot_2Dfigure_t_w
%% ��ɫ��С�趨
    %��ͼ�����߿��
    %figure ���ڴ�С��[5 5 16 12];
    % ��������ͼ�γߴ�                ��ͼ�߿�pt��                            ����ֵ�ֺ�                    �������ȣ�pt��
    % 80*60mm                        1.0pt                                       18                                 0.6pt
    % 60*45mm                        1.0pt                                       20                                 0.6pt
    % 50*37.5mm                      0.8pt                                       22                                 0.6pt
    % 40*30mm                        0.8pt                                       24                                 0.6pt

        my_font='arial';%'arial';%'Times New Roman';%'arial';'Helvetica'
        my_fontsize=22; 
        my_figuresize=[5 5 16 12];%
        my_fontweight='normal';%'normal';%'light'
        my_linewidth=0.5;%��contourͼʱ�߿���趨Ϊ0.5
        contour_lines=100;
        my_colormap=jet;%gray; jet; parula; hot; colormap(my_colormap);%��άͼ����ɫģʽ
        
%% ���໭ͼ
    if NL_order==2
        P_x_t=P2_x_t;
        P_x_w=P2_x_w;
    elseif NL_order==3
        P_x_t=P3_x_t;
        P_x_w=P3_x_w;
    end
        
%1��ʱ���ά��
        figure();
        if Re_sq2_t==1
            if contour_or_f==1
                contourf(t1_matrix,t_matrix,real(P_x_t),contour_lines,'Linestyle','none');
            else
                contour(t1_matrix,t_matrix,real(P_x_t),contour_lines);
            end
        else
            if contour_or_f==1
                contourf(t1_matrix,t_matrix,abs(P_x_t).^2,contour_lines,'Linestyle','none');
            else
                contour(t1_matrix,t_matrix,abs(P_x_t).^2,contour_lines);
            end
        end
        if time_axis==1
            xlabel('T(ps)','fontname',my_font,'fontsize',my_fontsize);
        else
            xlabel('\tau(ps)','fontname',my_font,'fontsize',my_fontsize);
        end            
        
        ylabel('t(ps)','fontname',my_font,'fontsize',my_fontsize); 
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %ͼ�ߵĿ��
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%����������̶�ֵ��������ֺ�
        xlim([t1(1) t1(end)]);
        set(gca,'XTick',t1(1):0.5*(t1(end)-t1(1)):t1(end));%������������ֵ���ֵ
        set(gca,'xticklabel',sprintf('%03.2f|',get(gca,'xtick')));%������������ֵ���ֵС����λ��,3.2��ʾС�������2λ
        ylim([t(1) t(end)]);
        set(gca,'YTick',t(1):0.5*(t(end)-t(1)):t(end));
        set(gca,'yticklabel',sprintf('%03.2f|',get(gca,'ytick')));%������������ֵ���ֵС����λ��,3.2��ʾС�������2λ

%2��Ƶ���ά��
%2.1 ������άƵ��ͼ
    figure();
        switch Re_Im_Abs_w
            case 1
                contourf(wt1_matrix,wt_matrix,real(P_x_w),contour_lines,'Linestyle','none');
            case 2
                contourf(wt1_matrix,wt_matrix,imag(P_x_w),contour_lines,'Linestyle','none');                   
            case 3
                contourf(wt1_matrix,wt_matrix,abs(P_x_w),contour_lines,'Linestyle','none');
            case 4
                contourf(wt1_matrix,wt_matrix,angle(P_x_w),contour_lines,'Linestyle','none');
        end
        if time_axis==1
            xlabel('\omega_T(THz)','fontname',my_font,'fontsize',my_fontsize);
        else
            xlabel('\omega_\tau(THz)','fontname',my_font,'fontsize',my_fontsize);
        end
        
        ylabel('\omega_t(THz)','fontname',my_font,'fontsize',my_fontsize); 
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %ͼ�ߵĿ��
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%����������̶�ֵ��������ֺ�
        
%2.2 ���ȸ��߶�άƵ��ͼ
        figure();
        P_x_w=fftshift(P_x_w);
        switch Re_Im_Abs_w
            case 1
                if contour_or_f==1
                    contourf(wt2_matrix,wtx_matrix,real(P_x_w),contour_lines,'Linestyle','none');
                else
                    contour(wt2_matrix,wtx_matrix,real(P_x_w),contour_lines);
                end
            case 2
                if contour_or_f==1
                    contourf(wt2_matrix,wtx_matrix,imag(P_x_w),contour_lines,'Linestyle','none');
                else
                    contour(wt2_matrix,wtx_matrix,imag(P_x_w),contour_lines);
                end                    
            case 3
                if contour_or_f==1                
                    contourf(wt2_matrix,wtx_matrix,abs(P_x_w),contour_lines,'Linestyle','none');
                else
                    contour(wt2_matrix,wtx_matrix,abs(P_x_w),contour_lines);
                end
            case 4
                if contour_or_f==1
                    contourf(wt2_matrix,wtx_matrix,angle(P_x_w),contour_lines,'Linestyle','none');
                else
                    contour(wt2_matrix,wtx_matrix,angle(P_x_w),contour_lines);
                end
        end
        if time_axis==1
            xlabel('\omega_T(THz)','fontname',my_font,'fontsize',my_fontsize);
        else
            xlabel('\omega_\tau(THz)','fontname',my_font,'fontsize',my_fontsize);
        end
        
        ylabel('\omega_t(THz)','fontname',my_font,'fontsize',my_fontsize); 
        set(gcf,'Units','centimeters','Position',my_figuresize);
        set(get(gca,'children'),'linewidth',my_linewidth); %ͼ�ߵĿ��
        set(gca,'fontname',my_font,'fontsize',my_fontsize);%����������̶�ֵ��������ֺ�
%         xlim([wt1(1) wt1(end)]);
%         set(gca,'XTick',wt1(1):0.5*(wt1(end)-wt1(1)):wt1(end));
%         ylim([wt(1) wt(end)]);
%         set(gca,'YTick',wt(1):0.5*(wt(end)-wt(1)):wt(end));