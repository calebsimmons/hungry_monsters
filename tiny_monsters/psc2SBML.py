import os
import sys
import time

# Save current directory to find file
CWD = os.getcwd()

# Redirect stdout to hide PySCeS messages
s = sys.stdout
sys.stdout = open (os.devnull, 'w')

import pysces

def main ():

    # Check for file
    if len (sys.argv) < 2:
        s.write ("Error! Please supply a filename.\n")
        sys.exit (1)

    # Load model and convert to SBML
    m = pysces.model (sys.argv [1], dir=CWD)
    m.doLoad()
    sbml = pysces.interface.writeMod2SBML (m, getstrbuf=True).getvalue()

    # Output to 'model_' + current time + '.sbml'
    name = CWD + "/model_" + time.strftime ("%m%d%H%M%S") + ".sbml"
    out = open (name, 'w')
    out.write (sbml)
    out.flush ()
    out.close ()
    
    # Finished
    s.write ("Success! {} printed.\n".format (name))

if __name__ == "__main__":
    main()
