#!/usr/bin/env fish

# Install ZIG & ZLS (master) using ZVM
curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
zvm i --zls --full master
zvm use master
