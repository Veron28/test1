FROM python
# Здесь можно использовать разные образы, для более простого проекта на python
# FROM python:3.10.2-slim-buster

# скопируем файл с необходимыми библиотекми, которые хотим установить
COPY ./requirements.txt /root/requirements.txt

# обновим pip и установим библиотеки из requirements, --ignore-installed - переустановка пакетов, если они уже есть
RUN pip install --upgrade pip && \
    pip install --ignore-installed -r /root/requirements.txt

# создание рабочей директории
WORKDIR /root/docker_test1

# копирование всех файлов, которые не указаны в dockerignore в новую директорию
COPY . /root/docker_test1
EXPOSE 8080

# запуск скрипта, для нового проекта поставить train.py и сделать key_load_img: True в файле params.yaml
CMD ["python", "main.py"]