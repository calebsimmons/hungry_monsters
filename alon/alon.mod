# Models C1-FF1. Each '2.0' represents a placeholder to be filled in manually in
# SBML file.
@model:2.4.1=Alon
@compartments
    default = 1

# Inital concentrations of reactants:
@species
# Signals - 
    default:S_x = 1000
    default:S_y = 1000
# Proteins -
    default:X = 100
    default:X_a = 0
    default:Y = 0
    default:Y_a = 0
    default:Z = 0

@parameters
# Beta coefficients model how many proteins are produced per second.
    Beta_x = 1.0
    Beta_y = 1.0
    Beta_z = 1.0

# Activation thresholds determine when parent can activate child.
    K_xy = 10
    K_yz = 10
    K_xz = 10

@reactions
# First, a signal S_x activates protein X. X_a is the actived X protein.
@r=activates_X
    X + S_x -> X_a + S_x
    Beta_x * X * gt(S_x, 0)

# Second, the activated TF binds to Y's promoter region to produce protein Y. In
# parallel, X_a binds to Z's promoter region. Y production can begin when X_a
# builds up past Y's activation threshold K_xy.
@r=production_Y 
    X_a -> Y + X_a 
    Beta_y * gt(X_a, K_xy)

# Signal S_y must accumulate for Y to be activated. This results in a delay for
# production of Z.
@r=activates_Y
    Y + S_y -> Y_a + S_y
    Beta_y * Y * gt(S_y, 0)

# Production of Z begins when activated X and Y accumulate past a certain
# concentration. 
@r=activates_Z 
    X_a + Y_a -> Z + X_a + Y_a
    Beta_z * gt(X_a, K_xz) * gt(Y_a, K_yz) * X_a

