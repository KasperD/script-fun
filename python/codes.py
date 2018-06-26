#!/usr/bin/python
import base64 # I forget why in the world I even added this module
import random
import MySQLdb

def UserInput():
    '''
    DESC: Collect input from user on length and the amount of codes to generate
    RX: User Input int(Length) & int(Amount)
    TX: List variable containing Length & Amount
    '''
    while True:
        try:
	    Length = int(raw_input("Please provide the length of code: "))
	    Amount = int(raw_input("Amount of codes needed: "))
	    break
	except:
	    print "Datatype invalid"
    return [Length, Amount]

def GenerateCode(Length):
    '''
    DESC: Generate a single code 
    RX: int(Length)
    TX: str(NewCode)
    '''
    LengthCount = 0
    CharList = ["a", "b", "c", "d", "e", "f", "g", "h", "j", "k", 
                "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", 
		"x", "y", "z", "0", "1", "2", "3", "4", "5", "6", 
	        "7", "8", "9"]
    NewCode = ""

    while (LengthCount < Length):
        if ( (LengthCount % 4) == 0) and (LengthCount != 0) and (LengthCount != Length):
            NewCode = NewCode + "-"
        NewCode = NewCode + random.choice(CharList)
        LengthCount += 1
    return NewCode

def MultiCode(Length, Amount):
    '''
    DESC: Create multiple codes and keep in a list
    RX: two variables int(Length) & int(Amount)
    TX: list varible CodeDB 
    '''

    AmountCnt = 0
    CodeDB = []
    while (AmountCnt < Amount):
        Code = GenerateCode(Length)
        DupCheck = DuplicateCheck(Code)
	CodeDB.append(Code)
        if (DupCheck == 1):
            print "Duplicate"
        else:
	    AmountCnt += 1
	AmountCnt += 1
    return CodeDB

def DuplicateCheck(Code):
    # TBD
    return 0
	
def AddtoDatabase(Code):
    '''
    DESC: Add a single code to a MySQL database. DB INFO
    RX: str(Code)
    TX: NULL
    '''

    db = MySQLdb.connect(host="host",
    user="user",
    passwd="password",
    db="Database")

    cur = db.cursor()

    SQL = str('INSERT INTO codes (code) VALUES ("' + Code + '")')
    cur.execute(SQL)
    db.commit()

    db.close()
    return

# Collect Code Information	
GetInfo = UserInput()
Length = GetInfo[0]
Amount = GetInfo[1]

Codes = MultiCode(Length, Amount)

for each in Codes:
    AddtoDatabase(each)
