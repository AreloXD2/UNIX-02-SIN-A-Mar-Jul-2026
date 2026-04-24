 1  git fetch upstream
    2  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    3  git push -u origin eval_p2_1_g2
    4  cd kepler/
    5  cd evaluation/kepler/
    6  mv docs registros
    7  mkdir plantillas
    8  git add .
    9  git commit -m "Fix problema 1: estructura de directorios corregida"
   10  mv sensores.log registros/
   11  mv ajustes.old ajustes.conf
   12  history
   13  git add .
   14  git commit -m "Fix problema 2: archivos movidos y renombrados"
   15  history
   16  chmod 600 evaluation/kepler/registros/sensores.log
   17  cd registros/
   18  ls -l
   19  chmod 640 evaluation/kepler/registros/sensores.log
   20  chmod 640 sensores.log 
   21  ls -l
   22  history
   23  git add .
   24  git commit -m "Fix problema 3: permisos numericos 640 en sensores.log"
   25  cd ../../..
   26  git add .
   27  git commit -m "Fix problem 3: numeric permissions 640 on sensores.log"
   28  git push
   29  chmod u+x evaluation/kepler/runner.sh
   30  ls -l evaluation/kepler/runner.sh
   31  chmod o-w evaluation/kepler/ajustes.conf
   32  ls -l evaluation/kepler/ajustes.conf 
   33  git add .
   34  git commit -m “Fix issue 4: symbolic links corrected”
   35  git commit -m "Fix problem 4 permissions corrected"
   36  git push
   37  chmod u+s evaluation/kepler/runner.sh
   38  ls -l evaluation/kepler/runner.sh
   39  git add .
   40  git commit -m "Fix problem 5: SUID activated on runner.sh"
   41  git push
   42  chmod +t /tmp/kepler_zone
   43  mkdir /tmp/kepler_zone
   44  chmod +t /tmp/kepler_zone
   45  ls -l /tmp/kepler_zone/
   46  ls -ld /tmp/kepler_zone
   47  git push
   48  gpg --full-generate-key
   49  gpg --encrypt --recipient vega@kepler.lab evaluation/kepler/registros/sensores.log
   50  git add .
   51  git commit -m "Fix problem 7: GPG key generated and sensores.log encrypted"
   52  git push
   53  cd evaluation/kepler/
   54  gpg --clearsign ajustes.conf
   55  gpg --verify runner.sh.sig runner.sh
   56  gpg --yes --detach-sign runner.sh
   57  cd ../..
   58  git add .
   59  git commit -m "Fix problem 8: GPG signatures corrected and created"
   60  git push
   61  history