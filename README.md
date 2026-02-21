<div align="center">

# 🎬🎞️ Movies / Peliculas ETL Pipeline - DataWarehouse 🎞️🎥
### Proyecto Arquitectura Medallion en Azure Databricks

[![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)](https://databricks.com/)
[![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apache-spark&logoColor=white)](https://spark.apache.org/)
[![Delta Lake](https://img.shields.io/badge/Delta_Lake-00ADD8?style=for-the-badge&logo=delta&logoColor=white)](https://delta.io/)
[![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)](https://databricks.com/)
[![CI/CD](https://img.shields.io/badge/CI%2FCD-GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)

*Pipeline automatizado de datos para análisis de Peliculas en el tiempo con sus Costos y Ganancias con arquitectura medallion y despliegue continuo*

</div>

---

## 🎯 Descripción

Pipeline ETL enterprise-grade que transforma datos crudos de la peliculas que se han hecho en el timepo teniendo en cuenta votaciones, costos y ganancias obtenidas en su fecha de lanzamiento, implementando la **Arquitectura Medallion** (Bronze-Silver-Gold) en Azure Databricks con **CI/CD completo** y **Delta Lake** para garantizar consistencia ACID.

### ✨ Características Principales

- 🔄 **ETL Automatizado** - Pipeline completo con despliegue automático via GitHub Actions
- 🏗️ **Arquitectura Medallion** - Separación clara de capas Bronze → Silver → Gold
- 📊 **Modelo Dimensional** - Star Schema optimizado para análisis de negocio
- 🚀 **CI/CD Integrado** - Deploy automático en cada push a master
- 📈 **Databricks Dashboards** - Visualización
- ⚡ **Delta Lake** - ACID transactions y time travel capabilities
- 🔔 **Monitoreo** - Notificaciones automáticas y logs detallados

---

## 🏛️ Arquitectura

### Flujo de Datos

```
📄 CSV (Raw Data)
    ↓
🥉 Bronze Zone (Ingesta sin transformación)
    ↓
🥈 Silver Zone (Limpieza + Transformacion)
    ↓
🥇 Gold Zone (Modelo Dimensional)
    ↓
📊 Databricks Dashboards (Visualización)
```

![Arquitectura Trabajada](https://github.com/JPTQ96/Smart_Data_Databricks/blob/main/evidencias/Arq_DWH_Movies.png)
![Modelo Dimensional](https://github.com/JPTQ96/Smart_Data_Databricks/blob/main/evidencias/Modelo_Estrella_Peliculas.png)

### 📦 Capas del Pipeline

<table>
<tr>
<td width="33%" valign="top">

#### 🥉 Bronze Layer
**Propósito**: Toma de Informacion Fuente de los Planos .csv

**Tablas**: 
- `TBL_DETALLE_PELICULAS` 
- `TBL_MAS_INFO_PELICULAS` 
- `TBL_PELICULAS`
- `TBL_POSTER_PELICULAS`

**Características**:
- ✅ Datos tal como vienen de origen
- ✅ Timestamp de ingesta
- ✅ Sin validaciones

</td>
<td width="33%" valign="top">

#### 🥈 Silver Layer
**Propósito**: Transformacion de Datos

**Tablas**:
- `TBL_TMP_DIRECTOR_PELICULA`
- `TBL_TMP_GENERO_PELICULA`
- `TBL_TMP_IDIOMA_PELICULA`
- `TBL_TMP_PELICULA`

**Características**:
- ✅ Datos normalizados
- ✅ Validaciones completas

</td>
<td width="33%" valign="top">

#### 🥇 Gold Layer
**Propósito**: Modelo Dimensional

**Tablas**:
- TBL_DIM_DIRECTOR_PELICULA_T2 : Dimension Directores de Peliculas.
- TBL_DIM_GENERO_PELICULA_T0   : Dimension Genero de Peliculas.
- TBL_DIM_IDIOMA_PELICULA_T0   : Dimension Idiomas de Peliculas.
- TBL_DIM_PELICULA_T1          : Dimension Peliculas.
- TBL_FCT_PELICULA             : Tabla de Hecho con las medidas de analisis de las Peliculas.

**Características**:
- ✅ Modelo Estrella
- ✅ Optimizado para BI
- ✅ Performance máximo
- ✅ Actualizaciones automáticas

</td>
</tr>
</table>

---

## 📁 Estructura del Proyecto

```
Smart_Data_Databricks/
│
├── 📂 .github/
│   └── 📂 workflows/
│       └── 📄 deploy-notebook.yml    # Pipeline CI/CD deploy a certification workspace databricks
├── 📂 PrepAmb/
│   ├── 🐍 Preparacion_Ambiente.ipynb   # Preparacion Ambiente
├── 📂 certificaciones/
│   ├── 📄 Enlaces_Certificaciones.txt  # Enlaces con las Certificaciones Obtenidas
├── 📂 dashboards/                      # Databricks Dashboards
│   ├── 📊 Analisis Peliculas 2026-02-21 16_06.pdf  # PDF Dashboard
│   ├── 📊 Analisis Peliculas.lvdash.json           # Dashboard
│   ├── 📊 Link_Dashboard.txt                       # Link Dashboard
├── 📂 datasets/
│   ├── 🔢 FilmDetails.csv    # Detalle Peliculas
|   ├── 🔢 MoreInfo.csv       # Mas Info Peliculas
|   ├── 🔢 Movies.csv         # Peliculas
|   ├── 🔢 PosterPath.csv     # Ruta Posters
│   ├── 📄 info_datasets.txt  # Informacion Detallada de Cada Fuente
├── 📂 evidencias/
│   ├── 🖼️ Analisis Peliculas 2026-02-21 16_06.pdf      # Evidencia Dashboard
│   ├── 🖼️ Arq_DWH_Movies.png                           # Evidencia Arquitectura
│   ├── 🖼️ Containers_Azure.png                         # Evidencia Container
│   ├── 🖼️ Containers_Azure_Fuentes.png                 # Evidencia Fuente
│   ├── 🖼️ Containers_Azure_Unity_Catalog.png           # Evidencia Container Unity Catalog
│   ├── 🖼️ Containers_Azure_Unity_Catalog_Bronze.png    # Evidencia Container Bronze Zone
│   ├── 🖼️ Containers_Azure_Unity_Catalog_Golden.png    # Evidencia Container Silver Zone
│   ├── 🖼️ Containers_Azure_Unity_Catalog_Silver.png    # Evidencia Container Golden Zone
│   ├── 🖼️ Databricks_DEV.png                           # Evidencia Databricks DEV
│   ├── 🖼️ Databricks_DEV_Cluster.png                   # Evidencia Cluster DEV
│   ├── 🖼️ Databricks_DEV_External_Data.png             # Evidencia External Data DEV
│   ├── 🖼️ Databricks_DEV_External_Data_Credential.png  # Evidencia Credential DEV
│   ├── 🖼️ Databricks_PROD.png                          # Evidencia Databricks PROD
│   ├── 🖼️ Databricks_PROD_Cluster.png                  # Evidencia Cluster PROD
│   ├── 🖼️ Databricks_Users.png                         # Evidencia Users
│   ├── 🖼️ Databricks_Users_2.png                       # Evidencia Users
│   ├── 🖼️ Databricks_Users_3.png                       # Evidencia Users
│   ├── 🖼️ Git_Hub.png                                  # Evidencia Deploy Github
│   ├── 🖼️ Grupo_De_Recursos.png                        # Evidencia Grupo Recursos
│   ├── 🖼️ Grupo_De_Recursos_2.png                      # Evidencia Grupo Recursos
│   ├── 🖼️ Modelo_Estrella_Peliculas.png                # Evidencia Modelo Estrella Peliculas
│   ├── 🖼️ WorkFlow_DWH_Peliculas.png                   # Evidencia Workflow DEV / PROD
│   ├── 🖼️ WorkFlow_DWH_Peliculas_Ejecucion.png         # Evidencia Workflow Ejecucion
│   ├── 🖼️ WorkFlow_DWH_Peliculas_Ejecucion_2.png       # Evidencia Workflow Ejecucion
├── 📂 proceso/
│   └── 📂 Peliculas/
│   ├── 🐍 NB_Carga_Catalogo_Peliculas.ipynb           # Bronze Zone
│   ├── 🐍 NB_Carga_Detalle_Peliculas.ipynb            # Bronze Zone
│   ├── 🐍 NB_Carga_Mas_Info_Peliculas.ipynb           # Bronze Zone
│   ├── 🐍 NB_Carga_Ruta_Poster_Peliculas.ipynb        # Bronze Zone
│   ├── 🐍 NB_Transformacion_Director_Pelicula.ipynb   # Silver Zone
│   ├── 🐍 NB_Transformacion_Genero_Pelicula.ipynb     # Silver Zone
│   ├── 🐍 NB_Transformacion_Idioma_Pelicula.ipynb     # Silver Zone
│   ├── 🐍 NB_Transformacion_Peliculas.ipynb           # Silver Zone
│   └── 🐍 NB_Dimension_Director_Pelicula_T2.ipynb     # Gold Zone
│   └── 🐍 NB_Dimension_Genero_Pelicula_T0.ipynb       # Gold Zone
│   └── 🐍 NB_Dimension_Idioma_Pelicula_T0.ipynb       # Gold Zone
│   └── 🐍 NB_Dimension_Pelicula_T1.ipynb              # Gold Zone
│   └── 🐍 NB_Fct_Table_Pelicula.ipynb                 # Gold Zone
│   └── 🐍 Preparacion_Ambiente.ipynb                  # Preparacion Ambiente
├── 📂 reversion/
|   ├── 🐍 Reversion_Proceso.ipynb    # Reversion del Proceso
├── 📂 scripts/
|   ├── 🛢️ Scripts_Movies.sql   # Creacion Objetos
├── 📂 seguridad/
|   ├── 🐍 Grant's to Consultor.ipynb    # Permisos Usuario Externo
└── 📄 README.md
```

---

## 🛠️ Tecnologías

<div align="center">

| Tecnología | Propósito |
|:----------:|:----------|
| ![Databricks](https://img.shields.io/badge/Azure_Databricks-FF3621?style=flat-square&logo=databricks&logoColor=white) | Motor de procesamiento distribuido Spark |
| ![Delta Lake](https://img.shields.io/badge/Delta_Lake-00ADD8?style=flat-square&logo=delta&logoColor=white) | Storage layer con ACID transactions |
| ![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=flat-square&logo=apache-spark&logoColor=white) | Framework de transformación de datos |
| ![ADLS](https://img.shields.io/badge/ADLS_Gen2-0078D4?style=flat-square&logo=microsoft-azure&logoColor=white) | Data Lake para almacenamiento persistente |
| ![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat-square&logo=github-actions&logoColor=white) | Automatización CI/CD |
| ![Databricks](https://img.shields.io/badge/Azure_Databricks-FF3621?style=flat-square&logo=databricks&logoColor=white) |  Visualización |

</div>

---

## ⚙️ Requisitos Previos

- ☁️ Cuenta de Azure con acceso a Databricks
- 💻 Workspace de Databricks configurado
- 🖥️ Cluster activo (nombre: `Cluster_JPTQ`)
- 🐙 Cuenta de GitHub con permisos de administrador
- 📦 Azure Data Lake Storage Gen2 configurado
- 📊 Databricks o Power BI Desktop (opcional para visualización)

---

## 🚀 Instalación y Configuración

### 1️⃣ Clonar el Repositorio

```bash
git clone https://github.com/JPTQ96/Smart_Data_Databricks.git
cd Smart_Data_Databricks
```

### 2️⃣ Configurar Databricks Token

1. Ir a Databricks Workspace
2. **User Settings** → **Developer** → **Access Tokens**
3. Click en **Generate New Token**
4. Configurar:
   - **Comment**: `GITHUB`
   - **Lifetime**: `90 days`
5. ⚠️ Copiar y guardar el token

### 3️⃣ Configurar GitHub Secrets

En tu repositorio: **Settings** → **Secrets and variables** → **Actions**

| Secret Name | Valor Ejemplo |
|------------|---------------|
| `DATABRICKS_ORIGIN_HOST` | `https://adb-xxxxx.azuredatabricks.net` |
| `DATABRICKS_ORIGIN_TOKEN` | `dapi_xxxxxxxxxxxxxxxx` |
| `DATABRICKS_DEST_HOST` | `https://adb-xxxxx.azuredatabricks.net` |
| `DATABRICKS_DEST_TOKEN` | `dapi_xxxxxxxxxxxxxxxx` |

### 4️⃣ Verificar Storage Configuration

```python
storage_path = "abfss://raw-jptq@adlsjptq0126.dfs.core.windows.net"
```

<div align="center">

✅ **¡Configuración completa!**

</div>

---

## 💻 Uso

### 🔄 Despliegue Automático (Recomendado)

```bash
git add .
git commit -m "✨ feat: mejoras en pipeline"
git push origin master
```

**GitHub Actions ejecutará**:
- 📤 Deploy de notebooks a `/pry_smart_data/dwh_peliculas_jptq/scripts/main`
- 🔧 Creación del workflow `WF_DWH_PELICULAS_JPTQ`
- ▶️ Ejecución completa:  Bronze → Silver → Gold
- 📧 Notificaciones de resultados

### 🖱️ Despliegue Manual desde GitHub

1. Ir al tab **Actions** en GitHub
2. Seleccionar **Deploy**
3. Click en **Run workflow**
4. Seleccionar rama `main`
5. Click en **Run workflow**

### 🔧 Ejecución Local en Databricks

Navegar a `/pry_smart_data/dwh_peliculas_jptq/scripts/main` y ejecutar en orden:

```
- Preparacion_Ambiente.ipynb                  # Preparacion Ambiente
- NB_Carga_Catalogo_Peliculas.ipynb           # Bronze Zone
- NB_Carga_Detalle_Peliculas.ipynb            # Bronze Zone
- NB_Carga_Mas_Info_Peliculas.ipynb           # Bronze Zone
- NB_Carga_Ruta_Poster_Peliculas.ipynb        # Bronze Zone
- NB_Transformacion_Director_Pelicula.ipynb   # Silver Zone
- NB_Transformacion_Genero_Pelicula.ipynb     # Silver Zone
- NB_Transformacion_Idioma_Pelicula.ipynb     # Silver Zone
- NB_Transformacion_Peliculas.ipynb           # Silver Zone
- NB_Dimension_Director_Pelicula_T2.ipynb     # Gold Zone
- NB_Dimension_Genero_Pelicula_T0.ipynb       # Gold Zone
- NB_Dimension_Idioma_Pelicula_T0.ipynb       # Gold Zone
- NB_Dimension_Pelicula_T1.ipynb              # Gold Zone
- NB_Fct_Table_Pelicula.ipynb                 # Gold Zone
```

---


## 🔄 CI/CD

### Pipeline de GitHub Actions

```yaml
Workflow: Deploy ETL Apple Sales And Warranty
├── Deploy notebooks → /pry_smart_data/dwh_peliculas_jptq/scripts/main
├── Eliminar workflow antiguo (si existe)
├── Buscar cluster configurado
├── Crear nuevo workflow con 4 tareas
├── Ejecutar pipeline automáticamente
└── Monitorear y notificar resultados
```

### 🔄  Workflow Databricks
![Workflow](https://github.com/JPTQ96/Smart_Data_Databricks/blob/main/evidencias/WorkFlow_DWH_Peliculas.png)
![Workflow_Ejecucion](https://github.com/JPTQ96/Smart_Data_Databricks/blob/main/evidencias/WorkFlow_DWH_Peliculas_Ejecucion.png)
![Workflow_Ejecucion_2](https://github.com/JPTQ96/Smart_Data_Databricks/blob/main/evidencias/WorkFlow_DWH_Peliculas_Ejecucion_2.png)
```


⏰ Schedule: Diario 8:00 AM (Lima)
⏱️ Timeout total: 4 horas
 🔒 Max concurrent runs: 1
⏰ Notificaciones: 
      success: juanpis602@hotmail.com
      failed:  juanpis602@hotmail.com
```

---

## 📈 Dashboards
https://github.com/guaru/project-databricks/tree/dev/dashboards

## 🔍 Monitoreo

### En Databricks

**Workflows**:
- Ir a **Workflows** en el menú lateral
- Buscar `WF_DWH_PELICULAS_JPTQ`
- Ver historial de ejecuciones

**Logs por Tarea**:
- Click en una ejecución específica
- Click en cada tarea para ver logs detallados
- Revisar stdout/stderr en caso de errores

### En GitHub Actions

- Tab **Actions** del repositorio
- Ver historial de workflows
- Click en ejecución específica para detalles
- Revisar logs de cada step

---

## 👤 Autor

<div align="center">

### Juan Pablo Torres Quintero

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/juan-pablo-torres-quintero-02263449/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/JPTQ96)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:juanpis602@hotmail.com)

**Ing. de Sistemas / Esp. Desarrollo de Base de Datos** | **Conusltor BI / Lider Tecnico**

</div>

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

<div align="center">

**Proyecto**: Data Engineering - Arquitectura Medallion - Smart Data 
**Tecnología**: Azure Databricks + Delta Lake + CI/CD  
**Última actualización**: 2026


</div>
