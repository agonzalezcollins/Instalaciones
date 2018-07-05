sudo cp /usr/share/applications/google-chrome.desktop /usr/share/applications/WhatsApp-Web.desktop
sudo pluma /usr/share/applications/WhatsApp-Web.desktop

[Desktop Entry]
Version=1.0
Name=WhatsApp-Web
GenericName=Web Browser
Comment=Access the Internet
Exec=/opt/google/chrome/google-chrome https://web.whatsapp.com/
Terminal=false
Icon=/usr/share/applications/myicons/whatsapp.ico
Type=Application
Categories=Network;WebBrowser;Favorites;
MimeType=text/html;text/xml;application/xhtml_xml;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
X-Ayatana-Desktop-Shortcuts=NewWindow;NewIncognito

[Desktop Action NewWindow]
Name=Nueva Ventana
Exec=/usr/bin/google-chrome-stable https://web.whatsapp.com/

[Desktop Action NewPrivateWindow]
Name=Nueva ventana de Incognito
Exec=/usr/bin/google-chrome-stable --incognito https://web.whatsapp.com/

sudo mkdir /usr/share/applications/myicons/
cd /usr/share/applications/myicons/
sudo wget http://icons.veryicon.com/ico/System/Circle/whatsapp.ico
