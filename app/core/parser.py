import fitz, docx
from io import BytesIO

def extract_text_from_pdf(bytes_data):
    doc = fitz.open(stream=bytes_data, filetype="pdf")
    return "\n".join([page.get_text() for page in doc])

def extract_text_from_docx(bytes_data):
    file = BytesIO(bytes_data)
    doc = docx.Document(file)
    return "\n".join([para.text for para in doc.paragraphs])

def extract_course_info(filename, content):
    if filename.endswith(".pdf"):
        text = extract_text_from_pdf(content)
    elif filename.endswith(".docx"):
        text = extract_text_from_docx(content)
    else:
        return {"error": "Unsupported file type"}

    lines = text.split("\n")
    data = {"title": "", "code": "", "objectives": [], "materials": []}
    for line in lines:
        if "title" in line.lower(): data["title"] = line
        elif "code" in line.lower(): data["code"] = line
        elif "objective" in line.lower(): data["objectives"].append(line)
        elif "material" in line.lower() or "read" in line.lower(): data["materials"].append(line)
    return data