# Usa una imagen base oficial de Python (puedes elegir la versión que necesites)
FROM python:3.9-slim

# Establece el directorio de trabajo en la imagen
WORKDIR /app

# Copia el archivo de requerimientos y lo instala
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto en el que se ejecuta Flask (por defecto 5000)
EXPOSE 5000

# Configura las variables de entorno necesarias para Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Comando para iniciar la aplicación
CMD ["flask", "run"]