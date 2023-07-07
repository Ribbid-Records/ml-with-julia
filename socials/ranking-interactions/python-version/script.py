import collections
import heapq

def get_interactions(post):
	# """Return a list of the interactions for a post"""
	interactions = []
	for interaction in post["interactions"]:
		interactions.append((interaction["type"], interaction["value"]))
	return interactions

def get_ranking(post):
	# """Returns the ranking of a post"""
	interactions = get_interactions(post)
	ranking = []
	for type, value in interactions:
		heapq.heappush(ranking, (-value, type))
	return ranking

def main():
	# """Prints the ranking of a post"""
	post = {
		"id": 1,
		"interactions": [
				 {
				  "type": "like",
				  "value": 6
				  },
				 {
				  "type": "comment",
				  "value": 5
				  },
				 {
				  "type": "share",
				  "value": 9
				  }
				 ]
		}
	ranking = get_ranking(post)
	print(ranking)

if __name__ == "__main__":
	main()
