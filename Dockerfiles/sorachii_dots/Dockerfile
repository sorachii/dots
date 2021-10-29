FROM ubuntu:latest

ENV TZ=Europe/Stockholm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt install -y \
    git zsh tmux python3-pip python3-venv ripgrep curl universal-ctags nodejs npm \
    ncurses-base ncurses-bin \
    ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/sorachii/dots.git /root/git/dots && \
    cd /root/git/dots && \
    git --git-dir=/root/git/dots/.git --work-tree=/root checkout -f

RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

RUN curl 'https://sh.rustup.rs' -sSf | sh -s -- -y  && \
    eval $(zsh) && \
    echo 'source /root/.cargo/env' >> /root/.zshenv

RUN git clone https://github.com/neovim/neovim.git /root/git/neovim && \
    cd /root/git/neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install && \
    nvim --headless +PackerSync +qa

RUN chsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
ARG TERM
ENV TERM ${TERM}
RUN SHELL=/bin/zsh zsh -i -c -- 'zinit module build; @zinit-scheduler burst || true '

WORKDIR /root

CMD ["/bin/zsh"]
