# Progreso — TrackFlow

Última actualización: 2026-10-30

## Estado actual

Fase de cimientos. El repositorio tiene contexto e infraestructura para agentes, pero **todavía no hay código de producto**.

## Hecho

- [x] Empresa elegida y primera idea de agente documentada (`company-choice.md`).
- [x] `BRIEFING.md` de TrackFlow copiado en la raíz.
- [x] Banco de memoria creado: `projectbrief.md`, `techContext.md`, `domainRules.md` y `progress.md`.
- [x] `AGENTS.md` con lecturas iniciales, flujo previo al commit y zonas protegidas.
- [x] Reglas en `.agents/rules/` con alcance explícito.
- [x] Skill `delivery-check` con script de comprobación.

## En curso

- [ ] PR de `feature/agent-memory-bank` hacia `main`, pendiente de revisión.

## Próximos pasos

1. Sustituir o retirar el `CONTEXT.md` de la plantilla, que sigue siendo un placeholder.
2. Añadir `.gitignore` (`.env*`, `node_modules/`, `.venv/`, artefactos de build).
3. Crear `uis/website` y `uis/backoffice` en las rutas del mapa de `techContext.md`.
4. Crear `services/api` con FastAPI y un primer router de seguimiento.
5. Decidir base de datos, proveedor de LLM y vector store, y registrarlo en `docs/`.
6. Definir la evaluación del agente de CX en `data/eval/` antes de construirlo.

## Dudas abiertas

| Duda | Criterio provisional | Quién decide |
| --- | --- | --- |
| El nombre del CEO no es coherente: `BRIEFING.md` dice Thomas Harry y Thomas Espinoza; `CONTEXT.es.md` dice Thomas Harry y Daniel Espinoza | Usar Thomas Harry, que es quien figura como fundador y CEO | Tech lead |
| `CONTEXT.es.md` no incluye el área de Personas y `CONTEXT.md` lista TrackFlow como México + España | Manda `BRIEFING.md` | Tech lead |
| «8 transportistas» cuenta DHL dos veces, una por país | Modelar 8 relaciones transportista-país | Carlos Vega |
| No hay criterio de uso documentado para DHL en España | No priorizarlo en reglas hasta confirmarlo | Carlos Vega |
| El portal público de seguimiento no tiene ruta asignada | Propuesta: una ruta dentro de `uis/website` | Tech lead |

## Registro de cambios relevantes

| Fecha | Cambio |
| --- | --- |
| 2026-10-30 | Creada la infraestructura de agentes del monorepo. |
