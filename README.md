## Análisis del desempeño financiero de Adventure Works con SQL ##

💻Descripción breve del proyecto : Como analista en AdventureWorks. El director financiero quiere saber en qué mercados se generan más ingresos y rentabilidad para decidir dónde invertir el próximo dólar de marketing.

Con datos de órdenes, productos, territorios y campañas, el objetivo es preparar un análisis que muestre #prioridades de mercado, optimización de presupuesto y rentabilidad.

**⚖️Objetivos del proyecto**

- Navegar un esquema relacional y escribir JOINs para combinar tablas.
- Extraer, filtrar y limpiar datos con SQL (manejo de NULLs, casting de tipos, estandarización de categorías).
- Calcular indicadores financieros clave: ingresos, costos, beneficio bruto, margen y ROI.
- Validar y controlar calidad (QA) con comprobaciones de totales y márgenes.
- Redactar un informe ejecutivo con visualizaciones y el método Contexto → Hallazgo → Implicación (C→F→I).

**📥Dataset del proyecto**
Tablas Disponibles
Un subconjunto del dataset de AdventureWorks. 

+ ventas_2017: transacciones de líneas de pedido (2017). Grano: una línea por producto y pedido.
+ productos: catálogo con atributos, costo y precio unitario por ClaveProducto.
+ productos_categorias: jerarquía categoría/subcategoría para enriquecer productos.
+ clientes: maestro de clientes con segmento y ubicación.
+ territorios: mapa de ClaveTerritorio → país y continente.
+ campanas: gasto de marketing por territorio/campaña.

**📊Contexto del negocio**
El director financiero busca responder dos preguntas centrales:

+ ¿Cuánto estamos ganando por país?
+ ¿Qué tan rentable es cada mercado considerando los gastos de marketing?

**📉Proceso a grandes pasos**

- Exploración del esquema: Diagrama de Entidades y definición de esquema de Tablas.
- Extracción y limpieza desde los datos con consultas SQL y vistas .
- Cálculo KPIs financieros ( Beneficio Bruto, Margen y ROI ).
- Validación de resultados y QA.
- Preparación de outputs y resumen ejecutivo en formato CFI en Google Drive.

**Resultados**
## Dashboard

![Dashboar de AdventureWorks ](dashboard_preview.png)

Puedes descargar el dashboard aquí:
[Descargar dashboard](Dashboard-analisis_financiero_adventureworks.pdf)
