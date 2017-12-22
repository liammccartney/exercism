import re

def word_count(phrase):
    word_freq = {}

    for word in re.findall(r"[\w']+", phrase):
        clean_word = sanitize_word(word)
        if word_freq.get(clean_word):
            word_freq[clean_word] += 1
        else:
            word_freq[clean_word] = 1
    return word_freq

def sanitize_word(word):
    return ''.join([l for l in word if l.isalnum() or l == '\'']).lower()
