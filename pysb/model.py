from pysb import *
Model()

#Define Species(Monomers)
Monomer('RichEnv')
Monomer('PoorEnv')
Monomer('S')

#Define Parameters(Rate Constants)
Parameter('sugar_entering_rate_rich',6000)
Parameter('sugar_entering_rate_poor',60)
Parameter('env_switch_rate',1/30.0)
Parameter('sugar_leaving_rate',1)


#Define Reactions(Rules)
#Sugar Interactions
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
Parameter('RichEnv_0',0)
Parameter('PoorEnv_0',1)
Parameter('S_0',0)

Initial(RichEnv(),RichEnv_0)
Initial(PoorEnv(),PoorEnv_0)
Initial(S(),S_0)


#Define Observables
Observable('obsS',S())
Observable('obsRichEnv',RichEnv())
Observable('obsPoorEnv',PoorEnv())
