FROM python:3
WORKDIR /usr/src/app
MAINTAINER Óscar Lucas Leo 'oscarlucasleo124@gmail.com'
RUN apt-get install git && pip install --root-user-action=ignore --upgrade pip && pip install --root-user-action=ignore django mysqlclient
RUN git clone https://github.com/oscarlucas22/django_tutorial_docker /usr/src/app && mkdir static
ADD ./script.sh /usr/src/app/
RUN chmod +x /usr/src/app/script.sh
ENV ALLOWED_HOSTS=*
ENV HOST=mariadb
ENV USER=django
ENV PASSWD=django
ENV DB=django
ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@example.org
ENTRYPOINT ["/usr/src/app/script.sh"]
