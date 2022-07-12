import csv
import sys


def main():

    if len(sys.argv) != 3:
        print("Usage: python dna.py *.csv *.txt")
        return

    database = []
    with open(sys.argv[1], 'r') as file:
        for i in csv.DictReader(file):
            database.append(i)

    with open(sys.argv[2], 'r') as file:
        sequence = file.read()

    longest = {}
    for i in list(database[0].keys())[1:]:
        longest[i] = longest_match(sequence, i)

    for p in database:
        match = 0
        for i in list(database[0].keys())[1:]:
            if int(p[i]) == longest[i]:
                match += 1
        if match == len(list(database[0].keys())[1:]):
            print(p["name"])
            return
    print("No match")

    return


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
