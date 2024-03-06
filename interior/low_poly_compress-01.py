#python image convert to pico-8
#import matplotlib.image as mpimg
#import numpy as np
import sys
from math import *
from collections import Counter 
## Blender v2.72 (sub 0) OBJ File: 'small_block.blend'
## www.blender.org
#mtllib small_block.mtl
#o Cube
#v 2.560000 0.022037 -2.560000
#v 2.560000 0.022037 2.560000
#v -2.560000 0.022037 2.559999
#v -2.559999 0.022037 -2.560001
#v 4.000002 4.022038 -3.999998
#v 3.999998 4.022038 4.000002
#v -4.000001 4.022038 3.999999
#v -4.000000 4.022038 -4.000000
#v 2.560001 8.022038 -2.559999
#v 2.559999 8.022038 2.560002
#v -2.560001 8.022038 2.559999
#v -2.560000 8.022038 -2.560000
#g Cube_Cube_Material
#usemtl Material
#s off
#f 1 5 6
#f 5 9 10
#f 2 1 6
#f 7 8 4
#f 6 5 10
#f 9 12 10
#f 8 7 12
#f 3 7 4
#f 3 2 7
#f 2 6 7
#f 12 11 10
#f 7 11 12
#f 6 10 11
#f 7 6 11

def tohex(val, nbits):
	return hex((val + (1 << nbits)) % (1 << nbits))

# Index in this corresponds to Pico-8 pallete color value
rgb_arr = [
    [0, 0, 0],
    [29, 43, 83],
    [126, 37, 83],
    [0, 135, 81],
    [171, 82, 54],
    [95, 87, 79],
    [194, 195, 199],
    [255, 241, 232],
    [255, 0, 77],
    [255, 163, 0],
    [255, 236, 39],
    [0, 228, 54],
    [41, 173, 255],
    [131, 118, 156],
    [255, 119, 168],
    [255, 204, 170]
]

# Converts RGB value to the closest Pico-8 pallete value
def closest_color(r, g, b)->int:
	color_out = 0
	lowest_distance = 256**3  # lowest distance (set to high value at start)
	for i in range(len(rgb_arr)):
		crgb = rgb_arr[i]
		r2, g2, b2 = crgb[0], crgb[1], crgb[2]
		distance = sqrt((r2 - r)**2 + (g2 - g)**2 + (b2 - b)**2) # Pythagoras
		if distance < lowest_distance:
			color_out = i
			lowest_distance = distance
	return color_out

def main():
	print("Opening file")
	input_filename = sys.argv[1]
	#input_file = open(input_filename,'r')
	#print(input_filename.strip(".obj"))
	output_filename=input_filename.strip(".obj")+"_converted.txt"
	output_file = open(output_filename,'w')
	
	# Read until the firt vector
	with open(input_filename) as f:
		output_file.write('model_v="')
		vertex_colors = {} # stores colors for each vertice
		for vertice_index, line in enumerate(f):
			if(line[:1]=='v'):
				line=line.strip('v ')
				#print(line)
				#output_file.write('{')
				point_text=line.split(' ')
				# Go through x y z coordinate of vertice
				for i in range(0,3):
					num_text = point_text[i]
					# print("p: "+num_text)
					val=float(num_text)
					val=int(floor(val*256))
					hex_string=tohex(val, 16)
					hex_string=hex_string[2:]
					hex_string = hex_string.zfill(4)
					output_file.write(hex_string)
				# RGB
				if len(point_text)==6:
					r = float(point_text[3])*256
					g = float(point_text[4])*256
					b = float(point_text[5])*256
					c = closest_color(r, g, b)
					# print(c)
					vertex_colors[vertice_index]=c
				#output_file.write('},\n')
		output_file.write('"\n')
	
	# Faces
	with open(input_filename) as f:	
		output_file.write('model_f="')
		for line in f:
			if(line[:1]=='f'):
				line=line.strip('f ')
				#print(line)
				#output_file.write('{')
				point_text=line.split(' ')
				# for every tri in face
				for i in range(0,3):
					num_text = point_text[i]
					# print("p: "+num_text)
					val=int(num_text) # load vertiice number
					val=min(val,255) # ensure it fits bounds
					hex_string=tohex(val, 8)
					hex_string=hex_string[2:]
					hex_string=hex_string.zfill(2)
				
					output_file.write(hex_string) # write point
				# Get face color
				vert1 = int(point_text[0])
				vert2 = int(point_text[1])
				vert3 = int(point_text[2])
				try:
					c1 = int(vertex_colors[vert1])
					c2 = int(vertex_colors[vert2])
					c3 = int(vertex_colors[vert3])
					# Face color is the most common vertice color
					c_values = [c1, c2, c3]
					c_counter = Counter(c_values)
					c = c_counter.most_common(1)[0][0] # Set color of face to most common color
					# print(c)
				except:
					# print("Vertices not colored")
					c = int(0)
				hex_string=tohex(c, 8)
				hex_string=hex_string[2:]
				hex_string=hex_string.zfill(2)
				# print(hex_string)
				output_file.write(hex_string) # write color at every 4th index
				output_file.write(hex_string) # write color at every 5th index
					
				#output_file.write('},\n')
		output_file.write('"\n')
		print("\nConversion complete!\nSee output: " + output_filename)
	#input_file.close()
	output_file.close()

main()
	