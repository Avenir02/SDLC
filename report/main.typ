#import "@preview/typo-stp:0.1.1": *

#include "document/front-page-sdlc.typ"

#show: template

#include "document/report.typ"

#appendix(
  "обязательное",
  "Листинг кода"
)

#source-text(
  path("srs.md"),
  "Файл SRS ",
)


