#!/bin/sh

B='#00000000'  # blank
D='#FFFFFF30'  # default
T='#FFFFFFC0'  # text
W='#FF000080'  # wrong
K='#FFFFFF80'  # key holding
V='#FFFFFFFF'  # verifying

i3lock \
 -i ~/图片/Sheffield_Lock.jpg \
--insidecolor=$B --insidevercolor=$B --insidewrongcolor=$B \
--ringcolor=$D   --ringvercolor=$V   --ringwrongcolor=$W \
--line-uses-inside --separatorcolor=$D \
--keyhlcolor=$K --bshlcolor=$W \
--indicator \
--ring-width=10 --radius=20 \
--veriftext="" --noinputtext="" --wrongtext="" \
--pass-media-keys --pass-screen-keys --pass-power-keys \
