@ECHO OFF
cp -fr package/* ~/.local/share/plasma/plasmoids/com.github.tryllian.tiledmenu &
plasmashell --replace &
