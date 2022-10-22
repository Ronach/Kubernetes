# This file needs to be in the src file when built
FROM python:3.7.15-alpine3.16

# Les commandes suivant seront exécutées depuis le dossier /app
WORKDIR /app

# On copie tous les fichiers dans /app
COPY . /app

# gestionnaire de paquet dans alpine = apk
# "apk --update-cache add" exists mais laisse le cache et alourdit l'image
# As of Alpine Linux 3.3 : --no-cache allows users to install packages with an index that is updated and used on-the-fly and not cached locally ==> less heavy et évite de rajouter rm -rf /var/cache/apk/*
RUN pip3 install -r requirements.txt 
    
# Command executed in the container. "-u" to clear the stdin buffer and make sure everything's correct
# On overwrite ici la commande de base de l'image 
CMD ["python3", "-u", "app.py"]