def generate_quiz(topics):
    return [{"question": f"Explain {topic}", "answer": f"(GPT answer)"} for topic in topics]

def evaluate(student, correct):
    correct_words = correct.split()
    matched = sum(1 for word in correct_words if word in student)
    return matched / len(correct_words)