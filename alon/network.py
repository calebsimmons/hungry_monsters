import string
import random


def f ():
    network = dict()
    n = random.randint (1, 5)
    p = random.random ()
    enzyme = 'Z'
    N = list(string.ascii_uppercase [:n] + enzyme)
    network = dict()
    for TF in N:
        if TF == enzyme:
            continue
        network [TF] = list()
        # "{}: ".format (TF), 
        for i in N:
            if i == TF:
                continue
            if random.random () < p:
                K = random.randint (0, 15)
                t = (i, K)
                network[TF].append (t)
                # "({}, {}={}),".format (i, "K_{}{}".format (TF.lower(), i.lower()), K),
                # "None,", 
        # "\n"
    return network

def render (d):
    N = d.keys()
    constants = {
        'TF_cost': '4 ATP_spent',
        'Beta_TF': '0.004',
        'Alpha_TF': '0.004',
        'S': 'S_x'
        }
    production = """
production_$n:
    $in -> $n + $in + $TF_cost
    $Beta_TF * $gt
    """.strip()
    activation = """
activation_$n:
    $n + $S -> ${n}_a
    $n * gt ($S, 0) * gt($n, 0)
    """.strip()
    unbinding = """
unbinding_$n:
    ${n}_a -> $n
    ${n}_a * lt ($S, 0) * gt (${n}_a, 0)
    """.strip()
    degradation = """
degradation_$n:
    $n ->
    $Alpha_TF * $n
    """.strip()
    reactions = [production, activation, unbinding, degradation]
    for n in N:
        param = {'$n': n} + constants
        for r in reactions:
            temp = string.Template (r)
            print temp.substitute (param)
        
def in_list(TF, d):
    
    r = list()    
    for k, v in d.iteritems():
        for i in v:
            if TF in i:
                r.append (k)
    return r

