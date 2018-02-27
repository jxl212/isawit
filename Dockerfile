# [START dockerfile]
FROM python:3.6.4-jessie

# Install the fortunes binary from the debian repositories.
RUN apt-get update && apt-get install -y fortunes libffi-dev python-dev gunicorn

# Change the -p argument to use Python 2.7 if desired.
RUN virtualenv /env -p python3.6

# Set virtualenv environment variables. This is equivalent to running
# source /env/bin/activate.
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/

CMD python app.py & gunicorn -b :$PORT main:app
# [END dockerfile]
