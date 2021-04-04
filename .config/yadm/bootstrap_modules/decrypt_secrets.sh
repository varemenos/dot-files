#!/bin/bash

__log_debug "Do you want to decrypt secrets (y/n)?"
read -r answer


if [ "$answer" != "${answer#[Yy]}" ] ;then
  yadm decrypt
fi
