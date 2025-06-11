# Use archlinux as a base image
FROM archlinux:base

# Update system
RUN pacman -Syu --noconfirm

# Install packages
RUN pacman -S --noconfirm --needed nvim git openssh fish yazi ripgrep fd unzip sudo base-devel npm
RUN pacman -S --noconfirm --needed cargo
RUN pacman -S --noconfirm --needed less

# Create a dev user
ARG USERNAME=talin
ARG HOME=/home/$USERNAME
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN chsh -s /usr/bin/fish $USERNAME

# Set up contianer
RUN chown $USER:$USER $HOME -R
USER $USERNAME
WORKDIR $HOME

# ZIG
SHELL ["/usr/bin/fish", "-c"]
RUN curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
RUN zvm i master && zvm use master
