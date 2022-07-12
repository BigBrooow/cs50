from cs50 import get_string


def count_letters(t):
    letters = 0
    for i in t:
        if i.isalpha():
            letters += 1
    return letters


def count_words(t):
    words = 1
    for i in t:
        if i == " ":
            words += 1
    return words


def count_sentences(t):
    sentences = 0
    for i in t:
        if i == "." or i == "!" or i == "?":
            sentences += 1
    return sentences


t = get_string("Text: ")
L = 100.0 * count_letters(t)/count_words(t)
S = 100.0 * count_sentences(t)/count_words(t)
index = int(round(0.0588 * L - 0.296 * S - 15.8))

if index < 1:
    print("Before Grade 1")
elif index >= 16:
    print("Grade 16+")
else:
    print("Grade", index)
