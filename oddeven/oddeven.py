import random as rnd

#ee eo oe oo
#tell put
players=[[0,0],[0,0],[0,0],[0,0]]

n_games=500000

def is_even(n):
    return (n/2)*2==n

for i in range(0,n_games):
    A=rnd.randint(1,5)
    B=rnd.randint(1,5)
    even_wins=is_even(A+B)

    if is_even(A):
        players[0][1]+=1
        players[1][1]+=1
        if even_wins:
            players[0][0]+=1
        else:
            players[1][0]+=1
    else:
        players[2][1]+=1
        players[3][1]+=1
        if not(even_wins):
            players[3][0]+=1
        else:
            players[2][0]+=1

print players

print 'tell ','even ','play ','even ', float(players[0][0])/players[0][1]
print 'tell ','even ','play ','odd ', float(players[1][0])/players[1][1]
print 'tell ','odd ','play ','even ', float(players[2][0])/players[2][1]
print 'tell ','odd ','play ','odd ', float(players[3][0])/players[3][1]
