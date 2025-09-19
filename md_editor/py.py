type = "fire"
elems = ["water", "fire", "grass"]
# First we find index of type
i = 0
while type != elems[i]:
	i += 1
print(f"Your type: {elems[i]} Weak: {elems[(i+1)%3]} Strong: {elems[(i-1)%3]}")