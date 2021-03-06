# basic gene parameters for X
# transcription rates
X_activated_transcription:
    X_activated_promoter > X_activated_promoter + X_mrna + {alpha} ATP_spent
    activated_transcription_rate * X_activated_promoter
X_basal_transcription:
    X_basal_promoter > X_basal_promoter + X_mrna + {alpha} ATP_spent
    basal_transcription_rate * X_basal_promoter
X_repressed_transcription:
    X_repressed_promoter > X_basal_promoter + X_mrna + {alpha} ATP_spent
    repressed_transcription_rate * X_repressed_promoter

# translation rates
X_translation:
    X_mrna > X_mrna + X_protein + {beta} ATP_spent
    translation_rate * X_mrna
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
# end interactions with other genes


# reactions for sensor gene T
# basic gene parameters for T
# transcription rates
T_activated_transcription:
    T_activated_promoter > T_activated_promoter + T_mrna + {alpha} ATP_spent
    activated_transcription_rate * T_activated_promoter
T_basal_transcription:
    T_basal_promoter > T_basal_promoter + T_mrna + {alpha} ATP_spent
    basal_transcription_rate * T_basal_promoter
T_repressed_transcription:
    T_repressed_promoter > T_repressed_promoter + T_mrna + {alpha} ATP_spent
    repressed_transcription_rate * T_repressed_promoter
# translation rates
T_translation:
    T_mrna > T_mrna + T_protein + {beta} ATP_spent
    translation_rate * T_mrna
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

T_protein_activates:
    T_protein + S > Tstar_protein + S
    T_activation_rate * T_protein * S 

Tstar_protein_inactivates:
    Tstar_protein > T_protein
    T_deactivation_rate * Tstar_protein
# end basic gene parameters


# interactions with other genes:
Tstar_activates_P:
    Tstar_protein + P_basal_promoter > P_activated_promoter
    %s * Tstar_protein * P_basal_promoter
Tstar_unactivates_P:
    P_activated_promoter > Tstar_protein + P_basal_promoter
    1 * P_activated_promoter
Tstar_activates_X:
    Tstar_protein + X_basal_promoter > X_activated_promoter
    %s * Tstar_protein * X_basal_promoter
Tstar_unactivates_X:
    X_activated_promoter > Tstar_protein + X_basal_promoter
    1 * X_activated_promoter
# end interactions with other genes

# basic gene parameters for "eating protein" P
# transcription rates
P_activated_transcription:
    P_activated_promoter > P_activated_promoter + P_mrna + {delta} ATP_spent
    activated_transcription_rate * P_activated_promoter
P_basal_transcription:
    P_basal_promoter > P_basal_promoter + P_mrna + {delta} ATP_spent
    basal_transcription_rate * P_basal_promoter
P_repressed_transcription:
    P_repressed_promoter > P_repressed_promoter + P_mrna + {delta} ATP_spent
    repressed_transcription_rate * P_repressed_promoter 

# translation rates
P_translation:
    P_mrna > P_mrna + P_protein + {zeta} ATP_spent
    translation_rate * P_mrna
# degredation rates
P_mrna_deg:
    P_mrna > $pool
    mRNA_degradation_rate * P_mrna
P_protein_deg:
    P_protein > $pool
    protein_degradation_rate * P_protein
# end basic gene parameters

# P special interactions:
P_eats_sugar:
    P_protein + S > P_protein + {gamma} ATP_gained
    sugar_eating_rate * P_protein * S

# interactions with other genes:
# end interactions with other genes

# Sugar interactions

Sugar_enters_system_Rich:
    RichEnv > {600} S + RichEnv
    sugar_entering_rate_rich*RichEnv

Sugar_enters_system_Poor:
    PoorEnv > {6} S + PoorEnv
    sugar_entering_rate_poor*PoorEnv

Rich_to_Poor:
    RichEnv > PoorEnv
    env_switch_rate*RichEnv

Poor_to_Rich:
    PoorEnv > RichEnv
    env_switch_rate*PoorEnv

Sugar_leaves_system:
    S > $pool
    sugar_leaving_rate * S

# Global parameters
activated_transcription_rate = 0.099
basal_transcription_rate = 0.065
repressed_transcription_rate = 0.031
translation_rate = 0.055
protein_degradation_rate = 0.0006
mRNA_degradation_rate = 0.0023
sugar_entering_rate_rich = 1
sugar_entering_rate_poor = 1
sugar_leaving_rate = 1
sugar_eating_rate = 25
#sugar_eating_rate_rich = 500
#sugar_eating_rate_poor = 5
env_switch_rate = 0.1
#perhaps increase sugar eating rate?
T_activation_rate = 100
T_deactivation_rate = 0.01


# total variable params:

# Initial conditions

X_basal_promoter = 1
X_activated_promoter = 0
X_repressed_promoter = 0

T_basal_promoter = 1
T_activated_promoter = 0
T_repressed_promoter = 0

P_basal_promoter = 1
P_activated_promoter = 0
P_repressed_promoter = 0

X_mrna = 0
X_protein = 1

T_mrna = 0
T_protein = 0
Tstar_protein = 0

P_mrna = 0
P_protein = 1

S = 100
RichEnv=1
PoorEnv=0
ATP_gained = 0
ATP_spent = 0
