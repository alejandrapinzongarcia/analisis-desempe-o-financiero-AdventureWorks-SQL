
-- Extraer y limpiar datos

SELECT 
    v.numero_pedido, 
    v.clave_producto, 
    p.nombre_producto, 
    pc.clave_categoria, 
COALESCE (p.precio_producto,0) AS precio_producto,
COALESCE (v.cantidad_pedido,0) AS cantidad_pedido, 
COALESCE (p.costo_producto,0) AS costo_producto,
    t.pais, 
    t.continente, 
    v.clave_territorio
FROM 
    ventas_2017 AS v
LEFT JOIN productos AS p 
    ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
    ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
    ON v.clave_territorio = t.clave_territorio;


SELECT
    v.numero_pedido,
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0)  AS precio_producto,
    COALESCE(v.cantidad_pedido, 0)  AS cantidad_pedido,
    COALESCE(p.costo_producto, 0)   AS costo_producto,
    t.pais,
    t.continente,
    v.clave_territorio,
COALESCE(p.precio_producto,0) * COALESCE(v.cantidad_pedido,0) AS ingreso_total,
COALESCE(p.costo_producto,0)* COALESCE(v.cantidad_pedido,0) AS costo_total
FROM ventas_2017 AS v
JOIN productos AS p
  ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
  ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
  ON v.clave_territorio = t.clave_territorio;


--Calcular KPIs financieros

SELECT 
    pais,
    clave_territorio,
    SUM (ingreso_total)::integer AS ingresos,
    SUM (costo_total)::integer AS costos
FROM ventas_clean 
GROUP BY 
    pais,
    clave_territorio
ORDER BY ingresos DESC;

SELECT
    v.pais,
    v.clave_territorio,
    SUM(v.ingreso_total)::integer AS ingresos,
    SUM(v.costo_total)::integer  AS costos,
    COALESCE(SUM(c.costo_campana::integer),0) AS costo_campana

FROM ventas_clean AS v
LEFT JOIN campanas AS c
  ON v.clave_territorio = c.clave_territorio::integer
GROUP BY
    v.pais,
    v.clave_territorio
ORDER BY
    ingresos DESC;

SELECT
    p.pais,
    p.clave_territorio,
    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,
    COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
    SUM(p.ingresos)::integer - SUM(p.costos)::integer AS beneficio_bruto,
    (SUM(p.ingresos) - SUM(p.costos))*100.0/NULLIF(SUM(p.ingresos),0) AS margen_pct,
(SUM(p.ingresos)-SUM(p.costos))*100.0/NULLIF(SUM(c.costo_campana), 0)AS roi_pct

FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
  ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;

--Validar resultados y QA

SELECT 
    SUM(CASE WHEN numero_pedido IS NULL THEN 1 ELSE 0 END) AS numero_pedido,
    SUM(CASE WHEN clave_producto IS NULL THEN 1 ELSE 0 END) AS clave_producto,
    SUM(CASE WHEN clave_territorio IS NULL THEN 1 ELSE 0 END) AS clave_territorio
FROM ventas_2017
-- Validación simple: nulos en claves de ventas_2017
-- Cuenta nulos en numero_pedido como nulos_numero_pedido, clave_producto como nulos_clave_producto , clave_territorio como nulos_clave_territorio 


select
    COUNT(*) AS filas_cantidad_no_valida
FROM ventas_2017
WHERE cantidad_pedido <= 0 ;


-- Conteo de Cantidades no válidas en ventas_2017 como filas_cantidad_no_valida
-- Ajusta la condición según tu regla de negocio: <= 0 (no se permite cero)


SELECT 
    COUNT(*) AS productos_precio_no_valido
FROM productos
WHERE precio_producto <=0 ;


-- Conteo de Cantidades no válidas en ventas_2017 como productos_precio_no_valido
-- Usa < 0 para negativos
