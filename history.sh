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
   git commit -m "Fix problem 3: numeric permissions 640 on sensores.log"
   
   EX 4
   chmod u+x evaluation/kepler/runner.sh
   chmod o-w evaluation/kepler/ajustes.conf
   git add .
   git commit -m "Fix problem 4: permissions corrected"

  EX 5
  chmod u+s evaluation/kepler/runner.sh
  ls -l evaluation/kepler/runner.sh
  git add .
  git commit -m "Fix problem 5: SUID activated on runner.sh"

 EX 6
 mkdir /tmp/kepler_zone
 chmod +t /tmp/kepler_zone
 ls -ld /tmp/kepler_zone
 git add .
 git commit -m "Fix problem 6: sticky bit on /tmp/kepler_zone"