# Guía de instalación del proyecto **Kaaj**

Este documento describe el paso a paso para instalar todas las dependencias necesarias para ejecutar el proyecto **Kaaj** en **Windows** y **macOS**.  
El proyecto se divide en dos repositorios: **kaaj-frontend** y **kaaj-backend**.

---

## 🔧 Dependencias necesarias
- [Git](https://git-scm.com/downloads) → Control de versiones  
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) → Contenedores (MariaDB local)  
- [NVM](https://github.com/nvm-sh/nvm) → Gestor de versiones de Node.js  
- [Node.js](https://nodejs.org/) (vía NVM) → Entorno de ejecución JavaScript  
- [Visual Studio Code](https://code.visualstudio.com/) → IDE recomendado  
- [Java 17 (JDK)](https://adoptium.net/temurin/releases/) → Lenguaje para backend  
- [Maven](https://maven.apache.org/download.cgi) → Build y dependencias para backend  

---

# 🚀 Instalación en **Windows 10/11**

### 1. Instalar Git
Descargar e instalar desde: [Git para Windows](https://git-scm.com/download/win).  
Verifica la instalación:
```powershell
git --version
```

### 2. Instalar Docker Desktop
Descargar desde: [Docker Desktop](https://www.docker.com/products/docker-desktop/).  
- Requiere **WSL2** habilitado.  
- Después de instalar, abre Docker Desktop una vez para inicializar.  
Verifica:
```powershell
docker --version
```

### 3. Instalar NVM (Windows)
Descargar instalador desde: [nvm-windows releases](https://github.com/coreybutler/nvm-windows/releases).  
Después de instalar, abre PowerShell y ejecuta:
```powershell
nvm install lts
nvm use lts
node -v
npm -v
```

### 4. Instalar Java 17 (JDK)
Descargar desde: [Temurin 17 JDK](https://adoptium.net/temurin/releases/).  
Verifica:
```powershell
java -version
```

### 5. Instalar Maven
Descargar instalador desde: [Apache Maven](https://maven.apache.org/download.cgi).  
- Extraer y configurar la variable de entorno `MAVEN_HOME` apuntando al directorio.  
Verifica:
```powershell
mvn -v
```

### 6. Instalar Visual Studio Code
Descargar desde: [VS Code](https://code.visualstudio.com/Download).  

Instala extensiones recomendadas:
- Java Extension Pack (para backend)
- ESLint (para frontend)
- Docker

---

# 🚀 Instalación en **macOS (Intel / Apple Silicon)**

### 1. Instalar Homebrew
Si no lo tienes:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Instalar Git
```bash
brew install git
git --version
```

### 3. Instalar Docker Desktop
```bash
brew install --cask docker
```
Abrir Docker Desktop después de instalar.  

### 4. Instalar NVM y Node.js
```bash
brew install nvm
mkdir -p ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc
source ~/.zshrc

nvm install --lts
nvm use --lts
node -v
npm -v
```

### 5. Instalar Java 17 (JDK)
```bash
brew install --cask temurin17
java -version
```

### 6. Instalar Maven
```bash
brew install maven
mvn -v
```

### 7. Instalar Visual Studio Code
```bash
brew install --cask visual-studio-code
```

---

# 🛠️ Configuración de repositorios

## 1. Configurar Git con tu usuario de GitHub

Configura tu nombre y correo (el mismo registrado en GitHub):
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu-email@ejemplo.com"
```

Verifica configuración:
```bash
git config --list
```

---

## 2. Generar clave SSH

Ejecuta el siguiente comando (reemplaza con tu correo de GitHub):

### En Windows (Git Bash o PowerShell)
```bash
ssh-keygen -t ed25519 -C "tu-email@ejemplo.com"
```

- Cuando pregunte la ruta de guardado, presiona **Enter** (usará `C:\Users\TU_USUARIO\.ssh\id_ed25519`).  
- Cuando pregunte la passphrase, puedes dejarla vacía o asignar una contraseña.

Esto generará:
- `id_ed25519` → clave privada (no compartir)  
- `id_ed25519.pub` → clave pública (esta se sube a GitHub)  

---

## 4. Agregar la llave al agente SSH

### Windows (Git Bash)
Inicia el agente:
```bash
eval "$(ssh-agent -s)"
```

Agrega tu clave privada:
```bash
ssh-add ~/.ssh/id_ed25519
```

### Windows (PowerShell)
1. Abre **PowerShell** como administrador.  
2. Inicia el servicio de `ssh-agent`:
   ```powershell
   Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
   Start-Service ssh-agent
   ```
3. Agrega la clave:
   ```powershell
   ssh-add $env:USERPROFILE\.ssh\id_ed25519
   ```

### macOS
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

---

## 5. Registrar la clave en GitHub

1. Copia tu clave pública:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
   En Windows puedes usar:
   ```powershell
   Get-Content $env:USERPROFILE\.ssh\id_ed25519.pub
   ```

2. Ve a GitHub → **Settings** → **SSH and GPG keys**  
3. Haz clic en **New SSH key**, asigna un nombre (ej. *Mi Laptop*) y pega la clave pública.  
4. Guarda.

---

## 6. Probar conexión con GitHub

Ejecuta:
```bash
ssh -T git@github.com
```

Si todo está correcto deberías ver:
```
Hi usuario! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## 7. Clonar un repositorio con SSH

Ya puedes clonar usando la URL SSH (no HTTPS). Ejemplo:
```bash
git clone git@github.com:tu-usuario/kaaj-frontend.git
git clone git@github.com:tu-usuario/kaaj-backend.git
```

---

# ✅ Conclusión
Con esta configuración:
- Git usa tu identidad (nombre y correo).  
- La autenticación con GitHub es segura mediante SSH.  
- Puedes clonar, hacer *push* y *pull* sin tener que ingresar usuario/contraseña.


### 8. Configurar base de datos local con Docker
En `kaaj-backend/docker-compose.yml`:
```yaml
version: "3.9"
services:
  mariadb:
    image: mariadb:11
    container_name: kaaj-mariadb
    environment:
      - MARIADB_ROOT_PASSWORD=rootpwd
      - MARIADB_DATABASE=kaaj_core
      - MARIADB_USER=kaaj
      - MARIADB_PASSWORD=kaajpwd
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```
Levantar contenedor:
```bash
docker compose up -d
```

### 9. Configuración backend (Spring Boot)
En `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mariadb://localhost:3306/kaaj_core
spring.datasource.username=kaaj
spring.datasource.password=kaajpwd
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MariaDBDialect
server.port=8080
```
Arrancar backend:
```bash
mvn spring-boot:run
```

### 10. Configuración frontend (React + Vite)
Crear archivo `.env` en `kaaj-frontend`:
```env
VITE_API_BASE_URL=http://localhost:8080
```
Instalar dependencias y ejecutar:
```bash
npm install
npm run dev
```

---

# ✅ Verificación
- Backend disponible en: `http://localhost:8080`  
- Frontend disponible en: `http://localhost:5173`  

Con esto el proyecto **Kaaj** queda listo para desarrollo.

## 11. Estructura sugerida de repos

**kaaj-frontend**
```
kaaj-frontend/
  src/
    lib/api.ts
    pages/
    components/
    hooks/
    styles/
  public/
  index.html
  package.json
  vite.config.ts
  tailwind.config.js
  postcss.config.js
  .env (VITE_API_BASE_URL=...)
```

**kaaj-backend**
```
kaaj-backend/
  src/main/java/com/kaaj/...
    KaajApplication.java
    api/ (controllers)
    domain/ (entidades)
    service/ (servicios)
    repository/ (repos)
    config/ (seguridad, cors, etc.)
  src/main/resources/
    application.properties
  pom.xml
  docker-compose.yml
```

