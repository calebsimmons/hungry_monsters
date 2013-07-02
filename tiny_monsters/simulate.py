import time
from chromosome import *

def main():
    
    # Simulate N chromosomes
    num_simulations = 1
    
    # Keep track of total sim. length
    start_time = time.time()

    # Set of simulated chromosomes
    data = list()
    C = [Chromosome(simulate=True) for x in range (num_simulations)]
    for chromosome in C:
       #fitness, serial, K = vars(chromosome).values()
        data.append(vars(chromosome).values())
         
    # Finish up
    end_time = time.time()


if __name__ == "__main__":
    main()
