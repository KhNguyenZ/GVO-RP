import random

def generate_random_ipv4():
    return '.'.join(str(random.randint(0, 255)) for _ in range(4))
bandwith = 0
f=open('E:/Download/attack.log', 'w')
for i in range(1, 1572):
    if(i%random.randint(1, 10) == 0): bandwith+=1
    random_ipv4 = generate_random_ipv4()
    print(f"{i} | attack detection from {random_ipv4} , bandwith {bandwith}%", file=f)
f.close()