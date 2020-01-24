import random

def minTournament(population, k, tournsize):
    selection = []
    for _ in range(k):
        players = random.sample(population, tournsize)
        selection.append(min(players))
    return selection[:]



if __name__ == "__main__":
    population = [(1 , [1,2,1,1]),(2 , [1,2,1,1]),
                (3 , [1,2,1,1]),(0 , [1,2,1,1]),
                (5 , [1,2,1,1]),(11 , [1,2,1,1]),(3 , [1,2,1,1]),
                (9 , [1,2,1,1]),(5 , [1,2,1,1]),(2 , [1,2,1,1]),
                (2 , [1,2,1,1]),(28 , [1,2,1,1]),(1 , [1,2,1,1]),
                (1 , [1,2,1,1]),(13 , [1,2,1,1]),(12 , [1,2,1,1])]
    
    selection = minTournament(population,k=8,tournsize=4)
    print(selection)
