# Base de Datos para Churrasquería "El Maná"

## Descripción
Script SQL completo para la gestión de una churrasquería. Incluye:

- Modelo Entidad-Relación extendido (DERE) con especialización de persona en cliente y mesero.
- Transformación a modelo relacional con normalización hasta **3FN**.
- Tablas: `persona`, `cliente`, `mesero`, `producto`, `pedido`, `detalle_pedido`, `pago`.
- Restricciones de integridad (claves primarias, foráneas, `ENUM`).
- Datos de ejemplo para pruebas.
- **Consultas SQL avanzadas**: joins, subconsultas, agregaciones, funciones de ventana.
- **Álgebra relacional** incluida en la documentación.

## Tecnologías
- MySQL (o MariaDB)
- phpMyAdmin (entorno de desarrollo)

## Cómo importar la base de datos
1. Accede a tu gestor de bases de datos (phpMyAdmin, MySQL Workbench, etc.).
2. Crea una nueva base de datos (por ejemplo `churrasqueria_el_mana`).
3. Importa el archivo `sgbd_churrasqueria.sql` (ejecuta el script).
4. Verifica las tablas y los datos insertados.

## Consultas incluidas (ejemplos)
- Pedidos atendidos en el salón.
- Pagos realizados mediante QR.
- Clientes que gastaron más de 100 Bs.
- Ventas superiores al promedio.
- Top 5 productos que más dinero generaron.
- Cuadre de caja por método de pago.

## Diagrama del modelo relacional
*(Puedes generar una imagen con MySQL Workbench y subirla luego)*

## Autor
**Emilio Gabriel Fernández Jiménez**  
Estudiante de Ingeniería de Sistemas – UDABOL Oruro

## Licencia
MIT License (ver archivo `LICENSE`).

## Enlaces
- [Repositorio GitHub](https://github.com/emiliotecnologico/sgbd-churrasqueria)
