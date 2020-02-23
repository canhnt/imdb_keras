FROM tensorflow/tensorflow:1.15.2-py3 as dataset

COPY requirements.txt download-dataset.py /
RUN pip install -r requirements.txt && \
    python download-dataset.py

FROM tensorflow/tensorflow:1.15.2-py3 as base

COPY requirements.txt server.py predict.py sentiment2.model.h5 /app/
COPY --from=dataset /root/.keras/datasets/ /root/.keras/datasets/

WORKDIR /app

RUN pip install -r requirements.txt
EXPOSE 8080

CMD [ "python", "./server.py" ]
