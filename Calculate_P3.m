switch P3_choose
    case 1%B1111   
        calculate_P3_directV_B1111_t_w;%得到的时域和频域矩阵P3_directV_B1111_t,P3_directV_B1111_w
        P3_x_t=P3_directV_B1111_t;
        P3_x_w=P3_directV_B1111_w;
    case 2%B2222
        calculate_P3_directV_B2222_t_w;%得到的时域和频域矩阵P3_directV_B2222_t,P3_directV_B2222_w
        P3_x_t=P3_directV_B2222_t;
        P3_x_w=P3_directV_B2222_w;
    case 3%B1112
        calculate_P3_directV_B1112_t_w;%得到的时域和频域矩阵P3_directV_B1112_t,P3_directV_B1112_w
        P3_x_t=P3_directV_B1112_t;
        P3_x_w=P3_directV_B1112_w;
    case 4%B1122
        calculate_P3_directV_B1122_t_w;%得到的时域和频域矩阵P3_directV_B1122_t,P3_directV_B1122_w
        P3_x_t=P3_directV_B1122_t;
        P3_x_w=P3_directV_B1122_w;
    case 5%B1222
        calculate_P3_directV_B1222_t_w;%得到的时域和频域矩阵P3_directV_B1222_t,P3_directV_B1222_w
        P3_x_t=P3_directV_B1222_t;
        P3_x_w=P3_directV_B1222_w;
    case 6%u3_mode1
        calculate_P3_directU_u3_mode1_t_w;%得到的时域和频域矩阵P3_directU_u3_mode1_t, P3_directU_u3_mode1_w
        P3_x_t=P3_directU_u3_mode1_t;
        P3_x_w=P3_directU_u3_mode1_w;
    case 7%u3_mode2
        calculate_P3_directU_u3_mode2_t_w;%得到的时域和频域矩阵P3_directU_u3_mode2_t, P3_directU_u3_mode2_w
        P3_x_t=P3_directU_u3_mode2_t;
        P3_x_w=P3_directU_u3_mode2_w;
%     case 8%AH
%         calculate_P2_B111_t_w;%得到的时域和频域矩阵P2_B111_t,P2_B111_w
%         calculate_P2_B222_t_w;%得到的时域和频域矩阵P2_B222_t,P2_B222_w
%         calculate_P2_B112_t_w;%得到的时域和频域矩阵P2_B112_t,P2_B112_w
%         calculate_P2_B122_t_w;%得到的时域和频域矩阵P2_B122_t,P2_B122_w
% 
%         P2_x_t=P2_B111_t+P2_B222_t+P2_B112_t+P2_B122_t;
%         P2_x_w=P2_B111_w+P2_B222_w+P2_B112_w+P2_B122_w;
%     case 9%ND
%         calculate_P2_u2_mode1_t_w;%得到的时域和频域矩阵P2_u2_mode1_t, P2_u2_mode1_w
%         calculate_P2_u2_mode2_t_w;%得到的时域和频域矩阵P2_u2_mode2_t, P2_u2_mode2_w
%         P2_x_t=P2_u2_mode1_t+P2_u2_mode2_t;
%         P2_x_w=P2_u2_mode1_w+P2_u2_mode2_w;
%     case 10%AH+ND
%         calculate_P2_B111_t_w;%得到的时域和频域矩阵P2_B111_t,P2_B111_w
%         calculate_P2_B222_t_w;%得到的时域和频域矩阵P2_B222_t,P2_B222_w
%         calculate_P2_B112_t_w;%得到的时域和频域矩阵P2_B112_t,P2_B112_w
%         calculate_P2_B122_t_w;%得到的时域和频域矩阵P2_B122_t,P2_B122_w
%         calculate_P2_u2_mode1_t_w;%得到的时域和频域矩阵P2_u2_mode1_t, P2_u2_mode1_w
%         calculate_P2_u2_mode2_t_w;%得到的时域和频域矩阵P2_u2_mode2_t, P2_u2_mode2_w
%         P2_x_t=P2_B111_t+P2_B222_t+P2_B112_t+P2_B122_t+P2_u2_mode1_t+P2_u2_mode2_t;
%         P2_x_w=P2_B111_w+P2_B222_w+P2_B112_w+P2_B122_w+P2_u2_mode1_w+P2_u2_mode2_w;          
end