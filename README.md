# ERP (Docker basado en Odoo v12)

## Cómo clonar este repositorio¿?
  * Agregue su id_pulbic (ssh) a la configuración de su cuenta en [gitlab](https://docs.gitlab.com/ee/ssh/).
  * Clone el repositorio con el proyecto: `git clone --recurse-submodules https://github.com/yanpierchirino/erp.git`

## Configuración de su entorno de desarrollo
Independientemente de la plataforma, debe tener acceso una copia desprotegida del código.

### ... en Linux / MacOS
  * Asegúrese de que [Docker](https://docs.docker.com/install/) y [Docker-Compose](https://docs.docker.com/compose/install/) estén instalados, según el método preferido de su distribución .
  * Asegurate de tener los permisos necesarios sobre el directorio del proyecto, ejecuta `sudo chmod -R 777 erp`
  * valla a su directorio del código clonado `cd erp`
  * Ejecutar en la terminal `make init`

Su entorno de desarrollo ya está configurado!

## Desarrollando
Edite su código en su escritorio usando cualquier editor de su elección.

Con el depurador web habilitado (que es por defecto wdb) cualquier excepción que ocurra
resultará en un enlace cliqueable en los registros de Odoo.

  * `docker-compose up erp` te dará una instalación de Odoo ejecutándose en http://localhost:8069 con habilitación de recarga de código activo y configuración del depurador web.
  * `make build` reconstruira las imagenes base y de desarrollo agregando los nuevos cambios hechos en los archivos Dockerfile correspondientes.

Investigue docker-compose.yml para obtener información adicional.

Por favor, desarrolle nuevos modulos en nuevas ramas git y envíe solicitudes de fusion (merge request) contra la rama principal.

<br/>
<br/>
<br/>
<br/>

# ¿Cómo hacer un commit a git correctamente?

------------------ Encabezado ---------------> | <----- n / a ---- ---> |

------------------ Cuerpo (opcional) --------------------------- - > |

------------------ Pie de página (opcional) --------------------------> |


### Especificación del encabezado:

`<type> (<scope>): (Esta confirmación será ...) <acción de confirmación>`


### Ejemplo:

 chore (scaffold): extraer un nuevo tmpl de confirmación

 Antes de eso, era difícil para la gente entender la importancia de
 comprometer la disciplina para crear software de alta calidad y mantener
 Alta eficiencia. Con commitlint, el equipo puede estandarizar en uno
 lenguaje común estructurado para poner a todos en la misma página.

 Fecha 123, parte de [345], resolve! [657]


### El tipo puede ser
* feat (nueva función)
* fix (corrección de errores)
* refactor (refactorización; sin cambio funcional)
* style (formato; sin cambio de código)
* doc (cambios de documentación)
* test (agregando o refactorizando pruebas; sin cambios en el código de producción)
* runtime (modificación del entorno de tiempo de ejecución)
* chore (cambios de herramienta; sin cambios de código)
* mig (agregando o refactorizando migraciones; sin cambios en el código de producción)
* revert (revertir citas incorrectas de cualquier tipo)
* hack (solución temporal para que las cosas se muevan; evítelo)


### Recuerda:
 * escribe todo en minúsculas
 * use humor imperativo en la línea de asunto
 * no termina el tema con un punto
 * sujeto separado del cuerpo con línea en blanco
 * usa el cuerpo para explicar qué y por qué (intención) versus cómo
 * puede usar varias líneas con "-" o "*" para los marcadores corporales
