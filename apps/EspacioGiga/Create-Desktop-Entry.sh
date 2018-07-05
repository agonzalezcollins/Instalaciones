#!/bin/bash

# Adds a desktop entry for the current user

create_desktop_entry() {
	NAME="EspacioGiga"
	COMMENT="TV"

	CURRENT_DIR=$(pwd)
	EXECUTABLE=$CURRENT_DIR/usr/bin/google-chrome-stable
	ICON_PATH=$CURRENT_DIR/src/app/images/EspacioGiga.png

	DESTINATION_DIR=/home/$(whoami)/.local/share/applications
	DESKTOP_FILE=$DESTINATION_DIR/EspacioGiga.desktop

	echo "[Desktop Entry]" > $DESKTOP_FILE
	echo "Version=1.0" >> $DESKTOP_FILE
	echo "Type=Application" >> $DESKTOP_FILE
	echo "Name=$NAME" >> $DESKTOP_FILE
	echo "Icon=$ICON_PATH" >> $DESKTOP_FILE
	echo "Exec=\"$EXECUTABLE\" %U" >> $DESKTOP_FILE
	echo "Comment=$COMMENT" >> $DESKTOP_FILE
	echo "Categories=Multimedia;" >> $DESKTOP_FILE
	echo "Terminal=false" >> $DESKTOP_FILE

	# Updates the desktop entries
	gtk-update-icon-cache /usr/share/icons/hicolor

	echo "Desktop entry added for $(whoami)"
}

printf "Create a desktop entry for EspacioGiga for the current user ? (Y)es/(N)o: "
read -n1 input


if [ "$input" == "Y" ] || [ "$input" == "y" ] || [ "$input" == "" ]
then
	case "$(uname)" in
		Linux)
			create_desktop_entry ;;
		Darwin)
			echo "Create a desktop entry is only meant to be used on Linux" ;;
	esac
else
	echo -e "Cancel. /nJust execute ./Create-Desktop-Entry when you are ready to create a desktop entry for EspacioGiga"
fi
