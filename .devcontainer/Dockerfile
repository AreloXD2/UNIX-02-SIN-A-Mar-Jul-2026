# ----------------------------------------------------------------------------
# [b] image / layer / cache
# ----------------------------------------------------------------------------
# Every instruction in this file creates a layer — think of it like stacking
# pancakes, each one sits on top of the previous one and you can't change
# the bottom ones without remaking everything above them.
# Docker saves each layer in cache, so the next time you build, if that line
# didn't change, Docker just reuses the cached version instead of running it again.
# That's why we put the base image and env vars at the top (they never change)
# and any custom stuff at the bottom (BHB Ch.3 — when setting up the lab,
# the book rebuilds containers constantly and layer caching is what keeps
# it from taking forever every single time).
# Bottom line: instruction order is not random, it directly affects
# how long builds take and how big the final image ends up being.


# ----------------------------------------------------------------------------
# [a] FROM — base image
# ----------------------------------------------------------------------------
# FROM tells Docker which base image to start from — instead of building
# a Linux system from zero, we grab Kali Linux which already comes with
# hundreds of pentesting tools ready to go (BHB Ch.3 uses Kali as the
# main machine for the entire hacking lab, that's exactly why we use it here).
# "kali-rolling" means the packages are always the latest versions, there's
# no fixed release like Ubuntu 22.04 — it just keeps rolling forward.
# The ":latest" tag makes sure we always pull the most recent snapshot of it.
FROM kalilinux/kali-rolling:latest



# ----------------------------------------------------------------------------
# [c] ENV — environment variables
# ----------------------------------------------------------------------------
# ENV sets permanent variables inside the container that any program can read
# at any time — same concept as the built-in bash variables like $SHELL or
# $PATH that BHB Ch.1 explains (you can check them with "echo ${SHELL}").
#
# DEBIAN_FRONTEND=noninteractive
#   tells apt not to ask any questions during package installation.
#   Without this, some packages would pause the build waiting for a keypress
#   that nobody is there to press.
#
# LANG=es_ES.UTF-8 / LC_ALL=es_ES.UTF-8
#   set the system language and character encoding to Spanish UTF-8.
#   UTF-8 is what makes accents, ñ and special characters display correctly.
#
# TERM=xterm-256color
#   tells programs the terminal supports 256 colors, so tools like
#   vim or nmap render with full color instead of plain black and white.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# [d] RUN debconf-set-selections — pre-answering Wireshark's install prompt
# ----------------------------------------------------------------------------
# When you install Wireshark/tshark, the installer stops and asks:
# "Should non-superusers be able to capture packets?" and waits for an answer.
# Inside a Docker build nobody is watching, so the build would hang forever.
# We fix this by injecting the answer "false" BEFORE the package is installed
# using debconf-set-selections — basically we pre-fill the form so it never asks.
# The "|" pipe sends the output of echo directly as input to debconf-set-selections
# (BHB Ch.1 covers pipes and redirection — stdout of one command becomes
# stdin of the next one).
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# [e] RUN apt-get update && apt-get install — installing all tools at once
# ----------------------------------------------------------------------------
# apt-get update refreshes the list of available packages from Kali's servers.
# Without this, apt might try to install outdated or nonexistent versions.
# apt-get install is the actual command that downloads and installs the packages.
# They are two separate steps but we always run update first (BHB Ch.3 does
# exactly this when setting up the lab: "apt update" then "apt upgrade").
#
# The "&&" means: only run the next command if the previous one succeeded.
# If update fails, install never starts — the build stops with a clear error.
# This is the same "&&" control operator from BHB Ch.1 (logical AND).
#
# "-y" automatically answers yes to every confirmation prompt.
# "--no-install-recommends" only installs what is strictly required,
# skipping optional extras — this keeps the image smaller.
#
# Everything is in ONE big RUN instead of many separate RUN instructions
# because each RUN creates a new layer (BHB Ch.3 — layer/cache concept).
# Fewer layers = smaller image = faster to download and run.
#
# The trailing "\" at the end of each line is just line continuation —
# it tells bash "this command keeps going on the next line" (BHB Ch.1).
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # --- Text editors and shells ---
    # neovim / vim: terminal-based text editors. BHB Ch.1 mentions that
    # during a pentest these may be the only editors available since
    # there is no graphical interface — you need to know at least one.
    neovim \
    vim \
    # zsh: an alternative shell to bash. Used here as the default
    # interactive shell (see CMD at the bottom). BHB Ch.1 explains
    # that Kali uses zsh by default and you have to switch to bash
    # manually with "exec bash" if you want bash features.
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.

RUN chsh -s /usr/bin/zsh root

RUN cat >> /root/.zshrc <<'EOF'

PROMPT='%F{cyan}[Ariel-Buitron☠️]%f %F{yellow}%1~%f %(?.%F{green}√.%F{red}X %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]

