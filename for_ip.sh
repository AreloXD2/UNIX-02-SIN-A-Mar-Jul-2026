#!/bin/bash
for ip_address in "$@"; do
ping -c 1 "$ip_address"
done

# IPs locales válidas para pruebas de red dentro de GitHub Codespaces:
# 127.0.0.1   -> Dirección de Loopback (Localhost de la máquina virtual)
# 10.0.10.88  -> IP privada interna asignada al entorno de desarrollo
# 172.17.0.1  -> Puerta de enlace (Gateway) de la red virtual de Docker