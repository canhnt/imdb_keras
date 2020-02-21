FROM tensorflow/tensorflow:1.15.2-py3

COPY requirements.txt server.py predict.py sentiment2.model.h5 /app/

WORKDIR /app

RUN pip install -r requirements.txt
EXPOSE 8080

CMD [ "python", "./server.py" ]
