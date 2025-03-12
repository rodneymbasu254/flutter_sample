from openai import OpenAI

openai = OpenAI(api_key="your-api-key")

def generate_study_plan(topics):
    prompt = f"Create a weekly study plan based on the following topics: {', '.join(topics)}"
    response = openai.chat.completions.create(
        model="gpt-4",
        messages=[{"role": "user", "content": prompt}]
    )
    return response.choices[0].message.content