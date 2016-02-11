#!/usr/bin/python

def CheckPrime(Num, PriArray):
    # Check current number against the list of known primes
    # and return True/False if number divdes evenly.
    PriCheck = []
    for each in PriArray:
        # Return False if number already in prime array
        # to stop duplicate insert into array
        if (Num == each):
            PriCheck.append(False)
            break
        # Return False if Number dives evenly amoung prime
        if (Num % each == 0):
            PriCheck.append(False)
            break
        # if not even then True
        else:
            PriCheck.append(True)
    return  PriCheck

def DefinePrime(PriCheck):
    # Check True/False Array 'PriCheck' for false returns
    # even one false in array returns false for all
    for each in PriCheck:
        if (each == False):
            return False
    return True

Num = 2 # Number to start count
PriArray = [2] # prebuilt known primes
Stop = 10240

while (Num <= Stop):
    PriCheck = CheckPrime(Num, PriArray)
    Prime = DefinePrime(PriCheck)
    if (Prime == True):
        PriArray.append(Num)
    Num = Num + 1

print "...Complete"
print PriArray
