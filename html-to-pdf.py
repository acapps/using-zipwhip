import pdfkit
import os
import sys

filename = sys.argv[1]

pdfkit.from_file(os.getcwd() + '/html/' + filename, os.getcwd() + '/pdf/' + filename.rsplit( ".", 1 )[ 0 ] + '.pdf')
