from collections import Counter
import re

stop_words = set(["the", "and", "is", "of", "in", "to", "for"])

def analyze_papers(files_text):
    text = "\n".join([t.decode("utf-8") for t in files_text])
    words = re.findall(r'\w+', text.lower())
    keywords = [w for w in words if w not in stop_words and len(w) > 3]
    return Counter(keywords).most_common(10)