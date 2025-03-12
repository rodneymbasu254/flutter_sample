from fastapi import APIRouter, UploadFile, File, Form
from app.core.parser import extract_course_info
from app.core.study_plan import generate_study_plan
from app.core.quiz import generate_quiz, evaluate
from app.core.readiness import compute_readiness
from app.core.past_paper import analyze_papers

router = APIRouter()

@router.post("/upload-outline")
async def upload_outline(file: UploadFile = File(...)):
    content = await file.read()
    return extract_course_info(file.filename, content)

@router.post("/study-plan")
async def plan(topics: list[str] = Form(...)):
    return generate_study_plan(topics)

@router.post("/generate-quiz")
async def quiz(topics: list[str] = Form(...)):
    return generate_quiz(topics)

@router.post("/readiness-score")
async def readiness(student_answers: list[str] = Form(...), correct_answers: list[str] = Form(...)):
    return compute_readiness(student_answers, correct_answers)

@router.post("/analyze-pastpapers")
async def past_papers(files: list[UploadFile] = File(...)):
    texts = [await f.read() for f in files]
    return analyze_papers(texts)