# Models C1-FF1. Each '2.0' represents a placeholder to be filled in manually in
# SBML file.
@model:2.4.1=Alon
@compartments
  default = 1

# Inital concentrations of reactants:
@species
# Signals  
  default:S_x = 1000
  default:S_y = 1000

# Proteins 
  default:X = 100
  default:X_a = 0
  default:Y = 0
  default:Y_a = 0
  default:Z = 0

# ATP 
  default:S = 1000
  default:ATP_gained = 0
  default:ATP_spent = 0

@parameters
# Beta = Number of proteins produced per second.
# 
# length:
# 1 TF = 300 aa
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
# (20 s + 20 s) / TF
# 
# = 0.025 TF / s
  Beta_x = 0.025
  Beta_y = 0.025
  Beta_z = 0.025

# Rate for swift activation = 1 protein / s
  activation_rate = 1

# Activation thresholds determine when parent can activate child.
  K_xy = 10
  K_yz = 10
  K_xz = 10

@reactions
# First, a signal S_x activates protein X. X_a is the actived X protein.
@r=activates_X
  X + S_x -> X_a
  X * gt(S_x, 1) * gt(X, 0)

# Second, the activated TF binds to Y's promoter region to produce protein Y. In
# parallel, X_a binds to Z's promoter region. Y production can begin when X_a
# builds up past Y's activation threshold K_xy.
@r=production_Y 
  X_a -> Y + X_a + ATP_spent
  Beta_y * gt(X_a, K_xy)

# Signal S_y must accumulate for Y to be activated. This results in a delay for
# production of Z.
@r=activates_Y
  Y + S_y -> Y_a
  Y * gt(S_y, 1) * gt(Y, 0)

# Production of Z begins when activated X and Y accumulate past a certain
# concentration. 
@r=production_Z 
  X_a + Y_a -> Z + X_a + Y_a + 2 ATP_spent
  Beta_z * gt(X_a, K_xz) * gt(Y_a, K_yz)

@r=production_ATP
  Z + S -> Z + ATP_gained
  Z * gt(S, 0)
