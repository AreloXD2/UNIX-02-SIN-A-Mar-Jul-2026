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
    # --- Classic text processing tools (BHB Ch.2) ---
    # These three are covered heavily in BHB Ch.2 as the main tools
    # for parsing and filtering text output from commands and files.
    # gawk: processes text field by field — BHB Ch.2 uses it to extract
    # specific columns from log files, like "awk '{print $1}' log.txt"
    # to pull out just the IP addresses.
    # sed: edits text streams — BHB Ch.2 uses it to find and replace
    # content inside files without opening them manually.
    # grep: filters lines that match a pattern — one of the most used
    # tools in the whole book for searching through command output.
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # --- Core Unix utilities ---
    # coreutils gives us the basic commands every bash script uses:
    # cat, ls, head, tail, sort, cut, tr — BHB Ch.1 uses most of these
    # constantly when navigating the filesystem and processing output.
    # procps gives us ps and kill for process management — BHB Ch.1
    # uses "ps -ef" to check running processes and background jobs.
    # jq does for JSON what grep/awk do for plain text — filters and
    # extracts data from JSON output directly in the terminal.
    # man-db gives us the "man" command. BHB Ch.1 teaches using
    # "man <command>" as the first step to understand any Linux tool.
    # The base Kali image strips it out to save space so we reinstall it.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    man-db \
    manpages \
    manpages-posix \
    \
     # --- Network and download utilities ---
    # curl and wget are used to download files from URLs directly in
    # the terminal. BHB Ch.3 uses both to grab tools from GitHub like
    # Gitjacker and LinEnum during the lab setup.
    # git lets us clone repositories — BHB Ch.3 starts the whole lab
    # setup with "git clone https://github.com/dolevf/Black-Hat-Bash".
    # git-lfs handles large binary files that don't fit well in normal git.
    # ca-certificates stores trusted SSL certificates so curl and wget
    # can connect to HTTPS sites without throwing security errors.
    # locales is needed to generate the Spanish locale we enable later.
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
     # --- Script linter and network scanners ---
    # shellcheck analyzes bash scripts and catches syntax errors before
    # you even run them. Think of it as the "-n" dry-run flag from
    # BHB Ch.1 ("bash -n script.sh") but way more detailed — it tells
    # you exactly what is wrong and why.
    shellcheck \
    \
    # nmap is the most famous port scanner in pentesting. BHB Ch.3
    # installs it as one of the main hacking tools for the lab and
    # Ch.4 uses it heavily for reconnaissance — it tells you which
    # ports are open and what services are running on a target.
    # masscan does the same but way faster — built for scanning
    # huge IP ranges in seconds instead of minutes.
    nmap \
    masscan \
    \
    # --- Packet capture and network tools ---
    # tcpdump captures network traffic directly from the terminal —
    # lets you see exactly what a script is sending over the wire,
    # useful for debugging and understanding how tools communicate.
    # tshark is the terminal version of Wireshark, same power but
    # usable inside a script or over SSH with no graphical interface
    # (BHB Ch.3 sets up tshark as part of the lab toolkit).
    tcpdump \
    tshark \
    \
    # netcat opens raw TCP/UDP connections — used in pentesting for
    # transferring files, testing ports and catching reverse shells.
    # socat is like netcat but more powerful, supports SSL and more.
    # dnsutils gives us dig and nslookup for querying DNS records.
    # iputils-ping gives us the ping command that BHB Ch.1 uses in
    # the "ping_with_arguments.sh" script example.
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
    # --- Anonymity and traffic routing tools ---
    # tor routes your traffic through multiple encrypted relays around
    # the world so the target never sees your real IP address.
    # torsocks wraps any command and forces its traffic through Tor —
    # for example "torsocks curl https://example.com" exits from a
    # Tor node instead of your machine.
    # proxychains4 chains multiple proxies together so traffic hops
    # through them in sequence before reaching the target (BHB Ch.3
    # includes these as part of the pentesting toolkit).
    # obfs4proxy disguises Tor traffic so it looks like normal HTTPS
    # to firewalls that try to block Tor connections.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # httpie is a friendlier alternative to curl for making HTTP requests.
    # Output is color-coded and easier to read — good for learning how
    # web requests and responses actually work under the hood.
    httpie \
    \
 # ----------------------------------------------------------------------------
 # [f] sed -i locale.gen && locale-gen — enabling the Spanish locale
 # ----------------------------------------------------------------------------
 # The locales package was installed above but Spanish is not active yet.
 # /etc/locale.gen is a text file where each locale is listed but disabled
 # with a "#" at the start of the line — just like bash comments (BHB Ch.1).
 # sed removes that "#" to uncomment the es_ES.UTF-8 line and activate it.
 # This is exactly what BHB Ch.2 teaches about sed — editing text streams
 # without opening the file manually: "sed 's/old/new/g' file".
 # locale-gen then compiles the locale files that programs read at runtime.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
 # ----------------------------------------------------------------------------
 # [g] apt-get clean && rm -rf /var/lib/apt/lists/* — cleanup
 # ----------------------------------------------------------------------------
 # After installing everything, apt leaves downloaded package files sitting
 # in /var/lib/apt/lists/ as cache — we don't need them anymore.
 # We delete them HERE inside the same RUN instruction and that's the key part:
 # if we did this in a separate RUN, Docker would have already saved a layer
 # WITH those files in it and the image size wouldn't shrink at all.
 # Doing it in the same RUN means that layer never had the cache files
 # to begin with (BHB Ch.3 — keeping image size small is important when
 # you are rebuilding the lab environment constantly).
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


# ----------------------------------------------------------------------------
# [h] SHELL — switching from sh to bash
# ----------------------------------------------------------------------------
# By default Docker runs RUN instructions using /bin/sh which is a minimal
# shell with limited features. We switch to bash because it supports more
# syntax like arrays, [[ ]], and other features we might need in later steps.
# BHB Ch.1 explains this difference — bash is a superset of sh, it has
# everything sh has plus a lot more on top.
# The "-c" flag tells bash to take the command from a string, which is
# how Docker internally passes commands to whatever shell is configured.
SHELL ["/bin/bash", "-c"]


# ----------------------------------------------------------------------------
# [i] WORKDIR — default working directory
# ----------------------------------------------------------------------------
# WORKDIR sets the folder where every following instruction runs from,
# and also where the terminal opens when you start the container.
# It's the same as running "cd /workspaces" at the start of every session
# — BHB Ch.1 uses "cd ~" constantly to navigate to the home directory
# before running scripts, this does the same thing but automatically.
# Codespaces mounts the repository files under /workspaces/<repo-name>
# so setting this here means your terminal starts right next to your code.
WORKDIR /workspaces

# ----------------------------------------------------------------------------
# [j] RUN git config && git lfs install — global git configuration
# ----------------------------------------------------------------------------
# These commands configure Git system-wide for every user in the container.
# "--system" means the settings apply to everyone, not just root.
#
# safe.directory '*' tells Git to trust any directory regardless of who
# owns it — Codespaces mounts the repo with a different owner than the
# container's root user, without this Git refuses to work and throws
# an "unsafe directory" error.
#
# init.defaultBranch main makes "git init" create a branch called "main"
# instead of the old default "master" — avoids deprecation warnings.
#
# pull.rebase false means "git pull" merges instead of rebasing —
# easier to understand for beginners, you get a merge commit instead
# of a rewritten history (BHB Ch.3 uses git clone and pull constantly
# to manage the lab repository).
#
# git lfs install registers Git Large File Storage hooks system-wide
# so the container can handle big binary files in repositories that use it.
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

