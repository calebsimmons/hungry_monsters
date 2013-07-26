# gene.py - Runs genetic simulation.
import random
import math
import Queue
import threading
from simulate import simulate_model

# GA parameters
POP_SIZE    = 10
COPY_RATE   = 0.10
MUTATE_RATE = 0.01

def main ():
    
    avg_fitness = list()
    g = Gene()
    for i in range (10):
        avg_fitness.append(g.iterate())
    print '\n'.join (map (str, avg_fitness))

class Chromosome:
    def __init__ (self):
        # Parameters are: K_xy, K_xz, K_yz
        self.genotype = [random.randint (0, 15) for i in range (3)]
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
        chromosome = Chromosome()
        chromosome.genotype = child
        return chromosome
    def set_fitness (self, fitness):
        self.fitness = fitness

    def mutate (self):
        # Mutates a random gene by log-normal scaling.
        gene = random.choice (range (self.num_param))
        self.genotype[gene] *= random.lognormvariate (0, 1)

class SimulationThread(threading.Thread):
    def __init__ (self, population):
        threading.Thread.__init__(self)
        self.population = population

    def run (self):
        for c in self.population:
            c.set_fitness (simulate_model (c.genotype))


class Gene:
    def __init__ (self):
        self.population = [Chromosome() for i in range (POP_SIZE)]
    
    def iterate (self):
        # Set fitness for all chromosomes.
        self.simulate()
        # Select new chromosomes with SUS and FPS.
        self.selection()
        # Recombine chromosomes.
        self.crossover()

    def crossover (self):
        population = list()
        while len (population) < POP_SIZE:
            # Pick two parents.
            x = random.choice (self.population)
            y = random.choice (self.population)
            # Try to copy chromosome.
            if random.random() < COPY_RATE:
                c = x
            # Otherwise, let them mate. 
            else:
                c = x.recombine (y)
            # Mutate child.
            if random.random() < MUTATE_RATE:
                c.mutate()
            # Add it to next generation.
            population.append (c)
        self.population = population

    def simulate (self):
        # Split simulation into two threads 
        half = int (POP_SIZE / 2)
        t1 = SimulationThread (self.population[:half])
        t2 = SimulationThread (self.population[half:])
        t1.start()
        t2.start()
        t1.join()
        t2.join()
        
        # Merge the results.
        self.population = t1.population + t2.population  

    def threaded_simulate (self, thread):
        
        half = int (POP_SIZE / 2)
        start = 0 if thread == 1 else half
        end = start + half
        population = self.population [start:end]
        for c in population:
            print c.genotype
            c.set_fitness (simulate_model (c.genotype))
        self.population[start:end] = population

    def unthreaded_simulate (self):
        # Run population through simulation.
        for c in self.population:
            print c.genotype 
            c.set_fitness (simulate_model (c.genotype))

        #for c in sorted(self.population, key= lambda c: c.fitness):
        #    print "{: <12} {}".format (c.genotype, c.fitness)
        print ""

        
    def selection (self):
        # Pick chromosomes with probability proportional to fitness.
        total_fitness = sum ([c.fitness for c in self.population])
        total_fitness = float (total_fitness)
        new_pop = list()
        while len (new_pop) < POP_SIZE:
            cum = 0.0
            r = random.random()
            for c in self.population:
                cum += c.fitness / total_fitness 
                if r < cum:
                    new_pop.append (c)
                    break
            # Use stochastic universal sampling
            pointers = [-0.4, -0.2, +0.2, +0.4]
            pointers = [x % 1.0 for x in [r + y for y in pointers]]
            for p in pointers:
                cum = 0.0
                for c in self.population:
                    cum += c.fitness / total_fitness
                    if p < cum:
                        new_pop.append (c)
                        break
        new_pop = new_pop[:POP_SIZE]
        #for c in sorted(new_pop, key= lambda c: c.fitness):
        #    print "{: <12} {}".format (c.genotype, c.fitness)
        self.population = new_pop




        
if __name__ == "__main__":
    main()
