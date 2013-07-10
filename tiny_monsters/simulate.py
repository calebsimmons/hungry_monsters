import time
from chromosome import *

def main():
    
    # Simulate N chromosomes
    num_simulations = 1
    
    # Keep track of total sim. length
    start_time = time.time()

    # Set of simulated chromosomes
    data = list()

    # Simulate
    g = GA()
    g.iterate()
         
    # Finish up
    end_time = time.time()


if __name__ == "__main__":
    main()
