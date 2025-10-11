# Configuracion de vim #
---
## Pasos de instalacion ##
### 1-Instalar Vim ###

* _Instalacion en devian/ubuntu/linux mint_ ``` sudo apt install vim  ``` 

* _Instalacion en Fedora_ ``` sudo dnf install vim-enhanced  ``` 

* _Instalacion en Arch/Manjaro_ ``` sudo pacman -S install vim  ``` 

* _Instalacion en OpenSUSE_ ``` sudo zypper install vim  ``` 

* _Instalacion en CentOs/RHEL_ 
    * Versiones nuevas ``` sudo dnf install vim-enhanced  ``` 
    * Versiones antigual ``` sudo yum install vim-enhanced  ``` 

### 2-Instalar Vim-plug ###
```curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ``` 
### 3-Instalar NodeJS ###
```
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v # Should print "v22.20.0".

# Verify npm version:
npm -v # Should print "10.9.3".
```

### 4-Instalar Live Server ###
```npm install -g live-server```
### 5-PlugInstall ###
Accede a vim y ejecuta este comando ```:PlugInstall```
