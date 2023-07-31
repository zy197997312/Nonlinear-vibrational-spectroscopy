switch P2_choose
    case 1%B111   
        calculate_P2_B111_t_w;%得到的时域和频域矩阵P2_B111_t,P2_B111_w
        P2_x_t=P2_B111_t;
        P2_x_w=P2_B111_w;
    case 2%B222
        calculate_P2_B222_t_w;%得到的时域和频域矩阵P2_B222_t,P2_B222_w
        P2_x_t=P2_B222_t;
        P2_x_w=P2_B222_w;
    case 3%B112
        calculate_P2_B112_t_w;%得到的时域和频域矩阵P2_B112_t,P2_B112_w
        P2_x_t=P2_B112_t;
        P2_x_w=P2_B112_w;
    case 4%B122
        calculate_P2_B122_t_w;%得到的时域和频域矩阵P2_B122_t,P2_B122_w
        P2_x_t=P2_B122_t;
        P2_x_w=P2_B122_w;
    case 5%u2_mode1
        calculate_P2_u2_mode1_t_w;%得到的时域和频域矩阵P2_u2_mode1_t, P2_u2_mode1_w
        P2_x_t=P2_u2_mode1_t;
        P2_x_w=P2_u2_mode1_w;
    case 6%u2_mode2
        calculate_P2_u2_mode2_t_w;%得到的时域和频域矩阵P2_u2_mode2_t, P2_u2_mode2_w
        P2_x_t=P2_u2_mode2_t;
        P2_x_w=P2_u2_mode2_w;
    case 7%AH
        calculate_P2_B111_t_w;%得到的时域和频域矩阵P2_B111_t,P2_B111_w
        calculate_P2_B222_t_w;%得到的时域和频域矩阵P2_B222_t,P2_B222_w
        calculate_P2_B112_t_w;%得到的时域和频域矩阵P2_B112_t,P2_B112_w
        calculate_P2_B122_t_w;%得到的时域和频域矩阵P2_B122_t,P2_B122_w

        P2_x_t=P2_B111_t+P2_B222_t+P2_B112_t+P2_B122_t;
        P2_x_w=P2_B111_w+P2_B222_w+P2_B112_w+P2_B122_w;
    case 8%ND
        calculate_P2_u2_mode1_t_w;%得到的时域和频域矩阵P2_u2_mode1_t, P2_u2_mode1_w
        calculate_P2_u2_mode2_t_w;%得到的时域和频域矩阵P2_u2_mode2_t, P2_u2_mode2_w
        P2_x_t=P2_u2_mode1_t+P2_u2_mode2_t;
        P2_x_w=P2_u2_mode1_w+P2_u2_mode2_w;
    case 9%AH+ND
        calculate_P2_B111_t_w;%得到的时域和频域矩阵P2_B111_t,P2_B111_w
        calculate_P2_B222_t_w;%得到的时域和频域矩阵P2_B222_t,P2_B222_w
        calculate_P2_B112_t_w;%得到的时域和频域矩阵P2_B112_t,P2_B112_w
        calculate_P2_B122_t_w;%得到的时域和频域矩阵P2_B122_t,P2_B122_w
        calculate_P2_u2_mode1_t_w;%得到的时域和频域矩阵P2_u2_mode1_t, P2_u2_mode1_w
        calculate_P2_u2_mode2_t_w;%得到的时域和频域矩阵P2_u2_mode2_t, P2_u2_mode2_w
        P2_x_t=P2_B111_t+P2_B222_t+P2_B112_t+P2_B122_t+P2_u2_mode1_t+P2_u2_mode2_t;
        P2_x_w=P2_B111_w+P2_B222_w+P2_B112_w+P2_B122_w+P2_u2_mode1_w+P2_u2_mode2_w;          
end