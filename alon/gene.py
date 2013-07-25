# gene.py - Runs genetic simulation.
import random
import math
from simulate import simulate_model

# GA parameters
POP_SIZE = 10
COPY     = 0.10
MUTATE   = 0.01

def main ():
    
    g = Gene()
    g.iterate()

class Chromosome:
    def __init__ (self):
        # Parameters are: K_xy, K_xz, K_yz
        self.genotype = [random.randint (10, 20) for i in range (3)]
        self.num_param = len (self.genotype)

    def recombine (self, C):
        # Returns new set of parameters where each parameter has 50% of being
        # from a parent.
        child = list()
        for i in range (self.num_param):
            if random.random () > 0.50:
                child.append (self.genotype[i])
            else:
                child.append (C.genotype[i])
        return child
    
    def set_fitness (self, fitness):
        self.fitness = fitness


class Gene:
    def __init__ (self):
        self.population = [Chromosome() for i in range (POP_SIZE)]
    
    def iterate (self):
        # Run population through simulation.
        for c in self.population:
            c.set_fitness (simulate_model (c.genotype))
            print c.genotype, c.fitness

        # Pick chromosomes with probability proportional to fitness.
        total_fitness = sum ([c.fitness for c in self.population])
        total_fitness = float (total_fitness)
        new_pop = list()
        while len (new_pop) < POP_SIZE:
            cum = 0.0
            for c in self.population:
                cum += c.fitness / total_fitness 
                print cum
                if random.random() < cum:
                    new_pop.append (c)
                    break
        for c in new_pop:
            print c.fitness




        
if __name__ == "__main__":
    main()
