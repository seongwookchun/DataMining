# Treaky rock paper scissors
import random


print('Welcome to Treak RPC')

# setting of the games
n_game = 0
f_1 = 0
while f_1 < 1:
    n_game = int(input('How many games do you want to play Treak RPC?'))
    if type(n_game) != int or n_game == 0:
        print('input coreect number')
    else:
        print('Total', n_game, 'games has been set')
        input('Press any button')
        f_1 = 1     # flag on
l_score = []

def treakRPC():
    flag = 0
    f_trpc = 0
    
    d_rpc = {0:'Rock', 1:'Paper', 2:'Scissors'}
    d_player = {1:'Computer', 2:'User'}
    
    while flag < 1:
        # input rock, paper, scissors from both entities(computer and user)
        v_com = random.randint(0,2)
        
        f_vusr = 0
        while f_vusr < 1:
            v_usr = input('1. Rock, 2. Paper, 3. Scissors \n')
            try:
                v_usr = int(v_usr)
            except:
                print('input number only')
            if v_usr != 1 and v_usr != 2 and v_usr != 3:
                print(v_usr, 'is input correct value')
            else:
                
                v_usr -= 1     # to make the initial value of the v_usr start from 0
                f_vusr = 1
                print('Computer :', d_rpc[v_com])
                print('User     :', d_rpc[v_usr])
            
        # judgement
        delta = v_usr - v_com
        if delta == 0:     # a session ended in a draw
            print('Judge    : Draw !')
            if f_trpc != 0:
                result = d_player[f_trpc]
                print('The final winner of the game is', result)
                return result
        elif delta == 1 or delta == -2:     # a session ended with the user's win
            print('Judge    : User win')
            f_trpc = 2
        elif delta == -1 or delta == 2:     # a session ended with the computer's win
            print('Judge    : User lose~')
            f_trpc = 1
            
for i in range(n_game):
    print('Round', i+1, 'Start')
    l_score.append(treakRPC())
    input('Press any key to next round')
    
print('Winner of the games')
print(l_score)