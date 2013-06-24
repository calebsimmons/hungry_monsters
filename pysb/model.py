from pysb import *
Model()

#Define Species(Monomers)
Monomer('X_activated_promoter')
Monomer('X_basal_promoter')
Monomer('X_repressed_promoter')
Monomer('X_mrna')
Monomer('X_protein')

Monomer('T_activated_promoter')
Monomer('T_basal_promoter')
Monomer('T_repressed_promoter')
Monomer('T_mrna')
Monomer('T_protien')
Monomer('Tstar_protein')

Monomer('P_activated_promoter')
Monomer('P_basal_promoter')
Monomer('P_repressed_promoter')
Monomer('P_mrna')
Monomer('P_protein')


Monomer('ATP')
Monomer('RichEnv')
Monomer('PoorEnv')
Monomer('S')

#Define Parameters(Rate Constants)
Parameter('sugar_entering_rate_rich',6000)
Parameter('sugar_entering_rate_poor',60)
Parameter('env_switch_rate',1/30.0)
Parameter('sugar_leaving_rate',1)
Parameter('activated_transcription_rate',0.099)
Parameter('basal_transcription_rate',0.065)
Parameter('repressed_transcription_rate',0.031)
Parameter('translation_rate',0.055)
Parameter('protein_degradation_rate',0.0006)
Parameter('mRNA_degradation_rate',0.0023)
Parameter('T_activation_rate',100)
Parameter('T_deactivation_rate',0.01)

#Define Reactions(Rules)








#Sugar Interactions
Rule('X_activated_transcription',
         X_activated_promoter() + ATP() >> X_activated_promoter() + X_mrna(),    
         activated_transcription_rate)



Rule('Sugar_enters_system_rich',
         RichEnv() >> S() + RichEnv(),
         sugar_entering_rate_rich)

Rule('Sugar_enters_system_poor',
         PoorEnv() >> S() + PoorEnv(),
         sugar_entering_rate_poor)

Rule('Rich2Poor',
         RichEnv() >> PoorEnv(),
         env_switch_rate)

Rule('Poor2Rich',
         PoorEnv() >> RichEnv(),
         env_switch_rate)

Rule('Sugar_leaves_system',
         S() >> None,
         sugar_leaving_rate)
     
#Define Initial Conditions
Parameter('X_basal_promoter_0',1)
Parameter('X_activated_promoter_0',0)
Parameter('X_repressed_promoter_0',0)
Parameter('X_mrna_0',0)
Paramerer('X_protein_0',0)

Parameter('T_basal_promoter_0',1)
Parameter('T_activated_promoter_0',0)
Parameter('T_repressed_promoter_0',0)
Parameter('T_mrna_0',0)
Paramerer('T_protein_0',0)
Parameter('Tstar_protein_0',0)

Parameter('P_basal_promoter_0',1)
Parameter('P_activated_promoter_0',0)
Parameter('P_repressed_promoter_0',0)
Parameter('P_mrna_0',0)
Paramerer('P_protein_0',10)

Parameter('RichEnv_0',0)
Parameter('PoorEnv_0',1)
Parameter('S_0',0)
Parameter('ATP_0',1000000)

Initial(X_basal_promoter(),X_basal_promoter_0)
Initial(X_activated_promoter(),X_activated_promoter_0)
Initial(X_repressed_promoter(),X_repressed_promoter_0)
Initial(X_mrna(),X_mrna_0)
Initial(X_protein(),X_protein_0)

Initial(T_basal_promoter(),T_basal_promoter_0)
Initial(T_activated_promoter(),T_activated_promoter_0)
Initial(T_repressed_promoter(),T_repressed_promoter_0)
Initial(T_mrna(),T_mrna_0)
Initial(T_protein(),T_protein_0)
Initial(Tstar_protein(),Tstar_protein_0)

Initial(P_basal_promoter(),P_basal_promoter_0)
Initial(P_activated_promoter(),P_activated_promoter_0)
Initial(P_repressed_promoter(),P_repressed_promoter_0)
Initial(P_mrna(),P_mrna_0)
Initial(P_protein(),P_protein_0)

Initial(RichEnv(),RichEnv_0)
Initial(PoorEnv(),PoorEnv_0)
Initial(S(),S_0)
Initial(ATP(),ATP_0)

#Define Observables
Observable('obsS',S())
Observable('obsRichEnv',RichEnv())
Observable('obsPoorEnv',PoorEnv())
Observable('obsATP',ATP())

Observable('obsX_activated_promoter',X_activated_promoter())
Observable('obsX_basal_promoter',X_basal_promoter())
Observable('obsX_repressed_promoter',X_repressed_promoter())
Observable('obsX_mrna',X_mrna())
Observable('obsX_protein',X_protein())

Observable('obsT_activated_promoter',T_activated_promoter())
Observable('obsT_basal_promoter',T_basal_promoter())
Observable('obsT_repressed_promoter',T_repressed_promoter())
Observable('obsT_mrna',T_mrna())
Observable('obsT_protein',T_protein())
Observable('obsTstar_protein',Tstar_protein())

Observable('obsP_activated_promoter',P_activated_promoter())
Observable('obsP_basal_promoter',P_basal_promoter())
Observable('obsP_repressed_promoter',P_repressed_promoter())
Observable('obsP_mrna',P_mrna())
Observable('obsP_protein',P_protein())
