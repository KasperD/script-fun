#!/usr/bin/python

def main():
    '''
    Main function
    '''

    book = open("1984.txt", 'r') # Open the texfile as read-only
    bookarray = {} # Create empty directory

    for line in book:
        if line != '\n': # If the line is only a newline then don't bother
            line = line.replace("\n", "") #replace new lines
            for each in line.split(" "):
                # remove all special characters that show up and may be attached to a word
                # * I know I can do better but this is prettier and eaiser to read *
                each = each.replace(".", "")
                each = each.replace(";", "")
                each = each.replace("?", "")
                each = each.replace(";", "")
                each = each.replace(",", "")
                each = each.replace("'", "")
                each = each.replace("!", "")
                each = each.replace("-", "")
                each = each.replace("\"", "")
                each = each.replace(":", "")
                each = each.lower() #Force lowercase for all words
                if each in bookarray:
                    # create counter variable and update word count number
                    wordCounter = int(bookarray[each]) + 1
                    bookarray.update({each: wordCounter})
                else:
                    # Create brand new word entry
                    bookarray[each] = 1

    # Output all the fun from above to get word list with count
    for each in bookarray:
        print each, bookarray[each]

'''
Main function call
'''
if __name__ == '__main__':
    main()
