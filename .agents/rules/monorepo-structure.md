---
description: Dónde vive cada tipo de código en el monorepo de TrackFlow
scope: always-active
---

# Estructura del monorepo

**Alcance: siempre activa.** Se aplica a cualquier archivo que se cree o se mueva.

- Coloca la web pública en `uis/website`: inicio en `/`, con marca y textos alineados con `BRIEFING.md`.
- Coloca la app interna en `uis/backoffice`: layout propio y entrada en `/`. No compartas layout con la web.
- Añade los dashboards internos de operaciones, transportistas, CX y dirección como secciones de `uis/backoffice`, no como apps nuevas.
- Añade endpoints a la API central con un router por dominio (`tracking`, `inventory`, `returns`, `carriers`). Por defecto, vive en `services/api`.
- Crea un servicio separado en `services/` solo para un worker que no pueda ejecutarse dentro de la API.
- No crees `apps/`, `frontend/`, `backend/`, `api/`, `web/` ni otra carpeta de primer nivel sin confirmación.
- Mueve a `packages/` el código que usen dos carpetas o más. No lo copies.
- Pon la configuración del agente de código en `.agents/`. Pon los agentes y skills de producto en `agents/` y `skills/`.
- Lee el `README.md` de una carpeta antes de añadirle nada. Cada app, servicio o agente nuevo lleva su propio README.
