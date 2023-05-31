from sentence_transformers import SentenceTransformer
from flask import Flask, request, jsonify

app = Flask(__name__)


@app.post('/embeddings')
def get_embedding():
    print('embeddings')
    data = request.get_json()
    print(data)
    model = SentenceTransformer('sentence-transformers/all-MiniLM-L6-v2')

    text = data.get('text')
    embedding = model.encode(text)
    vector = embedding.tolist()
    response = {
        'embedding': vector
    }

    return jsonify(response)
