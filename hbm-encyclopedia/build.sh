#!/bin/sh
# Assemble the encyclopedia from the orchestrator shell + agent-written parts.
#   artifact.html : fragment for the claude.ai Artifact tool (it adds its own skeleton)
#   index.html    : complete standalone page for GitHub Pages
cd "$(dirname "$0")"
cat parts/head.html parts/part1.html parts/part2.html parts/part3.html parts/tail.html > artifact.html
{
  cat <<'HTML'
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="color-scheme" content="light dark">
<meta name="description" content="중학생도 이해할 수 있는 HBM 메모리 제조공정 백과사전">
HTML
  sed -n '1,2p' artifact.html | grep -v 'claude:viewport'
  echo '<style>html{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  echo '</head>'
  echo '<body>'
  sed '1,2d' artifact.html
  echo '</body>'
  echo '</html>'
} > index.html
echo "built artifact.html ($(wc -c < artifact.html) bytes), index.html ($(wc -c < index.html) bytes)"
