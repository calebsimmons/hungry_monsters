# simulate.py - Simulates and visualizes SBML-sh file.
import sys
import random
import os
import re
import time
import subprocess
import tempfile
import mod2sbml 
from string import Template

def get_data (f="out.csv", t="alon.template"):
    # Returns dictionary with key-series pairing.
    # E.g. data['time'] = [0.0, 1200.0, 2400.0, ...]
    data = dict()
    # Fill with data.
    csv = open (f, 'r').read().strip()
    lines = csv.split ('\n')
    titles = lines[0].split (',')
    # Create data's keys.
    for title in titles:
        data[title] = list()
    # Pluck data from each column.
    for line in lines[1:]:
        for i in range (line.count (',')):
            col = line.split (',')
            data [titles[i]].append (col[i])
    # Convert to float for matplotlib.
    for k, v in data.iteritems():
        data[k] = map (float, v)
    # Extract signal plot from template.
    template = open (t, 'r').read ().strip ()
    times = [0] + map (int, re.findall ("t > (\d*)", template))
    signal = map (int, re.findall ("S_x = (-?\d*)", template))
    signal = [0 if x == -1 else x for x in signal]
    z = zip (times, signal)
    zf = [tuple ([x[0], 0]) if x[1] == 1 else tuple ([x[0], 1]) for x in z]
    result = [None] * (len (z) * 2)
    result[::2] = zf
    result[1::2] = z
    times = [i[0] for i in result]
    signals = [i[1] for i in result]
    data ['sigt'] = times
    data ['sign'] = signals
    data ['signal'] = result
    return data


def simulate_model (param,t_1,t_2):
    #print "inside simulate_model"
    if param == None: 
        # Open SBML-shorthand file.
        sbml_sh_file = "alon.py"
        try:
            sbml_sh = open (sbml_sh_file, 'r').read()
        except:
            print "Error! Cannot open '{}'.".format (sbml_sh_file) 
            sys.exit (1)
    else:
        # Open template and substitute values
        sbml_template_file = "alon.template"
        try:
	    #t_1 = int(2567 + get_pulse_length(.80))
	    #t_2 = int(10267 + get_pulse_length(.80))
            sbml_template = open (sbml_template_file, 'r').read()
            sbml_sh = Template (sbml_template).substitute ({
                'K_xy': param[0],
                'K_xz': param[1],
                'K_yz': param[2],
		't_1' : t_1,
		't_2' : t_2
            })
        except:
            print "Error! Cannot open '{}'.".format (sbml_sh_file) 
            sys.exit (1)

    return simulate (sbml_sh)

def simulate (sbml_sh):
    #print "inside simulate.py"
    # Convert to SBML and save in temporary file.
    try:
        SBML = mod2sbml.parse (sbml_sh)
        temp = tempfile.NamedTemporaryFile(delete=False)
        temp.write (SBML)
        temp.flush()
    except:
        print "Error! Couldn't parse SBML-sh."
        sys.exit (1)

    #print " Run simulation."
    command = """
        simulateSBML -t {time} -s {steps} -l -m 3 {file_name}
    """.format (
        time=15400, 
        steps=1,  
        file_name=temp.name
        ).strip()
    subprocess.call (command.split (' '), stdout=open(os.devnull, 'w'))

    #print open ('out.csv').read()
    ATP = map (float, open ('out.csv').readlines()[-1].split (","))
    gained, spent = ATP [8], ATP [9]
    fitness = gained - spent
    
    return fitness

def get_time ():
    #print "inside get time"
    start = time.time()
    simulate_model ([0, 0, 0],2568,10268)
    end = time.time()
    return end - start

def get_pulse_length(p):
    if random.random() <= p:
	return random.gauss(100,10)
    else:
	return random.gauss(1000,100)



def main():
    # Call simulation.
    r = [0, 2, 4, 6, 8, 10]
    for i in r:
        for j in r:
            for k in r:
                print simulate_model ([i, j, k]), "[{} {} {}]".format(i, j, k)
    return
    for i in range (17):
        print simulate_model ([i, i, i]), "(%.2f)" % i
                    

if __name__ == "__main__":
    main()


