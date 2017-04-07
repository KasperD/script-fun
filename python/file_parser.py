#!/usr/bin/python

def main():
    '''
    This is the main function. Main stuff done here =)
    '''
    Book = open("1984.txt","r")
    print Book
    
    goodtimes = []
    temp = []

    for line in Book:
        if line != "\n":
            line = line.replace('\n', '')
            goodtimes.append(line)

    for line in goodtimes:
        print goodtimes.index(line), line

if __name__ == '__main__':
    main()
