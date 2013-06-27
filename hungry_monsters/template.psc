# basic gene parameters for X
# transcription rates
X_activated_transcription:
    X_activated_promoter + {alpha} ATP > X_activated_promoter + X_mrna
    activated_transcription_rate * X_activated_promoter * ATP 
X_basal_transcription:
    X_basal_promoter + {alpha} ATP > X_basal_promoter + X_mrna
    basal_transcription_rate * X_basal_promoter * ATP 
X_repressed_transcription:
    X_repressed_promoter + {alpha} ATP > X_repressed_promoter + X_mrna
    repressed_transcription_rate * X_repressed_promoter * ATP 
# translation rates
X_translation:
    X_mrna + {beta} ATP > X_mrna + X_protein
    translation_rate * X_mrna * ATP 
# degredation rates
X_mrna_deg:
    X_mrna > $pool
    mRNA_degradation_rate * X_mrna
X_protein_deg:
    X_protein > $pool
    protein_degradation_rate * X_protein
# end basic gene parameters

# interactions with other genes:
X_activates_P:
    X_protein + P_basal_promoter > P_activated_promoter
    %s * X_protein * P_basal_promoter
X_unactivates_P:
    P_activated_promoter > X_protein + P_basal_promoter
    1 * P_activated_promoter
X_activates_T:
    X_protein + T_basal_promoter > T_activated_promoter
    %s * X_protein * T_basal_promoter
X_unactivates_T:
    T_activated_promoter > X_protein + T_basal_promoter
    1 * T_activated_promoter
X_represses_U:
    X_protein + U_basal_promoter > U_repressed_promoter
    %s * X_protein * U_basal_promoter
X_unrepresses_U:
    U_repressed_promoter > X_protein + U_basal_promoter
    1 * U_repressed_promoter
X_activates_V:
    X_protein + V_basal_promoter > V_activated_promoter
    %s * X_protein * V_basal_promoter
X_unactivates_V:
    V_activated_promoter > X_protein + V_basal_promoter
    1 * V_activated_promoter
X_represses_X:
    X_protein + X_basal_promoter > X_repressed_promoter
    %s * X_protein * X_basal_promoter
X_unrepresses_X:
    X_repressed_promoter > X_protein + X_basal_promoter
    1 * X_repressed_promoter
X_represses_Y:
    X_protein + Y_basal_promoter > Y_repressed_promoter
    %s * X_protein * Y_basal_promoter
X_unrepresses_Y:
    Y_repressed_promoter > X_protein + Y_basal_promoter
    1 * Y_repressed_promoter
X_represses_Z:
    X_protein + Z_basal_promoter > Z_repressed_promoter
    %s * X_protein * Z_basal_promoter
X_unrepresses_Z:
    Z_repressed_promoter > X_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for Y
# transcription rates
Y_activated_transcription:
    Y_activated_promoter + {alpha} ATP > Y_activated_promoter + Y_mrna
    activated_transcription_rate * Y_activated_promoter * ATP 
Y_basal_transcription:
    Y_basal_promoter + {alpha} ATP > Y_basal_promoter + Y_mrna
    basal_transcription_rate * Y_basal_promoter * ATP 
Y_repressed_transcription:
    Y_repressed_promoter + {alpha} ATP > Y_repressed_promoter + Y_mrna
    repressed_transcription_rate * Y_repressed_promoter * ATP 
# translation rates
Y_translation:
    Y_mrna + {beta} ATP > Y_mrna + Y_protein
    translation_rate * Y_mrna * ATP 
# degredation rates
Y_mrna_deg:
    Y_mrna > $pool
    mRNA_degradation_rate * Y_mrna
Y_protein_deg:
    Y_protein > $pool
    protein_degradation_rate * Y_protein
# end basic gene parameters

# interactions with other genes:
Y_represses_P:
    Y_protein + P_basal_promoter > P_repressed_promoter
    %s * Y_protein * P_basal_promoter
Y_unrepresses_P:
    P_repressed_promoter > Y_protein + P_basal_promoter
    1 * P_repressed_promoter
Y_activates_T:
    Y_protein + T_basal_promoter > T_activated_promoter
    %s * Y_protein * T_basal_promoter
Y_unactivates_T:
    T_activated_promoter > Y_protein + T_basal_promoter
    1 * T_activated_promoter
Y_activates_U:
    Y_protein + U_basal_promoter > U_activated_promoter
    %s * Y_protein * U_basal_promoter
Y_unactivates_U:
    U_activated_promoter > Y_protein + U_basal_promoter
    1 * U_activated_promoter
Y_represses_V:
    Y_protein + V_basal_promoter > V_repressed_promoter
    %s * Y_protein * V_basal_promoter
Y_unrepresses_V:
    V_repressed_promoter > Y_protein + V_basal_promoter
    1 * V_repressed_promoter
Y_activates_X:
    Y_protein + X_basal_promoter > X_activated_promoter
    %s * Y_protein * X_basal_promoter
Y_unactivates_X:
    X_activated_promoter > Y_protein + X_basal_promoter
    1 * X_activated_promoter
Y_activates_Y:
    Y_protein + Y_basal_promoter > Y_activated_promoter
    %s * Y_protein * Y_basal_promoter
Y_unactivates_Y:
    Y_activated_promoter > Y_protein + Y_basal_promoter
    1 * Y_activated_promoter
Y_activates_Z:
    Y_protein + Z_basal_promoter > Z_activated_promoter
    %s * Y_protein * Z_basal_promoter
Y_unactivates_Z:
    Z_activated_promoter > Y_protein + Z_basal_promoter
    1 * Z_activated_promoter
# end interactions with other genes

# basic gene parameters for U
# transcription rates
U_activated_transcription:
    U_activated_promoter + {alpha} ATP > U_activated_promoter + U_mrna
    activated_transcription_rate * U_activated_promoter * ATP 
U_basal_transcription:
    U_basal_promoter + {alpha} ATP > U_activated_promoter + U_mrna
    basal_transcription_rate * U_basal_promoter * ATP 
U_repressed_transcription:
    U_repressed_promoter + {alpha} ATP > U_repressed_promoter + U_mrna
    repressed_transcription_rate * U_repressed_promoter * ATP 
#translation rates
U_translation:
    U_mrna + {beta} ATP > U_mrna + U_protein
    translation_rate * U_mrna * ATP 
#degredation rates
U_mrna_deg:
    U_mrna > $pool
    mRNA_degradation_rate * U_mrna
#end basic gene parameters

# interactions with other genes:
U_activates_P:
    U_protein + P_basal_promoter > P_activated_promoter
    %s * U_protein * P_basal_promoter
U_unactivates_P:
    P_activated_promoter > U_protein + P_basal_promoter
    1 * P_activated_promoter
U_activates_T:
    U_protein + T_basal_promoter > T_activated_promoter
    %s * U_protein * T_basal_promoter
U_unactivates_T:
    T_activated_promoter > U_protein + T_basal_promoter
    1 * T_activated_promoter
U_activates_U:
    U_protein + U_basal_promoter > U_activated_promoter
    %s * U_protein * U_basal_promoter
U_unactivates_U:
    U_activated_promoter > U_protein + U_basal_promoter
    1 * U_activated_promoter
U_represses_V:
    U_protein + V_basal_promoter > V_repressed_promoter
    %s * U_protein * V_basal_promoter
U_unrepresses_V:
    V_repressed_promoter > U_protein + V_basal_promoter
    1 * V_repressed_promoter
U_represses_X:
    U_protein + X_basal_promoter > X_repressed_promoter
    %s * U_protein * X_basal_promoter
U_unrepresses_X:
    X_repressed_promoter > U_protein + X_basal_promoter
    1 * X_repressed_promoter
U_activates_Y:
    U_protein + Y_basal_promoter > Y_activated_promoter
    %s * U_protein * Y_basal_promoter
U_unactivates_Y:
    Y_activated_promoter > U_protein + Y_basal_promoter
    1 * Y_activated_promoter
U_represses_Z:
    U_protein + Z_basal_promoter > Z_repressed_promoter
    %s * U_protein * Z_basal_promoter
U_unrepresses_Z:
    Z_repressed_promoter > U_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for V
# transcription rates
V_activated_transcription:
    V_activated_promoter + {alpha} ATP > V_activated_promoter + V_mrna
    activated_transcription_rate * V_activated_promoter * ATP 
V_basal_transcription:
    V_basal_promoter + {alpha} ATP > V_basal_promoter + V_mrna
    basal_transcription_rate * V_basal_promoter * ATP 
V_repressed_transcription:
    V_repressed_promoter + {alpha} ATP > V_repressed_promoter + V_mrna
    repressed_transcription_rate * V_repressed_promoter * ATP 
# translation rates
V_translation:
    V_mrna + {beta} ATP > V_mrna + V_protein
    translation_rate * V_mrna * ATP 
# degredation rates
V_mrna_deg:
    V_mrna > $pool
    mRNA_degradation_rate * V_mrna
V_protein_deg:
    V_protein > $pool
    protein_degradation_rate * V_protein
# end basic gene parameters

# interactions with other genes:
V_activates_P:
    V_protein + P_basal_promoter > P_activated_promoter
    %s * V_protein * P_basal_promoter
V_unactivates_P:
    P_activated_promoter > V_protein + P_basal_promoter
    1 * P_activated_promoter
V_activates_T:
    V_protein + T_basal_promoter > T_activated_promoter
    %s * V_protein * T_basal_promoter
V_unactivates_T:
    T_activated_promoter > V_protein + T_basal_promoter
    1 * T_activated_promoter
V_represses_U:
    V_protein + U_basal_promoter > U_repressed_promoter
    %s * V_protein * U_basal_promoter
V_unrepresses_U:
    U_repressed_promoter > V_protein + U_basal_promoter
    1 * U_repressed_promoter
V_represses_V:
    V_protein + V_basal_promoter > V_repressed_promoter
    %s * V_protein * V_basal_promoter
V_unrepresses_V:
    V_repressed_promoter > V_protein + V_basal_promoter
    1 * V_repressed_promoter
V_activates_X:
    X_protein + X_basal_promoter > X_activated_promoter
    %s * X_protein * X_basal_promoter
V_unactivates_X:
    X_activated_promoter > X_protein + X_basal_promoter
    1 * X_activated_promoter
V_activates_Y:
    V_protein + Y_basal_promoter > Y_activated_promoter
    %s * V_protein * Y_basal_promoter
V_unactivates_Y:
    Y_activated_promoter > V_protein + Y_basal_promoter
    1 * Y_activated_promoter
V_activates_Z:
    V_protein + Z_basal_promoter > Z_activated_promoter
    %s * V_protein * Z_basal_promoter
V_unactivates_Z:
    Z_activated_promoter > V_protein + Z_basal_promoter
    1 * Z_activated_promoter
# end interactions with other genes

# basic gene parameters for Z
# transcription rates
Z_activated_transcription:
    Z_activated_promoter + {alpha} ATP > Z_activated_promoter + Z_mrna
    activated_transcription_rate * Z_activated_promoter * ATP 
Z_basal_transcription:
    Z_basal_promoter + {alpha} ATP > Z_basal_promoter + Z_mrna
    basal_transcription_rate * Z_basal_promoter * ATP 
Z_repressed_transcription:
    Z_repressed_promoter + {alpha} ATP > Z_repressed_promoter + Z_mrna
    repressed_transcription_rate * Z_repressed_promoter * ATP 
# translation rates
Z_translation:
    Z_mrna + {beta} ATP > Z_mrna + Z_protein
    translation_rate * V_mrna * ATP 
# degredation rates
Z_mrna_deg:
    Z_mrna > $pool
    mRNA_degradation_rate * Z_mrna
Z_protein_deg:
    Z_protein > $pool
    protein_degradation_rate * Z_protein
# end basic gene parameters

# interactions with other genes:
Z_activates_P:
    Z_protein + P_basal_promoter > P_activated_promoter
    %s * Z_protein * P_basal_promoter
Z_unactivates_P:
    P_activated_promoter > Z_protein + P_basal_promoter
    1 * P_activated_promoter
Z_represses_T:
    Z_protein + T_basal_promoter > T_repressed_promoter
    %s * Z_protein * T_basal_promoter
Z_unrepresses_T:
    T_repressed_promoter > Z_protein + T_basal_promoter
    1 * T_repressed_promoter
Z_activates_U:
    Z_protein + U_basal_promoter > U_activated_promoter
    %s * Z_protein * U_basal_promoter
Z_unactivates_U:
    U_activated_promoter > Z_protein + U_basal_promoter
    1 * U_activated_promoter
Z_represses_V:
    Z_protein + V_basal_promoter > V_repressed_promoter
    %s * Z_protein * V_basal_promoter
Z_unrepresses_V:
    V_repressed_promoter > Z_protein + V_basal_promoter
    1 * V_repressed_promoter
Z_activates_X:
    X_protein + X_basal_promoter > X_activated_promoter
    %s * X_protein * X_basal_promoter
Z_unactivates_X:
    X_activated_promoter > X_protein + X_basal_promoter
    1 * X_activated_promoter
Z_represses_Y:
    Z_protein + Y_basal_promoter > Y_repressed_promoter
    %s * Z_protein * Y_basal_promoter
Z_unrepresses_Y:
    Y_repressed_promoter > Z_protein + Y_basal_promoter
    1 * Y_repressed_promoter
Z_activates_Z:
    Z_protein + Z_basal_promoter > Z_activated_promoter
    %s * Z_protein * Z_basal_promoter
Z_unactivates_Z:
    Z_activated_promoter > Z_protein + Z_basal_promoter
    1 * Z_activated_promoter
# end interactions with other genes

# reactions for sensor gene T
# basic gene parameters for T
# transcription rates
T_activated_transcription:
    T_activated_promoter + {alpha} ATP > T_activated_promoter + T_mrna
    activated_transcription_rate * T_activated_promoter * ATP 
T_basal_transcription:
    T_basal_promoter + {alpha} ATP > T_basal_promoter + T_mrna
    basal_transcription_rate * T_basal_promoter * ATP 
T_repressed_transcription:
    T_repressed_promoter + {alpha} ATP > T_repressed_promoter + T_mrna
    repressed_transcription_rate * T_repressed_promoter * ATP 
# translation rates
T_translation:
    T_mrna + {beta} ATP > T_mrna + T_protein
    translation_rate * T_mrna * ATP 
# degredation rates
T_mrna_deg:
    T_mrna > $pool
    mRNA_degradation_rate * T_mrna
T_protein_deg:
    T_protein > $pool
    protein_degradation_rate * T_protein
Tstar_protein_deg:
    Tstar_protein > $pool
    protein_degradation_rate * Tstar_protein

# T special interactions
T_protein_activates_rich:
    T_protein + RichEnv > Tstar_protein + RichEnv
    T_activation_rate_rich * T_protein * RichEnv

T_protein_activates_poor:
    T_protein + PoorEnv > Tstar_protein + PoorEnv
    T_activation_rate_poor * T_protein * PoorEnv    

Tstar_protein_inactivates:
    Tstar_protein > T_protein
    T_deactivation_rate * Tstar_protein
# end basic gene parameters


# interactions with other genes:
Tstar_represses_P:
    Tstar_protein + P_basal_promoter > P_repressed_promoter
    %s * Tstar_protein * P_basal_promoter
Tstar_unrepresses_P:
    P_repressed_promoter > Tstar_protein + P_basal_promoter
    1 * P_repressed_promoter
Tstar_activates_T:
    Tstar_protein + T_basal_promoter > T_activated_promoter
    %s * Tstar_protein * T_basal_promoter
Tstar_unactivates_T:
    T_activated_promoter > Tstar_protein + T_basal_promoter
    1 * T_activated_promoter
Tstar_represses_U:
    Tstar_protein + U_basal_promoter > U_repressed_promoter
    %s * Tstar_protein * U_basal_promoter
Tstar_unrepresses_U:
    U_repressed_promoter > Tstar_protein + U_basal_promoter
    1 * U_repressed_promoter
Tstar_activates_V:
    Tstar_protein + V_basal_promoter > V_activated_promoter
    %s * Tstar_protein * V_basal_promoter
Tstar_unactivates_V:
    V_activated_promoter > Tstar_protein + V_basal_promoter
    1 * V_activated_promoter
Tstar_represses_X:
    Tstar_protein + X_basal_promoter > X_repressed_promoter
    %s * Tstar_protein * X_basal_promoter
Tstar_unrepresses_X:
    X_repressed_promoter > Tstar_protein + X_basal_promoter
    1 * X_repressed_promoter
Tstar_activates_Y:
    Tstar_protein + Y_basal_promoter > Y_activated_promoter
    %s * Tstar_protein * Y_basal_promoter
Tstar_unactivates_Y:
    Y_activated_promoter > Tstar_protein + Y_basal_promoter
    1 * Y_activated_promoter
Tstar_represses_Z:
    Tstar_protein + Z_basal_promoter > Z_repressed_promoter
    %s * Tstar_protein * Z_basal_promoter
Tstar_unrepresses_Z:
    Z_repressed_promoter > Tstar_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# basic gene parameters for "eating protein" P
# transcription rates
P_activated_transcription:
    P_activated_promoter + {delta} ATP > P_activated_promoter + P_mrna
    activated_transcription_rate * P_activated_promoter * ATP 
P_basal_transcription:
    P_basal_promoter + {delta} ATP > P_basal_promoter + P_mrna
    basal_transcription_rate * P_basal_promoter * ATP 
P_repressed_transcription:
    P_repressed_promoter + {delta} ATP > P_repressed_promoter + P_mrna
    repressed_transcription_rate * P_repressed_promoter * ATP 
# translation rates
P_translation:
    P_mrna + {zeta} ATP > P_mrna + P_protein
    translation_rate * P_mrna * ATP 
# degredation rates
P_mrna_deg:
    P_mrna > $pool
    mRNA_degradation_rate * P_mrna
P_protein_deg:
    P_protein > $pool
    protein_degradation_rate * P_protein
# end basic gene parameters

# P special interactions:
P_eats_sugar_rich:
    P_protein + RichEnv > RichEnv + P_protein + {gamma} ATP
    sugar_eating_rate_rich * P_protein * RichEnv

P_eats_sugar_poor:
    P_protein + PoorEnv > PoorEnv + P_protein + {gamma} ATP
    sugar_eating_rate_poor * P_protein * PoorEnv

# interactions with other genes:
P_represses_P:
    P_protein + P_basal_promoter > P_repressed_promoter
    %s * P_protein * P_basal_promoter
P_unrepresses_P:
    P_repressed_promoter > P_protein + P_basal_promoter
    1 * P_repressed_promoter
P_activates_T:
    P_protein + T_basal_promoter > T_activated_promoter
    %s * P_protein * T_basal_promoter
P_unactivates_T:
    T_activated_promoter > P_protein + T_basal_promoter
    1 * T_activated_promoter
P_represses_U:
    P_protein + U_basal_promoter > U_repressed_promoter
    %s * P_protein * U_basal_promoter
P_unrepresses_U:
    U_repressed_promoter > P_protein + U_basal_promoter
    1 * U_repressed_promoter
P_represses_V:
    P_protein + V_basal_promoter > V_repressed_promoter
    %s * P_protein * V_basal_promoter
P_unrepresses_V:
    V_repressed_promoter > P_protein + V_basal_promoter
    1 * V_repressed_promoter
P_activates_X:
    P_protein + X_basal_promoter > X_activated_promoter
    %s * P_protein * X_basal_promoter
P_unactivates_X:
    X_activated_promoter > P_protein + X_basal_promoter
    1 * X_activated_promoter
P_activates_Y:
    P_protein + Y_basal_promoter > Y_activated_promoter
    %s * P_protein * Y_basal_promoter
P_unactivates_Y:
    Y_activated_promoter > P_protein + Y_basal_promoter
    1 * Y_activated_promoter
P_represses_Z:
    P_protein + Z_basal_promoter > Z_repressed_promoter
    %s * P_protein * Z_basal_promoter
P_unrepresses_Z:
    Z_repressed_promoter > P_protein + Z_basal_promoter
    1 * Z_repressed_promoter
# end interactions with other genes

# Sugar interactions

#Sugar_enters_system_Rich:
#    RichEnv > S + RichEnv
#    sugar_entering_rate_rich*RichEnv

#Sugar_enters_system_Poor:
#    PoorEnv > S + PoorEnv
#    sugar_entering_rate_poor*PoorEnv

Rich_to_Poor:
    RichEnv > PoorEnv
    env_switch_rate*RichEnv

Poor_to_Rich:
    PoorEnv > RichEnv
    env_switch_rate*PoorEnv

#Sugar_leaves_system:
#    S > $pool
#    sugar_leaving_rate * S

# Global parameters
activated_transcription_rate = 0.099
basal_transcription_rate = 0.065
repressed_transcription_rate = 0.031
translation_rate = 0.055
protein_degradation_rate = 0.0006
mRNA_degradation_rate = 0.0023
#sugar_entering_rate_rich = 200
#sugar_entering_rate_poor = 2
#sugar_leaving_rate = 1
sugar_eating_rate_rich = 500
sugar_eating_rate_poor = 5
env_switch_rate = 0.1
#perhaps increase sugar eating rate?
T_activation_rate_rich = 100
T_activation_rate_poor = 1
T_deactivation_rate = 0.1


# total variable params:

# Initial conditions

X_basal_promoter = 1
X_activated_promoter = 0
X_repressed_promoter = 0

Y_basal_promoter = 1
Y_activated_promoter = 0
Y_repressed_promoter = 0

Z_basal_promoter = 1
Z_activated_promoter = 0
Z_repressed_promoter = 0

U_basal_promoter = 1
U_activated_promoter = 0
U_repressed_promoter = 0

V_basal_promoter = 1
V_activated_promoter = 0
V_repressed_promoter = 0

T_basal_promoter = 1
T_activated_promoter = 0
T_repressed_promoter = 0

P_basal_promoter = 1
P_activated_promoter = 0
P_repressed_promoter = 0

X_mrna = 0
X_protein = 0

Y_mrna = 0
Y_protein = 0

Z_mrna = 0
Z_protein = 0

U_mrna = 0
U_protein = 0

V_mrna = 0
V_protein = 0

T_mrna = 0
T_protein = 0
Tstar_protein = 0

P_mrna = 0
P_protein = 10

#S = 0
RichEnv=1
PoorEnv=0
ATP = 10000000

