from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Orders service is running!"}
