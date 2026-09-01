#import "model.typ": prova_model
#import "@preview/ctz-euclide:0.1.5": *

#show: prova_model.with(
  title: [Educação Sexual],
)

#show link: set text(hyphenate: true, blue)

= Sexualidade

= Consentimento

== Abuso Sexual

#underline(link("https://www.gov.br/mulheres/pt-br/ligue180")[Central de Atendimento as Mulheres - 180])

= Relações Sexuais

== ISTs

#table(
  columns: (auto, auto, auto, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [Nome], [Via de Infecção], [Sintomas], [Tratamento],
  ),
  [Gonorreia], [], [], [],
  [HIV], [], [], [Coquetel de remédios],
  [Herpes], [], [], [],
)

== Maternidade
