#=
# This is a Julia implementation of Ribbid Module one
=#

import Pkg; Pkg.add("Collections")
import Pkg; Pkg.add("Heaps")

using Collections
using Heaps

def get_interactions(post):
	\# Returns a list of the interactions for a post
	interactions = []
	for interaction in post["interactions"]:
		interactions.append((interaction["type"], interaction["value"]))
	return interactions

def get_ranking(post):
	\# Returns the ranking of a post
	interactions = get_interactions(post)
	ranking = Heaps.PriorityQueue()
	for type, value in interactions:
		ranking.push((-value, type))
	return ranking.items()

def main():
	\# Prints the ranking of a post
	post = {
		"id": 1,
		"interactions": [
				 {
				  "type": "like",
				  "value": 10
				  },
				 {
				  "type": "comment",
				  "value": 5
				  },
				 {
				  "type": "share",
				  "value": 2
				  },
				 ]
		}
	ranking = get_ranking(post)
	print(ranking)

if __name__ == "__main__":
	main()
	
