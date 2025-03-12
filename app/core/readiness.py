def compute_readiness(student_answers, correct_answers):
    total = 0
    for student, correct in zip(student_answers, correct_answers):
        score = sum(1 for word in correct.split() if word in student)
        total += score / len(correct.split())
    avg = total / len(student_answers)
    return {"readiness_score": round(avg * 100, 2)}