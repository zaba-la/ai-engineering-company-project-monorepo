---
name: delivery-check
description: Comprueba si una rama de TrackFlow cumple el protocolo de entrega y da un veredicto GO o NO-GO. Úsala antes de cada commit final y antes de abrir un PR.
---

# delivery-check

## Objetivo

Dar un veredicto `GO` o `NO-GO` sobre si una rama cumple el protocolo de entrega de TrackFlow.

Esta skill no corrige nada: informa. Tampoco sustituye a los linters ni a los tests del proyecto.

## Cuándo usarla

- En el paso 6 del flujo de `AGENTS.md`.
- Antes de abrir un PR hacia `main`.

## Inputs

| Input | Obligatorio | Por defecto | Descripción |
| --- | --- | --- | --- |
| `--base <rama>` | No | `main` | Rama con la que se compara |
| `--allow <ruta>` | No | Ninguno | Ruta protegida cuyo cambio confirmó el desarrollador. Se repite por cada ruta |

Requisitos: un repositorio Git con la rama base disponible, y `bash` y `git` instalados.

## Uso

Ejecuta desde la raíz del repositorio:

```bash
bash .agents/skills/delivery-check/scripts/check.sh --base main
```

Usa `--allow` solo si el desarrollador confirmó ese cambio en la conversación. Nunca lo añadas por tu cuenta para conseguir un `GO`.

## Comprobaciones

| ID | Comprueba | Falla si |
| --- | --- | --- |
| C1 | Rama | Es `main` o no empieza por `feature/`, `fix/`, `docs/` o `chore/` |
| C2 | Infraestructura | Falta `BRIEFING.md`, `AGENTS.md`, un archivo del banco de memoria o una regla o skill |
| C3 | Contexto TrackFlow | El briefing o el banco de memoria no son de TrackFlow, tienen texto de plantilla o perdieron una regla clave |
| C4 | Estructura | Hay una carpeta de primer nivel fuera del mapa del monorepo |
| C5 | Progreso | Hay cambios en la rama y `memory-bank/progress.md` no está entre ellos |
| C6 | Zonas protegidas | Cambia una ruta protegida no incluida en `--allow` |
| C7 | Secretos | Se añade un archivo `.env` o una línea con forma de clave o token |

## Output

Una línea `PASS` o `FAIL` por comprobación y una línea final con el veredicto:

| Código de salida | Veredicto | Significado |
| --- | --- | --- |
| `0` | `GO` | Pasan todas las comprobaciones |
| `1` | `NO-GO` | Falla al menos una comprobación |
| `2` | — | Error de uso o rama base no encontrada |

## Pasos

1. Ejecuta el script con la rama base correcta.
2. Con `NO-GO`, corrige la causa de cada `FAIL` y vuelve a ejecutarlo.
3. Con `GO`, continúa con el commit y copia el resultado en la descripción del PR.

## Criterios de aceptación

- [ ] El script termina con código `0` en una rama que cumple el protocolo.
- [ ] El script termina con código `1` e imprime `FAIL C1` en `main`.
- [ ] El script imprime `FAIL C4` si se crea un archivo en `frontend/`.
- [ ] El script imprime `FAIL C5` si cambia `services/` y no cambia `memory-bank/progress.md`.
- [ ] El script imprime `FAIL C6` si cambia `BRIEFING.md` sin `--allow BRIEFING.md`.
- [ ] El script imprime `FAIL C7` si se añade un archivo `.env`.
- [ ] El script termina con código `2` si la rama base no existe.
- [ ] El script no modifica ningún archivo del repositorio.
