from flask import Flask, render_template, request
import os
import PyPDF2
import google.generativeai as genai

app = Flask(__name__)

os.environ["GEMINI_API_KEY"] = " "
genai.configure(api_key=os.environ["GEMINI_API_KEY"])

generation_config = {
    "temperature": 1,
    "top_p": 0.95,
    "top_k": 64,
    "max_output_tokens": 8192,
    "response_mime_type": "text/plain",
}

model = genai.GenerativeModel(
    model_name="gemini-1.5-flash",
    generation_config=generation_config,
)

def extract_text_from_pdf(pdf_path):
    text = ""
    with open(pdf_path, "rb") as f:
        reader = PyPDF2.PdfReader(f)
        for page_num in range(len(reader.pages)):
            page = reader.pages[page_num]
            text += page.extract_text()
    return text

conversation_history = {"user": "", "chatbot": ""}

@app.route('/')
def index():
    return render_template('index.html', conversation_history=conversation_history)

@app.route('/chat', methods=['POST'])
def chat():
    pdf_path = "java_tutorial.pdf"
    pdf_text = extract_text_from_pdf(pdf_path)

    chat_session = model.start_chat(
        history=[
            {
                "role": "user",
                "parts": [pdf_text],
            },
            {
                "role": "model",
                "parts": [
                    "Hi there! How can I help you today? \n",
                ],
            },
        ]
    )

    user_input = request.form['user_input']
    response = chat_session.send_message(user_input)

    formatted_response = response.text.replace('*', ' ').replace('\n', '\n')

    conversation_history["user"] = user_input
    conversation_history["chatbot"] = formatted_response
    return render_template('index.html', conversation_history=conversation_history)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)