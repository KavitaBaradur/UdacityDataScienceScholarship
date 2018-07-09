with open("camelot.txt") as song:
    print(song.read(2))
    print(song.read(8))
    print(song.read())
    print('Done with first part\n')

with open("camelot.txt") as f:
    for line in f:
        print(line)