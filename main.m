%% MATLAB implementation
%global m w r u1 u2
clc;
%% 1.Basic parameter
    %1.1 Oscillator information
    %1.2 Basic vibrator information for different materials
        plot_R1=1; %1 Plot the curve of the linear response function, 2 Not plot
        direct_modes_parameters_eg0; %The initial information of the resonance mode is given
%         direct_modes_parameters_eg1;
%         direct_modes_parameters_eg2_CS2; %Initial information for calling CS2 resonance mode

    
%    %1.3 anharmonic and nonlinearity
        u0=[1,1];%u_1^0,u_2^0,q0*a0
        u1=sqrt(m.*yita0);%[0.1,0.1]; %q0 Electron charge, first order of two modes,yita0=u1^2/m
        u2=0.1*u1;%[0.01,0.01]; %q0*a0-1, a0 is Bohr radius, the second order of the two modes
        u3=0.1*u2;%[0.001,0.001],%q0*a0-2
        B3=u2(1)*[1,1,1,1];%;[1,1,1,1]*1.6E-5; %B111,B222,B112,B122, q0^2/(4*Pi*epusilon_0*a0^4)
        B4=u3(1)*[1,1,1,1,1];%[1,1,1,1,1]*1.6E-6; %B1111,B2222,B1112,B1122,B1222, q0^2/(4*Pi*epusilon_0*a0^5)
%     
%     %1.4 Field information
        A=[1,1,1];%A1,A2,A3 The electric field amplitude of the three incident pulses，q0/(4*Pi*epusilon_0*a0^2)


%% 2. Calculate the parameter, time vector and frequency vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%<<Selective parameter aggregation>>%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1 Calculate the time coordinate selection
    time_axis=1; %1 t or T, tao is a constant number; 2choose t and tao,T is a constant number 
    
    %Choice of nonlinear order
    NL_order=3; %Nonlinear order 2: second order, 3: third order
    
    P2_choose=6; %1 B111, 2 B222, 3 B112, 4 B122, 5 u2_mode1,6 u2_mode2, 7 AH:B111+B222+B112+B122, 8 ND:u2_mode1+u2_mode2, 9 All: AH+ND
    P3_choose=6; %(directV) 1 B1111,2 B2222, 3 B1112, 4 B1122, 5 B1222; (directU) 6 u3_mode1, 7 u3_mode2
    
    %Re_sq2_t=2;% 1 Represent the real value of the electric field in the
    %time domain，2 Represents the value of the modular square for drawing a two-dimensional spectrum in the time domain.
    %contour_or_f=1;% 1 Draw contour diagram, 2 Draw contourf diagram
    %Re_Im_Abs_w=3; %frequency 1:real part; 2: imaginary part; 3:abs; 4: angle
    
    if NL_order==3
        time_axis=1;
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%<<Selective parameter aggregation>>%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %1.1Time vector t
        Lt=20*max(T0);
        dt=1/8*min(T0);
        Nt=floor(Lt/dt);
        t=linspace(0,Lt,Nt);
        dwt=2*pi/Lt;
    %1.2 Second time vector
    if time_axis==1
        tao=0;%ps
    %T
        LT=20*max(T0);%1;%ps,The time domain two-dimensional spectrum is calculated:LT=2*max(T0)
        dT=1/8*min(T0);%ps,;The time domain two-dimensional spectrum is calculated:dT=1/40*min(T0)
        NT=floor(LT/dT);
        T=linspace(0,LT,NT);
        [T_matrix,t_matrix]=meshgrid(T,t); %Time variable matrix for drawing
        dwT=2*pi/LT;
        Nt1=NT;
        t1=T;
        dt1=dT;
        t1_matrix=T_matrix;
        dwt1=dwT;
    else
        T=0;%ps
    %Time vector tao
        Ltao=20*max(T0);%1;%ps,calculating the two-dimensional spectrum in the time domain:Lt=2*max(T0);calculating two-dimensional spectrum in frequency domain:Lt=20*max(T0)
        dtao=1/8*min(T0);%ps,;dt=1/40*min(T0);dt=1/4*min(T0),dt=1/8*min(T0)expand the frequency observation range
        Ntao=floor(Ltao/dtao);
        tao=linspace(0,Ltao,Ntao);
        [tao_matrix,t_matrix]=meshgrid(tao,t); %Time variable matrix for drawing
        dwtao=2*pi/Ltao;
        Nt1=Ntao;
        t1=tao;
        dt1=dtao;
        t1_matrix=tao_matrix;
        dwt1=dwtao;
    end
        
    
    %1.3 Frequency vector
        %drawing two-dimensional spectrum in frequency domain, vector group 1 is used. When drawing two-dimensional spectrum, unwanted ascending lines may appear
        if(mod(Nt,2)==0)
            wt = [(0:Nt/2-1),(-Nt/2:-1)]*dwt; 
        else
            wt = [(0:(Nt-1)/2),(-(Nt-1)/2:-1)]*dwt;
        end
        
        if(mod(Nt1,2)==0)
            wt1 = [(0:Nt1/2-1),(-Nt1/2:-1)]*dwt1; 
        else
            wt1 = [(0:(Nt1-1)/2),(-(Nt1-1)/2:-1)]*dwt1;
        end
        [wt1_matrix,wt_matrix]=meshgrid(wt1,wt); %Time variable matrix for drawing
        
        %Vector group 2 is used when drawing two-dimensional spectrum in frequency domain
        if(mod(Nt,2)==0)
            wtx = (-Nt/2:Nt/2-1)*dwt; 
        else
            wtx = (-(Nt-1)/2:(Nt-1)/2)*dwt;
        end
        if(mod(Nt1,2)==0)
            wt2 =(-Nt1/2:Nt1/2-1)*dwt1; 
        else
            wt2 =(-(Nt1-1)/2:(Nt1-1)/2)*dwt1;
        end
        [wt2_matrix,wtx_matrix]=meshgrid(wt2,wtx); %Time variable matrix for drawing
    
    
%     %2.2 Call a function to calculate further resonance parameters for a particular material
         derived_modes_parameters_2modes; %The call computes the pattern parameters, in general form
%     %     derived_modes_parameters_2modes_CS2;     %Call to calculate the mode parameters, according to the references:J.Chem.Phys106,2569(1997)

    

    
 %% 3. The different components of the second order nonlinear electric polarization intensity are calculated  
    %3.1 Selective computation
         NL_order=3; %Nonlinear order 2 second order, 3 third order
        
    %3.2 Parameter setting
         %Re_sq2_t=2;% 1 represents the real value of the electric field in the time domain, and 2 represents the modular square value of the two-dimensional spectrum in the time domain.
         %contour_or_f=2;% 1 Draw contour diagram, 2 Draw contourf diagram
         %Re_Im_Abs_w=3; %draw the real part 1 or the imaginary part 2, abs 3, or 4angle
        
        if NL_order==2
            P2_derived_modes_parameters_2modes; %Computes the pattern parameters, in general form
            derived_modes_parameters_2modes_CS2;     %Calculate the mode parameters, according to the references:J.Chem.Phys106,2569(1997)
            
            P2_choose=9; %1 B111, 2 B222, 3 B112, 4 B122, 5 u2_mode1,6 u2_mode2, 7 AH:B111+B222+B112+B122, 8 ND:u2_mode1+u2_mode2, 9 All: AH+ND
            Calculate_P2;
            %plot_P_2Dfigures_t_w; %Drawing function
            
        elseif NL_order==3
            P3_derived_modes_parameters_2modes;
            
            P3_choose=6;% %(directV) 1 B1111,2 B2222, 3 B1112, 4 B1122, 5 B1222; (directU) 6 u3_mode1, 7 u3_mode2
            Calculate_P3;
            %plot_P_2Dfigures_t_w; %Drawing function
        end
            

        
        
        
%% 4. Drawing
         Re_sq2_t=2;% 1:represents the real value of the electric field in the time domain, and 2 represents the modular square value of the two-dimensional spectrum in the time domain.
         contour_or_f=1;% 1 Draw contour diagram, 2 Draw contourf diagram
         Re_Im_Abs_w=3; %Draw the real part 1 or the imaginary part 2, abs 3, or 4angle
%         
        plot_P_2Dfigures_t_w; %Drawing function
            
    
    
    