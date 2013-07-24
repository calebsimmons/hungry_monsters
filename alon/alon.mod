# Models C1-FF1.
@model:2.4.1=Alon
@compartments
  default = 1

# Inital concentrations of reactants:
@species
# Signals  
  default:S_x = 1000
  default:S_y = 1000

# Proteins 
  default:X = 0
  default:X_a = 0
  default:Y = 0
  default:Y_a = 0
  default:Z = 0

# ATP 
  default:ATP_gained = 0
  default:ATP_spent = 0

@parameters
# Beta = Number of proteins produced per second.
# Alpha = Proteins degraded per second.
#
# From BioNumbers: 
# length:
# 1 Enzyme = 300 aa
# 
# transcription:
# ~15 aa/s
# 300 aa / 15 aa / s = 20 s/TF
# 
# translation:
# ~15 aa/s
# 300 aa / 15 aa / s = 20 s/TF
# 
# total:
# translation + transcription
# (20 s + 20 s) / Enzyme
# = 0.025 Enzyme / s
  Beta_Enz = 0.025
 
# protein half-life:
# 1 protein / 20 min
#
# degradation:
# alpha = ln (2) / half-life
# = 2.5e-4 protein / s
  Alpha_Enz = 0.00025


# From Alon:
# production time:
# 5 min = 300 s
# 
# = 0.0033 TF / s
  Beta_TF = 0.0033

# half-life:
# 60 min
#
# = 1.9e-4 TF / s
  Alpha_TF = 0.00019

# Activation thresholds determine when parent can activate child.
# These parameters will evolve.
  K_xy = 10
  K_yz = 10
  K_xz = 10

@reactions
# First, a signal S_x activates protein X. X_a is the actived X protein.
@r=production_X
  S_x -> X + S_x + ATP_spent
  Beta_TF

@r=activates_X
  X + S_x -> X_a
  X * gt(S_x, 1) * gt(X, 0)

@r=degradation_X
  X_a ->
  Alpha_TF * X_a

# Second, the activated TF binds to Y's promoter region to produce protein Y. In
# parallel, X_a binds to Z's promoter region. Y production can begin when X_a
# builds up past Y's activation threshold K_xy.
@r=production_Y 
  X_a -> Y + X_a + ATP_spent
  Beta_TF * gt(X_a, K_xy)

@r=degradation_Y
  Y_a ->
  Alpha_TF * Y_a

# Signal S_y must accumulate for Y to be activated. This results in a delay for
# production of Z.
@r=activates_Y
  Y + S_y -> Y_a
  Y * gt(S_y, 1) * gt(Y, 0)

# Production of Z begins when activated X and Y accumulate past a certain
# concentration. 
@r=production_Z 
  X_a + Y_a -> Z + X_a + Y_a + 10 ATP_spent
  Beta_Enz * gt(X_a, K_xz) * gt(Y_a, K_yz)

@r=degradation_Z
  Z -> 
  Alpha_Enz * Z

@r=production_ATP
  Z + S_x -> Z + ATP_gained
  gt(Z, 0) * gt(S_x, 0)
