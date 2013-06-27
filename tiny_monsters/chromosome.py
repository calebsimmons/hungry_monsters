import sys
sys.path.append("/usr/local/bin")
import stochpy,random,re,pysces
sys.path.append("/home/calebsimmons/Hungry_Monsters/tiny_monsters")
from psc_parser import *
from gill_alg import *
#import networkx as nx


class Chromosome(object):
    serial_no = 0
    #in units ATP
    mrna_cost = 2700
    enzyme_mrna_cost = mrna_cost
    protein_cost = 1560
    enzyme_cost = protein_cost
    sugar_benefit = 36
    num_params = 3
    
    def __init__(self,genotype=None):
        if genotype is None:
            self.genotype = [random.lognormvariate(0,1) for i in range(Chromosome.num_params)]
        else:
            self.genotype = genotype
        self.cached_fitness = None
        self.serial_no = Chromosome.serial_no
        Chromosome.serial_no += 1
        
    def fitness(self,verbose=True):
        time = 10
        if not self.cached_fitness is None:
            return self.cached_fitness
        with open("/home/calebsimmons/Hungry_Monsters/tiny_monsters/template.psc") as f:
            template = "".join(f.readlines())
            model = (template % tuple(self.genotype))\
                .replace("alpha",str(Chromosome.mrna_cost))\
                .replace("beta",str(Chromosome.protein_cost))\
                .replace("gamma",str(Chromosome.sugar_benefit))\
                .replace("delta",str(Chromosome.enzyme_mrna_cost))\
                .replace('zeta',str(Chromosome.enzyme_cost))
            filename = "/home/calebsimmons/Hungry_Monsters/tiny_monsters/model%s.psc" % self.serial_no
            with open(filename,'w') as f:
                f.write(model)
        while self.cached_fitness == None:
            try:
                mod = stochpy.SSA(Method="NextReactionMethod", File=filename,dir='.')
                mod.DoStochSim(epsilon=.01,mode="time",end=time)   
                atp_label = mod.data_stochsim.species_labels.index('ATP')
                self.cached_fitness = mod.data_stochsim.species[-1][atp_label]
            except:
                continue

        mod.PlotTimeSim(species2plot=["ATP",'P_protein'])
        #mod2 = Parser(filename)
        #atp_label2 = getATP(stochsimm(mod2.parse()))
        #self.cached_fitness2 = atp_label2[-1]
        #mod3 = pysces.model(filename,dir='.')
        #mod3.doSim(end = 1200 , points = 1000)
        #mod3.SimPlot(plot=["ATP",'S'])
        #self.cached_fitness3 = mod3.data_sim.getSimData("ATP")[-1][1]
        if verbose:
            print self.cached_fitness
        return self.cached_fitness
        
    def recombine(self,other):
        crossover_point = random.randrange(Chromosome.num_params)
        return Chromosome(self.genotype[:crossover_point] +
                          other.genotype[crossover_point:])

    def mutate(self,points=1):
        genotype = self.genotype
        for point in range(points):
            r = random.lognormvariate(0,1)
            genotype[random.randrange(Chromosome.num_params)] = r
        return Chromosome(genotype)
    
#    def visualize(self):
#        g = nx.MultiDiGraph()
#        nodes = ["U","V","X","Y","Z","T","P"]
#        for node in nodes:
#            g.add_node(node)
#        pos = nx.spring_layout(g)
#        # draw base nodes
#        nx.draw_networkx_nodes(g,pos,nodelist = nodes)
#        for node1 in nodes:
#            for node2 in nodes:
#                activation_rate = self.parse_model_file(node1 + "_activates_" + node2 +":")
#                repression_rate = self.parse_model_file(node1 + "_represses_" + node2 +":")
#                if activation_rate is None or repression_rate is None:
#                    continue
#                g.add_edge(node1,node2,color=activation_rate * 1)
#                nx.draw_networkx_edges(g,pos,edgelist = [(node1,node2)],
#                                       width=activation_rate * 1,
#                                       edge_color='green')
#                g.add_edge(node1,node2,color=repression_rate * 1)
#                nx.draw_networkx_edges(g,pos,edgelist = [(node1,node2)],
#                                       width=repression_rate * 1,
#                                       edge_color='red')
#        nx.draw_networkx_labels(g,pos,{label:label
#                                       for (label,data) in g.nodes(data=True)})
#
#    def parse_model_file(self,reaction_label):
#        with open("model%s.psc" % self.serial_no) as f:
#            lines = [line.strip() for line in f.readlines()]
#        try:
#            reaction_line_index = lines.index(reaction_label)
#        except:
#            return None
#        rate_line = lines[reaction_line_index + 2]
#        rate = re.search(r"(\d.\d*)",rate_line).group()
#        return float(rate)
        

print "loaded chromosome"

