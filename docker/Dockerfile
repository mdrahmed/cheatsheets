FROM raihan019/32bit-ubuntu:v1.1 

# Update package list and install auditd
# RUN export PATH='$PATH:/root/custom-audit/bin:/root/custom-audit/sbin' # This path will not present after building the image
RUN apt-get update && apt-get install -y auditd

# Start auditd (this will start the service when the container starts)
CMD ["auditd", "-n"]




##FROM nixos/nix:latest
#FROM ubuntu
#MAINTAINER raihan <raihan@somewhere.net>
#
## update pkgs
#RUN apt update; apt dist-upgrade -y
#
## install pkgs
#RUN apt install -y vim net-tools iproute2


