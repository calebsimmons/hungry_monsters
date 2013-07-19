Creating a model:
---

The model is written in SBML-shorthand. Here is the [language specification](http://www.staff.ncl.ac.uk/d.j.wilkinson/software/sbml-sh/all.html).

For examle, to model the reaction `A > B` from the file `sample.mod`:

    @model:2.4.1=MyModel
    @compartments
     default=1
    @species
     default:A=1
     default:B=1
    @parameters
     kf=1
     kr=1
    @reactions
    @rr=reaction1
     A -> B
     kf*A-kr*B

Converting the model:
---
Convert the model to regular SBML with `mod2sbml.py`.

Converting `sample.mod` to `sample.xml` gives:

    <?xml version="1.0" encoding="UTF-8"?>
    <sbml xmlns="http://www.sbml.org/sbml/level2/version4" level="2" version="4">
      <model id="MyModel">
        <listOfCompartments>
          <compartment id="default" size="1"/>
        </listOfCompartments>
        <listOfSpecies>
          <species id="A" compartment="default" initialAmount="1"/>
          <species id="B" compartment="default" initialAmount="1"/>
        </listOfSpecies>
        <listOfParameters>
          <parameter id="kf" value="1"/>
          <parameter id="kr" value="1"/>
        </listOfParameters>
        <listOfReactions>
          <reaction id="reaction1" reversible="true">
            <listOfReactants>
              <speciesReference species="A" stoichiometry="1"/>
            </listOfReactants>
            <listOfProducts>
              <speciesReference species="B" stoichiometry="1"/>
            </listOfProducts>
            <kineticLaw>
              <math xmlns="http://www.w3.org/1998/Math/MathML">
                <apply>
                  <minus/>
                  <apply>
                    <times/>
                    <ci> kf </ci>
                    <ci> A </ci>
                  </apply>
                  <apply>
                    <times/>
                    <ci> kr </ci>
                    <ci> B </ci>
                  </apply>
                </apply>
              </math>
            </kineticLaw>
          </reaction>
        </listOfReactions>
      </model>
    </sbml>



Simulating the model:
---
Use the solver [LibSBMLSim](http://fun.bio.keio.ac.jp/software/libsbmlsim/) to run the simulation.

Running `simulateSBML sample.xml` returns:

    time,A,B,kf,kr,default
    0,1,1,1,1,1
    1,0.9999999999999999,0.9999999999999999,1,1,1
    2,0.9999999999999999,0.9999999999999999,1,1,1
    3,0.9999999999999999,0.9999999999999999,1,1,1
    4,0.9999999999999999,0.9999999999999999,1,1,1
    5,0.9999999999999999,0.9999999999999999,1,1,1
