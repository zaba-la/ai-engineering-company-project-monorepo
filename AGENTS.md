# AGENTS.md — TrackFlow

Protocolo para cualquier agente de código que trabaje en este monorepo. Aquí se construyen los sistemas de **TrackFlow Tech**: logística de última milla y almacenes en Estados Unidos y España.

## 1. Al empezar cada sesión

Lee estos archivos en este orden antes de modificar nada:

1. `memory-bank/projectbrief.md` — negocio, problema y objetivos.
2. `memory-bank/techContext.md` — stack, mapa del monorepo y restricciones.
3. `memory-bank/domainRules.md` — SLA, transportistas, devoluciones y tarifas.
4. `memory-bank/progress.md` — estado actual, próximos pasos y dudas abiertas.

Consulta `BRIEFING.md` si necesitas más detalle del negocio. Si contradice al banco de memoria, manda `BRIEFING.md`: avisa de la discrepancia y anótala en `progress.md`.

Después carga las reglas de `.agents/rules/` que apliquen, según el alcance de cada una. Lee también el `README.md` de la carpeta en la que vayas a trabajar.

## 2. Flujo obligatorio antes de cada commit

Sigue los pasos en orden. Si uno falla, corrígelo y vuelve a ese paso.

1. **Comprueba la rama y el alcance.** Trabaja en una rama `feature/`, `fix/`, `docs/` o `chore/`, nunca en `main`. Ejecuta `git status` y `git diff --stat`, y retira lo que no pertenezca a la tarea.
2. **Comprueba la ubicación.** Confirma que cada archivo nuevo está en la ruta que indica el mapa de `techContext.md` y que no tocas zonas protegidas sin confirmación.
3. **Ejecuta los checks del proyecto modificado.** En Python: `uv run ruff check .` y `uv run pytest`. En JS/TS: `pnpm lint`, `pnpm typecheck` y `pnpm test`. Si el proyecto aún no los tiene, dilo en la descripción del PR; no los des por superados.
4. **Contrasta las reglas de negocio.** Si el cambio afecta a SLA, transportistas, devoluciones o tarifas, compara cada valor con `memory-bank/domainRules.md`.
5. **Actualiza el banco de memoria.** Refleja el cambio en `memory-bank/progress.md` y, si cambió una decisión o una regla, en `techContext.md` o `domainRules.md`.
6. **Ejecuta la skill `delivery-check`.** Sigue `.agents/skills/delivery-check/SKILL.md`. Solo continúas con el veredicto `GO`.
7. **Haz el commit.** Añade los archivos por nombre y usa Conventional Commits (`feat(tracking): ...`). No uses `--no-verify`.

## 3. Zonas protegidas

No modifiques estas rutas sin confirmación explícita del desarrollador en la conversación:

| Ruta | Motivo |
| --- | --- |
| `BRIEFING.md`, `CONTEXT.md`, `CONTEXT.es.md` | Fuente de verdad del negocio |
| `AGENTS.md`, `.agents/rules/` | Definen cómo trabaja el agente |
| `.devcontainer/` | Afecta al entorno de todo el equipo |
| `infra/`, `.github/`, `docker-compose.yml` | Despliegue y CI |
| `data/raw/` | Datos de origen, inmutables, con posibles datos personales |
| `packages/shared/` | Contrato compartido entre apps |
| `agents/_template/`, `skills/_template/` | Plantillas base |
| `pnpm-lock.yaml`, `uv.lock` | Solo cambian mediante el gestor de paquetes |
| `.env*` | Secretos: nunca se leen en voz alta, se copian ni se versionan |

## 4. Cuándo parar y preguntar

Detente y pregunta si:

- La tarea requiere una tecnología marcada como «Por decidir» en `techContext.md`.
- Necesitas inventar un valor de negocio que no esté en `domainRules.md` ni en `BRIEFING.md`.
- El cambio afecta a un solo país, pero la regla debería valer para los dos, o al revés.
- Hay que ejecutar una acción destructiva o irreversible, como una migración o un borrado de datos.
- La tarea crece más allá de lo pedido.

## 5. Dónde va cada cosa

Sigue el mapa de `memory-bank/techContext.md`. Lo esencial:

- Web pública: `uis/website`.
- App interna: `uis/backoffice`.
- APIs y workers: `services/`.
- Configuración del agente de código: `.agents/`.
- Agentes y skills de producto: `agents/` y `skills/`.
