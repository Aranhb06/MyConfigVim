# 🧠 Configuración de Vim

> **Nota del desarrollador**  
> Este repositorio tiene como propósito aprender del proceso de configuración y personalización de Vim.  
> Comparto libremente este trabajo para que cualquiera pueda **explorar, experimentar y contribuir a mejorarlo**.  
> Cualquier sugerencia o PR será muy bienvenida. 🙌

---

## 🚀 Pasos de instalación

### 📦 1. Clonar el repositorio

Clona este repositorio y renómbralo a `.vim`:

```bash
git clone https://github.com/Aranhb06/MyConfigVim.git ~/.vim
```

---

### 💻 2. Instalar Vim

Antes de instalar, asegúrate de actualizar los repositorios de tu sistema.

#### En Debian / Ubuntu / Linux Mint

```bash
sudo apt update && sudo apt install vim
```

#### En Fedora

```bash
sudo dnf install vim-enhanced
```

#### En Arch / Manjaro

```bash
sudo pacman -S vim
```

#### En OpenSUSE

```bash
sudo zypper install vim
```

#### En CentOS / RHEL

```bash
# Versiones nuevas
sudo dnf install vim-enhanced

# Versiones antiguas
sudo yum install vim-enhanced
```

---

### 🧩 3. Instalar Vim-Plug

[Vim-Plug](https://github.com/junegunn/vim-plug) es el gestor de plugins utilizado en esta configuración.

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

---

### 🟢 4. Instalar Node.js

Usaremos [NVM](https://github.com/nvm-sh/nvm) para manejar las versiones de Node.js.

```bash
# Descargar e instalar NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Cargar NVM (sin reiniciar la terminal)
. "$HOME/.nvm/nvm.sh"

# Instalar Node.js
nvm install 22

# Verificar versiones
node -v  # → v22.20.0
npm -v   # → 10.9.3
```

---

### 🌐 5. Instalar Live Server

```bash
npm install -g live-server
```

---

### ⚙️ 6, Instalar los plugins de Vim

Abre Vim y ejecuta:

```vim
:PlugInstall
```

Esto descargará e instalará todos los plugins configurados en tu `.vimrc`.

---

## 🤝 Contribuciones

Si tienes ideas, mejoras o encuentras errores, ¡no dudes en abrir un **Issue** o enviar un **Pull Request**!  
El objetivo es **aprender colaborativamente** y crear una configuración de Vim más potente y accesible.

---

## ⚖️  Licencia

.Este proyecto se distribuye bajo una **Licencia Libre No Comercial**, inspirada en la [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html) y [Creative Commons BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.es).

---

 *Hecho con curiosidad y pasión por el aprendizaje.*

