# Contexto técnico — TrackFlow

## Estado del repositorio

Hoy el monorepo contiene estructura y documentación. **No hay aplicaciones ejecutables**, ni `package.json` o `pyproject.toml` en la raíz, ni `docker-compose.yml`, ni CI. El `.gitignore` está vacío.

## Stack

| Capa | Tecnología | Estado | Origen |
| --- | --- | --- | --- |
| Entorno | Devcontainer con Ubuntu 24.04, Python 3.12, Node 22 y Docker | Decidido | `.devcontainer/devcontainer.json` |
| Paquetes | `pnpm` (JS) y `uv` (Python) | Decidido | `postCreateCommand` del devcontainer |
| Backend | FastAPI centralizada | Decidido | `README.md` de la plantilla |
| Tipos compartidos | TypeScript, `@repo/shared-types` | Decidido | `packages/shared/` |
| Automatización | n8n (puerto 5678) | Previsto | `workflows/` y devcontainer |
| Frontend | React con TypeScript; framework por confirmar | Por decidir | Al crear `uis/website` |
| Base de datos | — | Por decidir | Pendiente de ADR en `docs/` |
| Proveedor de LLM y vector store | — | Por decidir | Pendiente de ADR en `docs/` |

Puertos reservados por el devcontainer: 3000 (frontend), 8000 (API) y 5678 (n8n).

## Mapa del monorepo

Esta tabla es obligatoria. **No se crean árboles paralelos** como `apps/`, `frontend/`, `backend/`, `api/` o `web/` en la raíz.

| Ruta | Qué va aquí | Notas |
| --- | --- | --- |
| `uis/website` | Web pública corporativa | Inicio en `/`; marca y textos alineados con `BRIEFING.md` |
| `uis/backoffice` | App interna | Layout propio, separado de la web; entrada en `/`; dashboards internos |
| `uis/` (otras) | Otras interfaces | Solo con una necesidad distinta y su propio README |
| `services/` | APIs y workers | Una API FastAPI central, previsiblemente `services/api`, con un router por dominio |
| `data/` | Datos | Flujo `raw` → `pipelines` → `process`; calidad en `eval` |
| `agents/` | Agentes de producto | Un agente por subcarpeta, desde `agents/_template/` |
| `skills/` | Skills de producto | Las que usan los agentes de la empresa |
| `mcps/` | Servidores MCP | Uno por subcarpeta |
| `workflows/` | Flujos n8n y orquestación | Disparadores, credenciales y errores documentados |
| `packages/` | Código versionable compartido | Si lo usan dos carpetas o más |
| `shared/` | Esquemas, plantillas y assets | Material reutilizable que no es una librería |
| `docs/` | Arquitectura y ADR | Decisiones transversales |
| `infra/` | Docker, despliegue y CI/CD | `docker-compose.yml` va en la raíz |
| `scripts/` | Scripts sueltos | Documentar parámetros y uso |
| `internal/` | CLIs internas | Con dependencias y tests propios |

`.agents/` configura el agente de código con el que se desarrolla. `agents/` y `skills/` son producto. Nunca se mezclan.

## Decisiones tomadas

| # | Decisión | Motivo |
| --- | --- | --- |
| 1 | Un único monorepo basado en la plantilla | Todo el trabajo de TrackFlow Tech comparte contexto y estructura |
| 2 | Una API central con routers por dominio, sin microservicios tempranos | Reduce complejidad; un worker se extrae solo si hace falta |
| 3 | `BRIEFING.md` es la fuente de verdad del negocio | Evita que cada agente trabaje con otro contexto |
| 4 | `carrier` se modela por país, no solo por marca | DHL opera en los dos países con coberturas distintas |
| 5 | El modelo de datos admite país, moneda y zona horaria desde el principio | El SLA, las tarifas y la operación difieren por país |

## Restricciones técnicas

- **Sistemas existentes:** dos sistemas de almacén, un ERP de principios de los 2010, scripts Python sin documentar y bases de datos en dos proveedores cloud. Hay que integrarse con ellos sin asumir que están documentados.
- **Disponibilidad:** el agente de CX, el portal de seguimiento y el dashboard de operaciones deben estar siempre disponibles.
- **Idiomas:** español e inglés en lo que vea el cliente; se puede empezar por un idioma base.
- **Integraciones:** seguimiento a través de 8 relaciones con transportistas, con formatos de datos distintos.
- **Datos personales:** los datos de destinatarios y empleados no se versionan sin anonimizar. Se tratan bajo dos marcos legales, EE. UU. y España.
- **Secretos:** solo en variables de entorno; nunca en el repositorio.
