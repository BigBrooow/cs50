import sys

n = input("Number: ")

if (len(n) != 13) and (len(n) != 15) and (len(n) != 16):
    print("INVALID\n")
    sys.exit()

sum1 = 0
sum2 = 0
for i in range(len(str(n))-2, -1, -2):
    if int(str(n)[i]) < 5:
        sum1 += int(str(n)[i]) * 2
    else:
        sum1 += ((int(str(n)[i]) * 2) % 10) + 1

for i in range(len(str(n))-1, -1, -2):
    sum2 += int(str(n)[i])

sum = sum1 + sum2
if str(sum)[len(str(sum))-1] != "0":
    print("INVALID\n")
    sys.exit()
elif str(n)[0] == "4":
    print("VISA\n")
    sys.exit()
elif (str(n)[0] + str(n)[1] == "34") or (str(n)[0] + str(n)[1] == "37"):
    print("AMEX\n")
    sys.exit()
elif (str(n)[0] + str(n)[1] == "51") or (str(n)[0] + str(n)[1] == "52") or (str(n)[0] + str(n)[1] == "53") or (str(n)[0] + str(n)[1] == "54") or (str(n)[0] + str(n)[1] == "55"):
    print("MASTERCARD\n")
    sys.exit()
else:
    print("INVALID\n")
    sys.exit()
