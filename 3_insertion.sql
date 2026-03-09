Provide the insertion queries used to populate the database, whose relational model is as follows:
[COPY YOUR RELATIONAL MODEL, INDICATE THE PRIMARY KEYS AFTER EACH RELATION]
Primary keys correspond to IDs, unless otherwise specified (when it is a composite attribute). Foreign keys are identified by # and have the same name as the primary keys to which they refer.
There must be: 15 rows for the Course and Teacher table, 30 rows for the Students table, each of whom takes at least one course, and at least 50 point allocations.
There are four houses, with the following characteristics:
- name: Algorindor, motto: “Code is our sword, logic our shield,” animal: owl
- name: Cyberclaw, motto: “We protect the secrets of the digital world,” animal: panther
- name: Forgepuff, motto: “We build the future, line by line,” animal: bear
- name: Syntherin, motto: “Data is our power,” animal: fox
 
Foreign keys must refer to existing primary keys: provide the lines starting with filling in the tables in which there are no foreign keys, then the tables in which the foreign keys refer to primary keys in tables that have already been filled in. 

The data must comply with the following validation constraints:
[COPY THE CONSTRAINTS WRITTEN IN SQL]

Make sure that the students' first and last names refer to various origins and are mixed. 

Provide the set in the form of an SQL script ready to be executed.
