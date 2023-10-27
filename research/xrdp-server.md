# Set up the GUI server with Microsoft Remote Desktop
To set up the remote desktop, follow the following guidelines,
1. Run the following script to install `xrdp`
```
#!/bin/sh -e
sudo apt install xfce4 xfce4-goodies


sudo apt install -y xrdp
sudo sed -e 's/^new_cursors=true/new_cursors=false/g' \
     -i /etc/xrdp/xrdp.ini
sudo systemctl enable xrdp
sudo systemctl restart xrdp

echo "xfce4-session" > ~/.xsession
D=/usr/share/xfce4:/usr/share/xubuntu:/usr/local/share
D=${D}:/usr/share:/var/lib/snapd/desktop:/usr/share
cat <<EOF > ~/.xsessionrc
export XDG_SESSION_DESKTOP=xubuntu
export XDG_DATA_DIRS=${D}
export XDG_CONFIG_DIRS=/etc/xdg/xdg-xubuntu:/etc/xdg:/etc/xdg
EOF

sudo mv /usr/bin/light-locker /usr/bin/light-locker.orig
cat <<EOF | sudo tee /usr/bin/light-locker
#!/bin/sh

# The light-locker uses XDG_SESSION_PATH provided by lightdm.
if [ ! -z "\${XDG_SESSION_PATH}" ]; then
  /usr/bin/light-locker.orig
else
  # Disable light-locker in XRDP.
  true
fi
EOF
sudo chmod a+x /usr/bin/light-locker
```
2. Install the [Microsoft Remote Desktop](https://apps.apple.com/us/app/microsoft-remote-desktop/id1295203466?mt=12)
3. Add a new desktop
    - <pc name> should be the ip or the part after `@`
    - give a name to the <user account>.
    - give username which is part before the `@` and also give the password

![new desktop](pics/remoteDesktop-1.png)

![addUser1](pics/addUser1.png)

![addUser2](pics/addUser2.png)