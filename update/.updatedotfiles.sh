#!/bin/bash

cd ~/.dotfiles/update/

op run -- git commit -am "update"
op run -- git push

