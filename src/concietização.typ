#import "model.typ": prova_model
#import "@preview/ctz-euclide:0.1.5": *

#show: prova_model.with(
  title: [Educação Sexual],
)

#show link: set text(hyphenate: true, blue)

= Sexualidade

#lorem(100)

= Consentimento

algu

== Como Identificar um caso de Abuso?

#lorem(100)

#link("https://www.childhood.org.br/acoes-e-iniciativas/entenda-a-diferenca-entre-abuso-e-exploracao-sexual/")[]

== O que Fazer em caso de Abuso?

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