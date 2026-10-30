---
description: Convenciones de negocio para el código que trabaja con envíos, devoluciones, inventario o tarifas
scope: file-pattern
globs:
  - services/**
  - uis/**
  - agents/**
  - mcps/**
  - workflows/**
  - data/pipelines/**
  - data/eval/**
  - packages/shared/**
---

# Dominio logístico

**Alcance: por patrón de archivo.** Se aplica al tocar las rutas de `globs`.

- Incluye `country` (`US` o `ES`) en toda entidad o métrica operativa. Nunca calcules el SLA como media global: se mide por país y por mes.
- Guarda los importes con su moneda (`USD` o `EUR`). No conviertas ni sumes monedas sin una regla aprobada.
- Guarda las fechas en UTC y muestra la hora local del almacén o del cliente. Calcula los días hábiles según el calendario del país.
- Modela el transportista como pareja transportista-país. Trata DHL EE. UU. y DHL España como registros distintos.
- Configura por marca las ventanas y reglas de devolución. Usa 30 días solo como valor por defecto.
- Envía a revisión manual las devoluciones internacionales. No las automatices.
- Lee los valores de negocio de configuración o datos. No repitas en el código el 90 %, las tarifas ni los plazos.
- No permitas elegir transportista a mano sin registrar la aprobación de Carlos Vega.
- Muestra los textos para consumidores en español e inglés cuando la funcionalidad esté disponible en ambos.
- Anonimiza nombres, direcciones, teléfonos y emails en tests, logs, fixtures y conjuntos de `data/eval/`.
