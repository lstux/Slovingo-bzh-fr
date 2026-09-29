#!/usr/bin/env bash
# Patch bzh-fr : ajoute subgroup_themes et corrige les clés subgroups (retire le préfixe "series_").
set -euo pipefail
cd "$(dirname "$0")"
jq '
  .subgroups |= with_entries(.key |= sub("^series_"; ""))
  | .subgroup_themes = ((.subgroup_themes // {}) + {
      familh:"family", ti:"house", boued:"food", amzer:"time",
      prenan:"shopping", kaer:"city", heol:"weather", traezh:"sea"
    })
' lang.json > lang.json.tmp && mv lang.json.tmp lang.json
echo "lang.json patché."
