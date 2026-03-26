uname -a # daba información del ordenador
which gpg # ubicación del binario de gpg
gpg --version # me da la versión e info adicional
gpg --full-generate-key # Genero llave publica y privada 
gpg --armor --export # Importar la llave publica a un archivo
gpg --list-keys # Listar las llaves
gpg --list-secret-keys --keyid-format=long # listar llave privada
gpg --armor --export-secret-keys XXXXXXXX # Exportamos la llave privada
gpg --armor --export buitronariel23@gmail.com > mi_llave_publica.asc # exportar mi llave publica