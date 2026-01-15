# TheGrint Golf Marketplace API - Prueba Técnica

Esta es una API REST desarrollada en Laravel para la gestión de anuncios (listings) de productos de golf.

# Funcionalidades
- **Autenticación:** Sistema de Login con Sanctum (Bearer Token).
- **CRUD de Listings:** Creación, edición, visualización y eliminación de anuncios.
- **Filtros Avanzados:**
    - Búsqueda por palabras clave (keywords).
    - Filtro por condicion.
    - Filtro por categorías.
    - Filtro por precio (Min/Max).
    - Filtro de fecha (`show_all`) para mostrar/ocultar anuncios vencidos.
 
## Nota sobre funcionalidades de IA
Para este reto, me enfoqué en preparar la arquitectura del sistema:
- La base de datos ya incluye los campos necesarios para almacenar evaluaciones de IA.
- La API ya entrega estos datos en las consultas de los productos (pueden verse en los registros de prueba adjuntos).
- Queda planteada la conexión a servicios externos como futura mejora.

# Instalación y Configuración
1. Clonar el repositorio.
2. Ejecutar `composer install`.
3. Configurar el archivo `.env` con sus credenciales de base de datos.
4. Ejecutar las migraciones: `php artisan migrate`.

# Archivos de Apoyo (En la raíz del proyecto)
Para facilitar la revisión, he incluido:
1. **`TheGrint_Golf_API.postman_collection.json`**: Colección completa de Postman con ejemplos de uso.
2. **`database_dump.sql`**: Dump de la base de datos con 10 registros de prueba y un usuario configurado.

## 👤 Usuario de Prueba
- **Email:** majo@example.com
- **Password:** 123456
