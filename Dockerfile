# Use an existing Docker image as a base
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Set the working directory in the container
WORKDIR /app

# Copy the FastAPI application code to the working directory
COPY ./app /app/
COPY ./main.py /app
COPY ./file_store /app
COPY ./Readme.md /app
COPY ./.env /app

# Set environment variables
ENV PYTHONPATH "${PYTHONPATH}:/app"

# Copy the requirements.txt file to the working directory
COPY ./requirements.txt /app

# Install any additional dependencies (if needed)
RUN pip install -r requirements.txt

# Command to run the FastAPI application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
