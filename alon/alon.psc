# Models C1-FF1. Each '2.0' represents a placeholder to be filled in manually in
# SBML file.

# First, a signal S_x activates protein X. X_a is the actived X protein.
activates_X: 
    X + S_x > X_a + S_x
    Beta_x

# Second, the activated TF binds to Y's promoter region to produce protein Y. In
# parallel, X_a binds to Z's promoter region. Y production can begin when X_a
# builds up past Y's activation threshold K_xy.
production_Y: 
    X_a > Y + X_a 
    Beta_y * 2.0

# Signal S_y must accumulate for Y to be activated. This results in a delay for
# production of Z.
activates_Y: 
    Y + S_y > Y_a + S_y
    Beta_y 

# Production of Z begins when activated X and Y accumulate past a certain
# concentration. 
activates_Z: 
    X_a + Y_a > Z + X_a + Y_a
    Beta_z * 2.0 * 2.0


# Inital concentrations of reactants:

# - Signals
S_x = 1000
S_y = 1000

# - Proteins
X = 100
X_a = 0
Y = 0
Y_a = 0
Z = 0

# Beta coefficients model how many proteins are produced per second.
Beta_x = 1.0
Beta_y = 1.0
Beta_z = 1.0

# Activation thresholds determine when parent can activate child.
K_xy = 10
K_yz = 10
K_xz = 10
