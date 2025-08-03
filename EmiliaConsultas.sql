-- 4.1 Libros publicados después de 2005
SELECT * FROM LIBROS WHERE anio > 2005;

-- 4.2 Clientes cuyo nombre contiene la letra "e"
SELECT * FROM CLIENTES WHERE nombre LIKE '%e%';

-- 4.3 Contar número total de libros
SELECT COUNT(*) AS total_libros FROM LIBROS;

-- 4.4 Título del libro con ID 3
SELECT titulo FROM LIBROS WHERE id = 3;

-- 4.5 Clientes con correo que termina en @gmail.com
SELECT COUNT(*) AS total_gmail FROM CLIENTES WHERE email LIKE '%@gmail.com';

-- 4.6 Título del libro más antiguo
SELECT titulo FROM LIBROS ORDER BY anio ASC LIMIT 1;

-- 4.7 JOIN: Libros junto con nombres de clientes
SELECT LIBROS.titulo, CLIENTES.nombre
FROM LIBROS
JOIN CLIENTES ON LIBROS.cliente_id = CLIENTES.id;

-- 4.8 JOIN: Clientes que no tienen libros
SELECT CLIENTES.nombre 
FROM CLIENTES 
LEFT JOIN LIBROS ON CLIENTES.id = LIBROS.cliente_id
WHERE LIBROS.id IS NULL;