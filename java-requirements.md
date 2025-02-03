# Guía para Instalar el SDK de Java 17 en Windows y Mac

A continuación, se presenta una guía paso a paso para instalar el SDK de Java 17 en Windows y Mac. Para Mac, se utilizará `sdkman` para la instalación. Además, se incluyen instrucciones para configurar el SDK en Visual Studio Code.

---

## Instalación en Windows

### Paso 1: Descargar el SDK de Java 17
1. Abre tu navegador web y visita el sitio oficial de [Oracle JDK](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html) o [OpenJDK](https://openjdk.org/projects/jdk/17/).
2. Busca la versión de Java 17 para Windows y descarga el instalador correspondiente (generalmente un archivo `.exe` o `.msi`).

### Paso 2: Ejecutar el Instalador
1. Una vez descargado, localiza el archivo en tu carpeta de descargas y haz doble clic en él para ejecutar el instalador.
2. Sigue las instrucciones del instalador. Asegúrate de seleccionar la opción para agregar Java a la variable de entorno `PATH` si se te ofrece.

### Paso 3: Verificar la Instalación
1. Abre una ventana de `CMD` (presiona `Win + R`, escribe `cmd` y presiona `Enter`).
2. Escribe el siguiente comando y presiona `Enter`:
   ```bash
   java -version
   ```
3. Deberías ver algo similar a:
   ```
   java version "17.0.x"
   ```
   Esto confirma que Java 17 se ha instalado correctamente.

---

## Instalación en Mac usando SDKMAN

### Paso 1: Instalar SDKMAN
1. Abre una terminal en tu Mac.
2. Ejecuta el siguiente comando para instalar `sdkman`:
   ```bash
   curl -s "https://get.sdkman.io" | bash
   ```
3. Una vez que la instalación haya terminado, cierra y vuelve a abrir la terminal o ejecuta:
   ```bash
   source "$HOME/.sdkman/bin/sdkman-init.sh"
   ```
4. Verifica que `sdkman` se haya instalado correctamente ejecutando:
   ```bash
   sdk version
   ```

### Paso 2: Instalar Java 17 usando SDKMAN
1. En la terminal, ejecuta el siguiente comando para listar las versiones disponibles de Java:
   ```bash
   sdk list java
   ```
2. Busca la versión de Java 17 en la lista. Normalmente, se identifica como `17.0.x-open` o `17.0.x-oracle`.
3. Instala Java 17 ejecutando:
   ```bash
   sdk install java 17.0.x-open
   ```
   (Reemplaza `17.0.x-open` con la versión específica que deseas instalar).

### Paso 3: Verificar la Instalación
1. Verifica que Java 17 se haya instalado correctamente ejecutando:
   ```bash
   java -version
   ```
2. Deberías ver algo similar a:
   ```
   openjdk version "17.0.x"
   ```
   Esto confirma que Java 17 se ha instalado correctamente.

### Paso 4: Configurar Java 17 como Versión Predeterminada (Opcional)
1. Si tienes varias versiones de Java instaladas y deseas que Java 17 sea la versión predeterminada, ejecuta:
   ```bash
   sdk default java 17.0.x-open
   ```

---

## Configuración del SDK de Java en Visual Studio Code

### Paso 1: Instalar la Extensión de Java para Visual Studio Code
1. Abre Visual Studio Code.
2. Ve a la pestaña de Extensiones (Ctrl + Shift + X o Cmd + Shift + X en Mac).
3. Busca la extensión "Extension Pack for Java" y haz clic en `Install`.

### Paso 2: Configurar el SDK de Java en VS Code
1. Abre un proyecto de Java en Visual Studio Code o crea uno nuevo.
2. Presiona `Ctrl + ,` (o `Cmd + ,` en Mac) para abrir la configuración de VS Code.
3. Busca `java.home` en la barra de búsqueda de configuración.
4. Haz clic en "Edit in settings.json" y agrega la ruta de instalación de tu JDK 17. Por ejemplo:
   - **Windows**:
     ```json
     "java.home": "C:\\ruta\\al\\jdk-17"
     ```
   - **Mac**:
     ```json
     "java.home": "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
     ```
   Si usaste `sdkman`, la ruta suele ser:
   ```json
   "java.home": "/Users/tu_usuario/.sdkman/candidates/java/17.0.x-open"
   ```

### Paso 3: Verificar la Configuración
1. Abre un archivo `.java` en tu proyecto.
2. En la esquina inferior derecha de VS Code, verifica que la versión de Java sea `17`.
3. Si no aparece, reinicia VS Code o ejecuta el comando `Java: Configure Java Runtime` desde la paleta de comandos (Ctrl + Shift + P o Cmd + Shift + P).

---

¡Y eso es todo! Ahora tienes Java 17 instalado y configurado en tu sistema Windows o Mac, y listo para usarse en Visual Studio Code.