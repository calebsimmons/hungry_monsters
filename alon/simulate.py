# simulate.py - Simulates and visualizes SBML-sh file.
import sys
import random
import os
import time
import subprocess
import tempfile
import mod2sbml 
from string import Template

def get_data (f="out.csv"):
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
    return data


def simulate_model (param=None):
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
            sbml_template = open (sbml_template_file, 'r').read()
            sbml_sh = Template (sbml_template).substitute ({
                'K_xy': param[0],
                'K_xz': param[1],
                'K_yz': param[2]
            })
        except:
            print "Error! Cannot open '{}'.".format (sbml_sh_file) 
            sys.exit (1)

    return simulate (sbml_sh)

def simulate (sbml_sh):

    # Convert to SBML and save in temporary file.
    try:
        SBML = mod2sbml.parse (sbml_sh)
        temp = tempfile.NamedTemporaryFile(delete=False)
        temp.write (SBML)
        temp.flush()
    except:
        print "Error! Couldn't parse SBML-sh."
        sys.exit (1)

    # Run simulation.
    command = """
        simulateSBML -t {time} -s {steps} -l -m 3 {file_name}
    """.format (
        time=7200, 
        steps=30,  
        file_name=temp.name
        ).strip()
    subprocess.call (command.split (' '), stdout=open(os.devnull, 'w'))

    # out.csv
    #print open ('out.csv').read()
    ATP = map (float, open ('out.csv').readlines()[-1].split (","))
    gained, spent = ATP [8], ATP [9]
    fitness = gained - spent
    
    # Return fitness.
    return fitness

def get_time ():
    start = time.time()
    simulate_model ([0, 0, 0])
    end = time.time()
    return end - start

def main():

    # Call simulation.
    print simulate_model ([5, 5, 5])
                    

if __name__ == "__main__":
    main()
