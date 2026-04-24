 FORK
    git fetch upstream
    git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    git push -u origin eval_p2_1_g2

    EX 1
    4  cd evaluation/kepler/
    mv docs registros
    mkdir plantillas
    git add .
    git commit -m "Fix problema 1: estructura de directorios corregida"

    EX 2
   mv sensores.log registros/
   mv ajustes.old ajustes.conf
   git add .
   git commit -m "Fix problema 2: archivos movidos y renombrados"
   
   EX 3
   cd registros/
   ls -l
   chmod 640 sensores.log
   ls -l
   git add .
   git commit -m "Fix problema 3: permisos numericos 640 en sensores.log"