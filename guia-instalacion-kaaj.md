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

### 1. Clonar proyectos
```bash
git clone https://github.com/tu-org/kaaj-frontend.git
git clone https://github.com/tu-org/kaaj-backend.git
```

### 2. Configurar base de datos local con Docker
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

### 3. Configuración backend (Spring Boot)
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

### 4. Configuración frontend (React + Vite)
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

## 5. Estructura sugerida de repos

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

