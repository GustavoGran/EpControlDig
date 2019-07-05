% Projeto de Digital
% Versão: 19.07.05.10
% Criação: 05/07/2019 07:15
% Edição: 05/07/2019 09:30

clear all;
clc;

% Constantes obtidas da análise das respostas ao degrau dos sistemas de 2ª
% ordem

% Mp_11 = 0.2;
% tp_11 = 1.75;
% K_11 = 0.7;
% 
% Mp_22 = 0.533;
% tp_22 = 1.1;
% K_22 = 0.6;

% Cálculo de Xsi e wn

% Xsi_11 = sqrt( ( log(Mp_11) )^2 / ( pi^2 + ( log(Mp_11) )^2 ) );
% wn_11 = pi / ( tp_11 * sqrt ( 1 - (Xsi_11)^2 ) );
% 
% Xsi_22 = sqrt( ( log(Mp_22) )^2 / ( pi^2 + ( log(Mp_22) )^2 ) );
% wn_22 = pi / ( tp_22 * sqrt ( 1 - (Xsi_22)^2 ) );

% Constantes obtidas da análise das respostas ao degraud dos sistemas de 1ª
% ordem
% 
% T_21 = 0.5;
% K_21 = 0.2;
% 
% T_12 = 1;
% K_12 = 0.3;


% Desenvolvendo o modelo da planta;

A = [   0       ,       1   ,   0   ,   0   ,   0       ,   0       ;   ...
        -4.0685 ,   -1.8394 ,   0   ,   0   ,   0       ,   0       ;   ...
        0       ,       0   ,   -1  ,   0   ,   0       ,   0       ;   ...
        0       ,       0   ,   0   ,   -2  ,   0       ,   0       ;   ...
        0       ,       0   ,   0   ,   0   ,   0       ,   1       ;   ...
        0       ,       0   ,   0   ,   0   ,   -8.4839 ,   -5.0904 ];

B = [   0       ,       0       ;   ...
        2.8480  ,       0       ;   ...
        0       ,       0.3     ;   ...
        0.4     ,       0       ;   ...
        0       ,       0       ;   ...
        0       ,       5.0904  ];

C = [   1   ,   0   ,   1   ,   0   ,   0   ,   0   ;   ...
        0   ,   0   ,   0   ,   1   ,   1   ,   0   ];
    

% Discretizando a planta obtida

Ts = 1/10;

[ Phi , Gama ] = c2d( A , B , Ts);

% Projetando o Controle por RLQ

Q = transpose(C)*C;

R = eye(2); % Vamos tentar algo não muito agressivo

[ K , S , zc ] = dlqr( Phi , Gama , Q , R )




        
        

