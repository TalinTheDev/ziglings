# Use archlinux as a base image
FROM archlinux:base

# Update system
RUN pacman -Syu --noconfirm

# Install packages
RUN pacman -S --noconfirm --needed nvim git openssh fish yazi ripgrep fd unzip sudo base-devel

# Create a dev user
ARG USERNAME=talin
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN chsh -s /usr/bin/fish $USERNAME

# Install paru, delete local repo for cleanup, install nightly zig
RUN useradd -m -G wheel -s /bin/bash debug
RUN sed -Ei 's/^#\ (%wheel.*NOPASSWD.*)/\1/' /etc/sudoers
USER debug
WORKDIR /home/debug/
RUN git clone https://aur.archlinux.org/paru.git && cd paru \
  && makepkg -si --noconfirm && paru -S --noconfirm --needed zig-nightly-bin && cd .. && rm -rf paru

# Set up contianer
USER $USERNAME

# Ziglings
RUN mkdir $HOME/Projects -p && cd $HOME/Projects
RUN git clone https://codeberg.org/ziglings/exercises.git ziglings
