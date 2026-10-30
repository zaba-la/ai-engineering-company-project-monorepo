---
description: Úsala al cerrar una tarea, tomar una decisión de arquitectura o detectar información desactualizada en el banco de memoria
scope: agent-requested
---

# Mantenimiento del banco de memoria

**Alcance: solicitada por el agente.** Cárgala cuando la tarea cambie el estado del proyecto.

| Si ocurre esto | Actualiza |
| --- | --- |
| Se termina o se empieza una tarea | `memory-bank/progress.md` |
| Cambia el stack o la arquitectura | `memory-bank/techContext.md` y un ADR en `docs/` |
| Cambia un valor o proceso de negocio | `memory-bank/domainRules.md` |
| Cambian los objetivos o el alcance | `memory-bank/projectbrief.md` |
| Aparece una contradicción | Sección «Dudas abiertas» de `progress.md` |

- Escribe hechos comprobables con fechas absolutas. No escribas intenciones como si estuvieran hechas.
- Marca como hecho solo lo que exista en el repositorio.
- Actualiza `Última actualización` en `progress.md`.
- Corrige o elimina la información desactualizada. No la dejes junto a la nueva.
