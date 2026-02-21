--Tablas BRONZE_ZONE
CREATE TABLE IF NOT EXISTS catalog_jptq.bronze_jptq.TBL_PELICULAS (
        ID_PELICULA INT,
        DES_PELICULA STRING,
        DES_GENERO_PELICULA STRING,
        DES_IDIOMA_PELICULA STRING,
        VAL_PUNTUACION_USUARIO DECIMAL(10,0),
        VAL_DURACION_PELICULA_HORA INT,
        VAL_DURACION_PELICULA_MINUTOS INT,
        FEC_LANZAMIENTO DATE,
        VAL_NUMERO_VOTOS INT,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/bronze-jptq/TBL_PELICULAS';

CREATE TABLE IF NOT EXISTS catalog_jptq.bronze_jptq.TBL_DETALLE_PELICULAS (
        ID_PELICULA INT,
        DES_DIRECTOR STRING,
        DES_TOP_ACTORES STRING,
        VAL_PRESUPUESTO_USD INT,
        VAL_GANANCIAS_USD INT,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/bronze-jptq/TBL_DETALLE_PELICULAS';

CREATE TABLE IF NOT EXISTS catalog_jptq.bronze_jptq.TBL_MAS_INFO_PELICULAS (
        ID_PELICULA INT,
        DES_DURACION_PELICULA STRING,
        VAL_PRESUPUESTO STRING,
        VAL_INGRESOS STRING,
        PELICULA_ID INT,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/bronze-jptq/TBL_MAS_INFO_PELICULAS';

CREATE TABLE IF NOT EXISTS catalog_jptq.bronze_jptq.TBL_POSTER_PELICULAS (
        ID_PELICULA INT,
        DES_RUTA_POSTER_FRONTAL STRING,
        DES_RUTA_POSTER_TRASERA STRING,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/bronze-jptq/TBL_POSTER_PELICULAS';

--Tablas SILVER_ZONE    
CREATE TABLE IF NOT EXISTS catalog_jptq.silver_jptq.TBL_TMP_DIRECTOR_PELICULA (
        COD_DIRECTOR STRING,
        DES_DIRECTOR STRING,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/silver-jptq/TBL_TMP_DIRECTOR_PELICULA';

CREATE TABLE IF NOT EXISTS catalog_jptq.silver_jptq.TBL_TMP_GENERO_PELICULA (
        COD_GENERO_PELICULA STRING,
        DES_GENERO_PELICULA STRING,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/silver-jptq/TBL_TMP_GENERO_PELICULA';

CREATE TABLE IF NOT EXISTS catalog_jptq.silver_jptq.TBL_TMP_IDIOMA_PELICULA (
        COD_IDIOMA_PELICULA STRING,
        DES_IDIOMA_PELICULA STRING,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/silver-jptq/TBL_TMP_IDIOMA_PELICULA';            

CREATE TABLE IF NOT EXISTS catalog_jptq.silver_jptq.TBL_TMP_PELICULA (
        ID_PELICULA INT,
        DES_PELICULA STRING,
        DES_DURACION_PELICULA STRING,
        DES_TOP_ACTORES STRING,
        DES_RUTA_POSTER_FRONTAL STRING,
        DES_RUTA_POSTER_TRASERA STRING,
        FEC_LANZAMIENTO DATE,
        FEC_CARGA TIMESTAMP
        )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/silver-jptq/TBL_TMP_PELICULA';

--Tablas GOLD_ZONE
CREATE TABLE IF NOT EXISTS catalog_jptq.golden_jptq.tbl_dim_director_pelicula_t2 (
      SK_DIM_DIRECTOR BIGINT GENERATED ALWAYS AS IDENTITY,
      COD_DIRECTOR_PELICULA STRING, 
      DES_DIRECTOR_PELICULA STRING,
      BAN_ACTIVO INT,
      FEC_INICIO_VIGENCIA DATE,
      FEC_FIN_VIGENCIA DATE,
      FEC_CARGA DATE,
      FEC_ACTUALIZACION DATE
      )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/golden-jptq/{tabla}';

CREATE TABLE IF NOT EXISTS catalog_jptq.golden_jptq.tbl_dim_genero_pelicula_t0 (
      SK_DIM_GENERO BIGINT GENERATED ALWAYS AS IDENTITY,
      COD_GENERO_PELICULA STRING, 
      DES_GENERO_PELICULA STRING,
      FEC_CARGA DATE
      )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/golden-jptq/{tabla}';

CREATE TABLE IF NOT EXISTS catalog_jptq.golden_jptq.tbl_dim_idioma_pelicula_t0 (
      SK_DIM_IDIOMA BIGINT GENERATED ALWAYS AS IDENTITY,
      COD_IDIOMA_PELICULA STRING, 
      DES_IDIOMA_PELICULA STRING,
      FEC_CARGA DATE
      )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/golden-jptq/{tabla}';

CREATE TABLE IF NOT EXISTS catalog_jptq.golden_jptq.tbl_dim_pelicula_t1 (
      SK_DIM_PELICULA BIGINT GENERATED ALWAYS AS IDENTITY,
      COD_PELICULA STRING, 
      DES_PELICULA STRING,
      DES_DURACION_PELICULA STRING,
      DES_TOP_ACTORES STRING,
      DES_RUTA_POSTER_FRONTAL STRING,
      DES_RUTA_POSTER_TRASERA STRING,
      FEC_LANZAMIENTO DATE,
      FEC_CARGA DATE,
      FEC_ACTUALIZACION DATE
      )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/golden-jptq/{tabla}';

CREATE TABLE IF NOT EXISTS catalog_jptq.golden_jptq.tbl_fct_pelicula (
      SK_DIM_PELICULA INT,
      SK_DIM_DIRECTOR INT,
      SK_DIM_GENERO INT,
      SK_DIM_IDIOMA INT,
      VAL_PUNTUACION_USUARIO DOUBLE, 
      VAL_DURACION_PELICULA_HORA DOUBLE,
      VAL_DURACION_PELICULA_MINUTOS DOUBLE,
      VAL_NUMERO_VOTOS DOUBLE,
      VAL_PRESUPUESTO_USD DOUBLE,
      VAL_GANANCIAS_USD DOUBLE,
      FEC_CARGA DATE
      )
      USING DELTA
      LOCATION 'abfss://unity-catalog-jptq@adlsjptq0126.dfs.core.windows.net/golden-jptq/{tabla}';      