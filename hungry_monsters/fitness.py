import sys
sys.path.append("/home/calebsimmons/Hungry_Monsters/hungry_monsters/data/sample")
from chromosome import *
import matplotlib.pyplot as plt
import numpy as np

def fitness(model):
        mod = stochpy.SSA(Method="NextReactionMethod", File=model,dir='/home/calebsimmons/Hungry_Monsters/hungry_monsters/data/sample')
        mod.DoStochSim(epsilon=.05,end=10000,trajectories=1)
        atp_label = mod.data_stochsim.species_labels.index('ATP')
        return mod.data_stochsim.species[-1][atp_label]



def histogram_fitness(l):
    hist, bins = np.histogram(l,bins = 40)
    width = 0.7*(bins[1]-bins[0])
    center = (bins[:-1]+bins[1:])/2
    plt.bar(center, hist, align = 'center', width = width)
    plt.show()

l = [fitness('/home/calebsimmons/Hungry_Monsters/hungry_monsters/data/sample/model48000') for i in range(140)]

w = [fitness('/home/calebsimmons/Hungry_Monsters/hungry_monsters/data/sample/model0') for i in range(140)]

print "loaded ..."
