#animekaizoku search run.

import webbrowser


kaizokuURL='https://animekaizoku.com//?s=' #1
ytsURL="yts.com="                          #2


print("Please select a Service:")
print("1 - Anime",kaizokuURL)
print("2 - Movies",ytsURL)
print()
whichURL=input("Enter here: ")

if whichURL == "1" :
    print("Using animeKAizoku")
    urlStart= kaizokuURL
    fileName="anime.txt"

elif whichURL == "2" :
    print("Using yts")
    urlStart= ytsURL
    fileName="movies.txt"

try:
    file=open(fileName,"r")
except IOError:
    print("File not accessible, create a file named ",filename)


input("Press Enter to continue...")

for title in file:
    if len(title) > 1 :
        # print(animeName.replace(" ","+"))
        input("Press Enter to open "+title)
        searchUrl=(urlStart+title.replace(" ","+"))
        print(searchUrl)
        print('---------------------------------------------------------')
        #webbrowser.open_new_tab(searchUrl)
        

file.close()
