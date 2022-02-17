FROM docker.io/kalilinux/kali-bleeding-edge:latest
RUN apt-get update && apt-get install -y exploitdb file
