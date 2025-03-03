# Guía Paso a Paso para Configurar y Probar un Servicio con Docker, MariaDB y API

A continuación, se presenta una guía detallada para configurar un entorno con Docker, MariaDB, y realizar pruebas de un servicio utilizando solicitudes HTTP.

---

## 1. Descargar e Instalar Docker

### Paso 1: Descargar Docker
1. Visita el sitio oficial de Docker: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).
2. Descarga la versión de Docker Desktop correspondiente a tu sistema operativo (Windows, Mac o Linux).

### Paso 2: Instalar Docker
1. Ejecuta el instalador descargado.
2. Sigue las instrucciones del asistente de instalación.
3. Una vez instalado, inicia Docker Desktop.
4. Verifica que Docker esté funcionando correctamente abriendo una terminal y ejecutando:
   ```bash
   docker --version
   ```
   Deberías ver la versión de Docker instalada.

---

## 2. Ejecutar un Contenedor de MariaDB

### Paso 1: Ejecutar el Contenedor
1. Abre una terminal y ejecuta el siguiente comando para descargar y ejecutar un contenedor de MariaDB:
   ```bash
   docker run -p 127.0.0.1:3306:3306 -e MARIADB_ROOT_PASSWORD=root -d mariadb:latest
   ```
   - `-p 127.0.0.1:3306:3306`: Mapea el puerto 3306 del contenedor al puerto 3306 de tu máquina local.
   - `-e MARIADB_ROOT_PASSWORD=root`: Establece la contraseña del usuario root como `root`.
   - `-d`: Ejecuta el contenedor en segundo plano.

### Paso 2: Verificar el Contenedor
1. Verifica que el contenedor esté en ejecución:
   ```bash
   docker ps
   ```
   Deberías ver el contenedor de MariaDB en la lista.

---

## 3. Validar la Conexión a la Base de Datos Local

### Paso 1: Usar un Cliente de Base de Datos
1. Abre tu cliente de base de datos preferido (por ejemplo, DBeaver).
2. Configura una nueva conexión con los siguientes detalles:
   - **Host**: `127.0.0.1`
   - **Puerto**: `3306`
   - **Usuario**: `root`
   - **Contraseña**: `root`
3. Conéctate a la base de datos para verificar que la conexión sea exitosa.

---

## 4. Crear la Base de Datos y Tablas

### Paso 1: Ejecutar el Script SQL
1. Abre tu cliente de base de datos (DBeaver).
2. Crea una nueva base de datos llamada `beqando_database`.
3. Ejecuta el script `beqando_database.sql` para crear las tablas necesarias.

---

## 5. Ejecutar el Servicio

### Paso 1: Iniciar el Servicio
1. Asegúrate de que el servicio esté configurado para conectarse a la base de datos local (`127.0.0.1:3306`).
2. Inicia el servicio utilizando el método correspondiente (por ejemplo, ejecutando un archivo `.jar` o iniciando un servidor de aplicaciones).

---

## Pruebas del Servicio

### 1. Crear un Pool

#### Solicitud:
```bash
curl -X POST http://localhost:8080/api/pools \
    -H "Content-Type: application/json" \
    -d '{
          "type": 1,
          "beneficiary": 1,
          "price": 80.00,
          "endTime": "2025-02-20T23:59:59",
          "createdBy": 1,
          "fixtures": [
            {
              "id": 1,
              "startTime": "2025-02-15T15:00:00",
              "league": "Premier League",
              "homeTeam": "Team E",
              "homeTeamLogo": "http://example.com/logoA.png",
              "awayTeam": "Team F",
              "awayTeamLogo": "http://example.com/logoB.png",
              "createdAt": "2025-01-30T12:00:00"
            },
            {
              "id": 2,
              "startTime": "2025-02-16T17:30:00",
              "league": "La Liga",
              "homeTeam": "Team G",
              "homeTeamLogo": "http://example.com/logoC.png",
              "awayTeam": "Team H",
              "awayTeamLogo": "http://example.com/logoD.png",
              "createdAt": "2025-01-30T12:00:00"
            }
          ]
        }'
```

### 2. Crear una Venta con Predicciones

#### Solicitud:
```bash
curl -X POST "http://localhost:8080/api/sales" \
     -H "Content-Type: application/json" \
     -d '{
           "user": {
              "id": "e87fc7b3-a65a-4527-a8d6-56f4c73f06cd"
          },
           "pools": 2,
           "predictions": [
               {
                   "poolId": 1,
                   "fixtureId": 1,
                   "prediction": "L",
                   "donation": 80.00
               },
               {
                   "poolId": 1,
                   "fixtureId": 2,
                   "prediction": "E",
                   "donation": 80.00
               },
               {
                   "poolId": 2,
                   "fixtureId": 1,
                   "prediction": "V",
                   "donation": 80.00
               },
               {
                   "poolId": 2,
                   "fixtureId": 2,
                   "prediction": "L",
                   "donation": 80.00
               }
           ]
         }'
```

### 2a. Crear una Venta con Predicciones para un usuario no registrado.

#### Solicitud:
```bash
curl -X POST "http://localhost:8080/api/sales" \
     -H "Content-Type: application/json" \
     -d '{
           "user": {
              "username": "some_user_name",
              "email": "some_email@gmail.com",
              "name": "some_name",
              "lastName": "some_last_name",
              "birthdate": "2025-03-02"
          },
           "pools": 2,
           "predictions": [
               {
                   "poolId": 1,
                   "fixtureId": 1,
                   "prediction": "L",
                   "donation": 80.00
               },
               {
                   "poolId": 1,
                   "fixtureId": 2,
                   "prediction": "E",
                   "donation": 80.00
               },
               {
                   "poolId": 2,
                   "fixtureId": 1,
                   "prediction": "V",
                   "donation": 80.00
               },
               {
                   "poolId": 2,
                   "fixtureId": 2,
                   "prediction": "L",
                   "donation": 80.00
               }
           ]
         }'
```

### 3. Obtener los Mejores Ganadores de un Pool

#### Solicitud:
```bash
curl -X GET "http://localhost:8080/api/predictions/top-users/1?limit=3" -H "Content-Type: application/json"
```

### 4. Obtener los Partidos de un Pool

#### Solicitud:
```bash
curl -X GET http://localhost:8080/api/pools/1/fixtures -H "Content-Type: application/json"
```

### 5. Obtener el descuento de un código de promoción

#### Solicitud:
```bash
curl -X GET http://localhost:8080/api/sales/discount/{code} -H "Content-Type: application/json"
```

### 5. Obtener las predicciones por ticket (Id de venta) para la pantalla de Mi Suerte

#### Solicitud:
```bash
curl -X GET 'http://localhost:8080/api/predictions/sale/{saleId}' -H "Content-Type: application/json"
```

### 5. Obtener las predicciones por id de quiniela para la pantalla de ¿Ya gané?

#### Solicitud:
```bash
curl -X GET 'http://localhost:8080/api/predictions/pool/{poolId}' -H "Content-Type: application/json"
```

---

¡Y eso es todo! Ahora has configurado un entorno con Docker, MariaDB, y has realizado pruebas básicas del servicio utilizando solicitudes HTTP.