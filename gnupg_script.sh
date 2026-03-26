# === Bloque A — Preparación del entorno ===

uname -a # daba información del ordenador
which gpg # ubicación del binario de gpg
gpg --version # me da la versión e info adicional
gpg --full-generate-key # Genero llave publica y privada 
gpg --armor --export # Importar la llave publica a un archivo
gpg --list-keys # Listar las llaves
gpg --list-secret-keys --keyid-format=long # listar llave privada

# === Bloque B — Intercambio de llaves públicas ===

gpg --armor --export-secret-keys XXXXXXXX # Exportamos la llave privada
gpg --armor --export buitronariel23@gmail.com > mi_llave_publica.asc # exportar mi llave publica
gpg --import compa_llave_publica.asc #llave publica compa importación

# === Bloque C — Cifrado y descifrado ===

echo "este mensaje es secreto" > doc_no_cifrado.txt #mostramos el mensaje creado un archivo .txt
gpg --output doc_cifrado.txt --encrypt --recipient paulitagaby12@gmail.com doc_no_cifrado.txt # ciframos el mensaje de mi compañero usando el correo de mi compañera o tambien puede ser el hash
gpg --decrypt paula_doc_cifrado.text.txt #descargamos el archivo cifrado de nuestro compañero y lo desencriptamos con el comando y vemos el contenido del mensaje

# === Bloque D — Firma de documentos ===

# 1. Firma en texto claro
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt #Add clearsign signature to document
cat doc_no_cifrado_firmado.txt # verification of the created document
gpg --verify pau_doc_no_cifrado_firmado.text.txt #verification of my colleague's document
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt # Sign the document in binary 
