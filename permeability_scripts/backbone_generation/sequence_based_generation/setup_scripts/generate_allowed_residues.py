#!/usr/bin/python
import sys
import os
import re

###############################

if len(sys.argv) <=1 or sys.argv[1] == '-h':
    print ('\nUSAGE: %s <string> <jobname>'%sys.argv[0])
    print ('\nThis script will take in an input string of one lettr code and output a file for allowed residues for simple_cycpep_predict design')
    exit()

string = sys.argv[1]
proline_positions = []
with open('allowed_res.txt', 'w+') as outfile:
    outfile.write('DEFAULT GLY ALA DALA SER DSER THR DTHR CYS DCYS VAL DVAL LEU DLEU ILE DILE MET DMET PHE DPHE TYR DTYR TRP DTRP ASP DASP GLU DGLU ASN DASN GLN DGLN HIS DHIS LYS DLYS ARG DARG')
    for character in range(0, len(string)):
        if string[character] == 'P':
            outfile.write('\n%s PRO DPRO ' % str(character+1) )
            proline_positions.append( str(character+1) )
with open('seq.txt', 'w+') as outfile:
    for character in range(0,len(string)):
        if string[character] == 'P':
            outfile.write('PRO')
        elif string[character] == 'D':
            outfile.write('DPRO')
        elif string[character] == 'X':
            outfile.write('GLY')
        if character < (len(string)-1):
            outfile.write(' ')
if len(proline_positions) > 0 :
    lastline='-cyclic_peptide:rama_sampling_table_by_res '
    for thing in proline_positions:
        lastline += '%s flat_symm_pro_ramatable ' % thing
    with open ('../%s.flags' % (sys.argv[2]), 'a') as openfile:
        openfile.write(lastline)
