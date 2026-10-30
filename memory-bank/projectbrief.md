# Project brief — TrackFlow

> Resumen operativo de [`BRIEFING.md`](../BRIEFING.md). Si algo no coincide, manda `BRIEFING.md` y se anota aquí la discrepancia.

## El negocio

TrackFlow es una empresa de entrega de última milla y gestión de almacenes fundada en 2009 en Los Ángeles. Almacena el inventario de marcas de e-commerce, prepara los pedidos, los envía por una red de transportistas y gestiona las devoluciones.

| Dato | Valor |
| --- | --- |
| Mercados | Estados Unidos y España |
| Almacenes | Los Ángeles y Zaragoza |
| Plantilla | ~130 personas (~70 operarios de almacén) |
| Facturación | ~9 M€ al año |
| Transportistas | 8 relaciones: UPS, FedEx y DHL (EE. UU.); MRW, SEUR, DHL y 2 locales (España) |
| Clientes | Marcas (B2B, contrato anual) y consumidores finales (B2C, reciben el paquete) |

## El problema

TrackFlow tiene buenos clientes y operación, pero no la infraestructura para gestionar dos países a escala:

- Los dos almacenes usan sistemas distintos (software comercial y hoja de cálculo) y no ven el inventario del otro.
- La asignación y el seguimiento de transportistas son manuales, y no hay datos históricos de rendimiento.
- Cada devolución (18–25 % del volumen) pasa por revisión humana.
- 15 agentes responden por email, WhatsApp y teléfono sin tickets ni base de conocimiento. El 80 % de las consultas podría automatizarse y no hay cobertura fuera de horario.
- Comercial no tiene CRM y hace los informes a clientes a mano.
- Personas gestiona dos marcos laborales sin sistema.
- Tecnología no tiene telemetría centralizada, y desplegar lleva de 1 a 2 semanas.
- Dirección decide con un informe manual que ya tiene hasta dos días de antigüedad.

## El proyecto

**TrackFlow Tech** es la unidad interna creada para construir los sistemas, integraciones y automatizaciones que resuelvan lo anterior. Este monorepo es el único espacio donde vive ese trabajo.

**Primer caso de uso elegido** ([`company-choice.md`](../company-choice.md)): agente de primera línea de Experiencia del Cliente, 24/7, en español e inglés. Resuelve el estado de envíos y devoluciones, reenvía enlaces de seguimiento y explica políticas. Escala a una persona con resumen y urgencia los casos complejos o con clientes frustrados.

## Objetivos y dónde se miden

| Objetivo del negocio | Métrica | Responsable | Módulo previsto |
| --- | --- | --- | --- |
| Cumplir el SLA contractual | ≥ 90 % de entregas a tiempo al mes, por país | Carlos Vega | `services/api` (seguimiento) + dashboard en `uis/backoffice` |
| Reducir la carga de CX | % de consultas resueltas sin humano (potencial: 80 %) | Valentina Cruz | `agents/` (agente de CX) + `data/eval/` |
| Dar cobertura fuera de horario | Consultas atendidas fuera de oficina (hoy: 0) | Valentina Cruz | `agents/` (agente de CX) |
| Inventario común | Stock por SKU y almacén en tiempo real | Ana Whitfield | `services/api` (inventario) |
| Automatizar devoluciones | % aprobadas por reglas de cada marca | Sofía Ramos | `services/api` (devoluciones) |
| Retener clientes | Alertas de renovación a 90 y 30 días | Miguel Torres | `workflows/` + `uis/backoffice` |
| Informe ejecutivo sin trabajo manual | Informe automático los lunes a las 7:00 | CEO | `data/pipelines/` + `workflows/` |
| Detectar incidencias sin WhatsApp | Alertas automáticas de fallo | Andrés Kim | `infra/` + `services/api` |

Los módulos son previsión: aún no existe ninguno. El estado real está en [`progress.md`](./progress.md).

## Personas de referencia

| Área | Responsable |
| --- | --- |
| Tecnología (CTO, Zaragoza) | Andrés Kim |
| Operaciones de Almacén | Ana Whitfield |
| Última Milla y Transportistas | Carlos Vega |
| Logística Inversa | Sofía Ramos |
| Experiencia del Cliente | Valentina Cruz |
| Comercial y Relación con Clientes | Miguel Torres |
| Personas | Rafael Sanz |

Las reglas de negocio están en [`domainRules.md`](./domainRules.md).
