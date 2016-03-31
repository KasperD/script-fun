#!/usr/bin/python
'''
General Script to encode characters in a simple cypher 
'''

def GetData():

    userInput = raw_input("Enter a phrase to encode: ")
    userInput = str(userInput.lower())
    return userInput

def ConvertData(userInput, char, code):
    '''
    Function to convert data string to encode the data
    '''

    converted = ""

    for c in userInput:
        if c in char:
            for i, v in enumerate(char):
                if ( c == v):
                    converted = converted + str(code[i])
        else:
            converted = converted + "(" + c + ")"
    return converted

def buildCode(char):
    '''
    Function to build the alpha/num code based off the list number from
    char variable that is passed.
    '''
    code = []
    for i ,v in enumerate(char):
        newvalue = i + 100
        code.append(newvalue)
    return code



char = [ 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', ' ' ]
code = buildCode(char)

userInput = GetData()
encode = ConvertData(userInput, char, code)
print encode
