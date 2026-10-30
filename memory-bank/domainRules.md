# Reglas de negocio — TrackFlow

> Valores para implementar sin adivinar. Proceden de los documentos de contexto de TrackFlow del programa (`00-general-contexts/trackflow`). Si una regla cambia, se actualiza aquí en el mismo PR.

## Entregas (SLA)

| Servicio | Plazo | Alcance |
| --- | --- | --- |
| Estándar | 3–5 días hábiles | Dentro del mismo país |
| Express | 24–48 horas | Solo metropolitana de Los Ángeles y área Zaragoza-Madrid |
| Internacional | 7–12 días hábiles | EE. UU. ↔ España, sujeto a aduana; TrackFlow no controla la retención aduanera |

- El SLA contractual es del **90 % de entregas a tiempo al mes, medido por país**.
- Por debajo del 90 % durante dos meses consecutivos, el cliente puede reclamar una compensación del 5 % sobre la tarifa mensual de ese país.
- No hay garantía en días de alta demanda declarados (Black Friday, Navidad, Rebajas de enero en España). Los plazos pueden alargarse hasta un 40 % y hay que avisar a los clientes con antelación.

## Transportistas

| País | Transportista | Uso |
| --- | --- | --- |
| EE. UU. | UPS | Cobertura nacional; mejor tarifa para más de 5 kg |
| EE. UU. | FedEx | Mejor plazo en express dentro de California |
| EE. UU. | DHL | Única opción fiable para internacional desde Los Ángeles |
| España | SEUR | Mejor cobertura en zonas rurales de Aragón |
| España | MRW | Mejor tarifa para menos de 2 kg |
| España | DHL | Disponible en España; sin criterio de uso documentado |
| España | 2 locales | Solo área metropolitana de Zaragoza |

El sistema elige transportista según destino, peso, tipo de producto y urgencia. Un cambio manual solo es posible como excepción aprobada por Carlos Vega.

## Devoluciones

- La ventana estándar es de **30 días desde la entrega**, salvo que el contrato de la marca fije otra.
- La etiqueta se genera automáticamente si el motivo está en las reglas configuradas por la marca.
- La inspección clasifica el producto en: apto para reventa, apto para reacondicionar o no apto (descarte).
- El envío de vuelta lo paga la marca, salvo error de TrackFlow (daño en tránsito o entrega equivocada).
- Las devoluciones internacionales quedan fuera del proceso automático: las gestiona a mano el equipo de Sofía Ramos.
- TrackFlow no reacondiciona ni revende por cuenta propia: ejecuta las reglas de cada marca.

## Almacenamiento

- Se cobra por volumen, no por unidades: **18 USD/m³ al mes en Los Ángeles y 16 EUR/m³ al mes en Zaragoza**.
- Los primeros 30 días de un producto nuevo no generan cargo.
- Más de 180 días sin movimiento: 150 % de la tarifa estándar desde el día 181.
- Con más de 50 m³ de media mensual se puede negociar una tarifa preferencial, siempre a través de Miguel Torres. Un account manager no puede ofrecer descuentos.

## Límites del agente de CX

- Puede informar de estados, reenviar enlaces de seguimiento y explicar políticas.
- Escala a una persona, con resumen y urgencia, si el cliente está frustrado o el caso es complejo.
- No promete compensaciones, descuentos ni excepciones.
- No resuelve devoluciones internacionales: las deriva al equipo de Sofía Ramos.

## Discrepancias abiertas

Están en la sección «Dudas abiertas» de [`progress.md`](./progress.md).
