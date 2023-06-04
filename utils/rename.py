import os

x = os.listdir("./music")
c = 1

for file in x:
    os.rename("./music/"+file,"./music/"+ (8-len(str(c)))*"0" + str(c) + ".mp3")
    c = c + 1