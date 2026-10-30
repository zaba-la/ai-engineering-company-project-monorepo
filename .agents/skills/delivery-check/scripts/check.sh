#!/usr/bin/env bash
# Comprueba el protocolo de entrega de TrackFlow. Ver ../SKILL.md.
# Salida: 0 = GO, 1 = NO-GO, 2 = error de uso.
set -u

base="main"
allowed=""

while [ $# -gt 0 ]; do
  case "$1" in
    --base)
      [ $# -ge 2 ] || { echo "Falta el valor de --base" >&2; exit 2; }
      base="$2"; shift 2 ;;
    --allow)
      [ $# -ge 2 ] || { echo "Falta el valor de --allow" >&2; exit 2; }
      allowed="$allowed
$2"; shift 2 ;;
    *)
      echo "Argumento desconocido: $1" >&2; exit 2 ;;
  esac
done

root=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "No es un repositorio Git" >&2; exit 2; }
cd "$root" || exit 2
git rev-parse --verify --quiet "$base^{commit}" >/dev/null || { echo "Rama base no encontrada: $base" >&2; exit 2; }

failed=0
result() { # id, descripción, detalle (vacío = PASS)
  if [ -z "$3" ]; then
    echo "PASS $1 $2"
  else
    echo "FAIL $1 $2"
    echo "$3" | sed 's/^/     - /'
    failed=1
  fi
}

merge_base=$(git merge-base "$base" HEAD)
changed=$( { git diff --name-only "$merge_base"; git ls-files --others --exclude-standard; } | sort -u)

# C1: rama
branch=$(git branch --show-current)
case "$branch" in
  feature/*|fix/*|docs/*|chore/*) issue="" ;;
  *) issue="Rama no válida: ${branch:-HEAD desacoplado}" ;;
esac
result C1 "Rama de trabajo" "$issue"

# C2: infraestructura
issue=""
for file in BRIEFING.md AGENTS.md memory-bank/projectbrief.md memory-bank/techContext.md \
  memory-bank/domainRules.md memory-bank/progress.md; do
  [ -s "$file" ] || issue="$issue
Falta o está vacío: $file"
done
ls .agents/rules/*.md >/dev/null 2>&1 || issue="$issue
No hay reglas en .agents/rules/"
ls .agents/skills/*/SKILL.md >/dev/null 2>&1 || issue="$issue
No hay skills en .agents/skills/"
result C2 "Infraestructura de agentes" "$(echo "$issue" | sed '/^$/d')"

# C3: contexto de TrackFlow
issue=""
for file in BRIEFING.md memory-bank/projectbrief.md memory-bank/techContext.md; do
  grep -q "TrackFlow" "$file" 2>/dev/null || issue="$issue
Sin contexto de TrackFlow: $file"
done
grep -qiE "placeholder|<company>" BRIEFING.md 2>/dev/null && issue="$issue
BRIEFING.md conserva texto de plantilla"
for value in "90 %" "30 días" "18 USD" "16 EUR" "Carlos Vega" "Sofía Ramos" "Miguel Torres"; do
  grep -q "$value" memory-bank/domainRules.md 2>/dev/null || issue="$issue
Falta en domainRules.md: $value"
done
result C3 "Contexto de TrackFlow" "$(echo "$issue" | sed '/^$/d')"

# C4: carpetas de primer nivel
issue=""
top_level=$( { git ls-files; git ls-files --others --exclude-standard; } | grep '/' | cut -d/ -f1 | sort -u)
for dir in $top_level; do
  case "$dir" in
    .agents|.devcontainer|.github|uis|services|data|agents|skills|mcps|workflows|packages|shared|docs|infra|scripts|internal|memory-bank) ;;
    *) issue="$issue
Carpeta fuera del mapa: $dir/" ;;
  esac
done
result C4 "Estructura del monorepo" "$(echo "$issue" | sed '/^$/d')"

# C5: progreso actualizado
issue=""
if [ -n "$changed" ] && ! echo "$changed" | grep -qx "memory-bank/progress.md"; then
  issue="Hay cambios en la rama sin actualizar memory-bank/progress.md"
fi
result C5 "Banco de memoria al día" "$issue"

# C6: zonas protegidas
issue=""
for file in $changed; do
  case "$file" in
    BRIEFING.md|CONTEXT.md|CONTEXT.es.md|AGENTS.md|.agents/rules/*|.devcontainer/*|infra/*|.github/*|docker-compose.yml|data/raw/*|packages/shared/*|agents/_template/*|skills/_template/*|pnpm-lock.yaml|uv.lock)
      echo "$allowed" | grep -qxF "$file" || issue="$issue
Sin confirmación: $file" ;;
  esac
done
result C6 "Zonas protegidas" "$(echo "$issue" | sed '/^$/d')"

# C7: secretos
issue=""
for file in $changed; do
  case "$file" in
    .env|*/.env|.env.*|*/.env.*)
      case "$file" in
        *.example) ;;
        *) issue="$issue
Archivo de entorno: $file" ;;
      esac ;;
  esac
done
pattern='(sk-[A-Za-z0-9_-]{20,}|ghp_[A-Za-z0-9]{30,}|AKIA[0-9A-Z]{16}|BEGIN [A-Z ]*PRIVATE KEY)'
for file in $changed; do
  [ -f "$file" ] || continue
  grep -qE "$pattern" "$file" 2>/dev/null && issue="$issue
Posible secreto en: $file"
done
result C7 "Secretos" "$(echo "$issue" | sed '/^$/d')"

if [ "$failed" -eq 0 ]; then
  echo "GO"
  exit 0
fi
echo "NO-GO"
exit 1
