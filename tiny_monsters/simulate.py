import time
import os
import sys

# Turn off stdout
out = sys.stdout
if "--print" not in sys.argv:
    sys.stdout = open (os.devnull, 'w')

from chromosome import Chromosome
from ga import GA

def main():
    
    # Simulate N chromosomes
    num_generations = 5
    
    # Keep track of total sim. length
    start_time = time.time()

    # Set of simulated chromosomes
    data = list()

    # Save inital state:
    initial_state = {
        'alpha': Chromosome.mrna_cost,
        'beta': Chromosome.protein_cost,
        'gamma': Chromosome.sugar_benefit,
        'delta': Chromosome.enzyme_mrna_cost,
        'zeta': Chromosome.enzyme_cost
        }
    
    # Simulate
    g = GA(pop_size=10)
    out.write("started\n")
    out.flush()
    generation = [[c.fitness(), c.genotype] for c in g.get_population()]
    data.append (generation)
    out.write (str(generation) + '\n')
    for i in range(num_generations):
        g.iterate(iterations=1)
        generation = [[c.fitness(), c.genotype] for c in g.get_population()]
        data.append (generation)
        out.write(str(generation) + '\n')
        
         
    # Turn on stdout
    sys.stdout = out
    for k, v in initial_state.iteritems():
        print k, v
    print '\n'.join (map(str, data))
    
    # Finish up
    end_time = time.time()

    # Save to log
    filename = 'model_' + time.strftime('%m%d%H%M%S') + '.log'



if __name__ == "__main__":
    main()
