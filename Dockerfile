# [START dockerfile]
FROM python:3.6.4-jessie

# Install the fortunes binary from the debian repositories.
RUN apt-get update && apt-get install -y fortunes libffi-dev python-dev gunicorn
RUN pip install virtualenv

# Change the -p argument to use Python 2.7 if desired.
RUN virtualenv /env -p python3.6

# Set virtualenv environment variables. This is equivalent to running
# source /env/bin/activate.
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH

ADD . /app/

RUN pip install -r /app/requirements.txt

CMD python3 app.py & gunicorn -b :$PORT main:app
# [END dockerfile]
