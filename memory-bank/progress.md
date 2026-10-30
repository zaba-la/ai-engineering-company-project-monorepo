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
- [x] `CONTEXT.md` y `CONTEXT.es.md` sustituidos por el briefing de TrackFlow en inglés y español.
- [x] `.gitignore` añadido.

## En curso

- Nada en curso.

## Próximos pasos

1. Crear `uis/website` y `uis/backoffice` en las rutas del mapa de `techContext.md`.
2. Crear `services/api` con FastAPI y un primer router de seguimiento.
3. Decidir base de datos, proveedor de LLM y vector store, y registrarlo en `docs/`.
4. Definir la evaluación del agente de CX en `data/eval/` antes de construirlo.

## Dudas abiertas

Ninguna que bloquee el trabajo.

## Decisiones sobre discrepancias

| Discrepancia | Decisión |
| --- | --- |
| El briefing da dos nombres para el CEO (Thomas Harry y Thomas Espinoza) | Se usa Thomas Harry, que figura como fundador y CEO. `BRIEFING.md` se mantiene como copia literal |
| Versiones distintas del contexto en `CONTEXT.md` y `CONTEXT.es.md` | Sustituidas por el briefing; manda `BRIEFING.md` |
| «8 transportistas» cuenta DHL dos veces | Se modelan 8 relaciones transportista-país |
| DHL España no tiene criterio de uso documentado | Queda sin prioridad en las reglas de selección; se usa como alternativa cuando no aplica otro criterio |
| El portal público de seguimiento no tenía ruta | Será una ruta de `uis/website`: `/tracking` |

## Registro de cambios relevantes

| Fecha | Cambio |
| --- | --- |
| 2026-10-30 | Creada la infraestructura de agentes del monorepo. |
| 2026-10-30 | Resueltas las discrepancias del briefing y añadidos `CONTEXT` y `.gitignore`. |
