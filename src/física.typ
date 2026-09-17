#import "model.typ": *
#import "@preview/typed-physics:0.1.1": electricity as e

#show: prova_model.with(
  title: [Resumo de Física - E.M.],
)

= Forças

== Equilíbrio

== Momento de uma Força

=== Alavancas

=== Tombamento

== Trabalho de uma Força

$
  bold(tau_accent(F, arrow) = F dot d dot cos theta)
$

=== Usando Gráfico

$
  bold(tau_accent(F, arrow)) = ((50 + 20)dot 45) / 2 = 1575
$

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot, chart

    plot.plot(
      size: (10, 6),
      x-tick-step: 10,
      y-tick-step: 15,
      x-min: 0,
      x-max: 50,
      y-min: 0,
      y-max: 45,
      axis-style: "school-book",
      x-label: [#h(2.5em)d (cm)],
      y-label: $tau$,
      {
        plot.add(
          domain: (0, 50),
          samples: 100,
          style: (stroke: blue + 1.5pt),
          fill: true,
          label: "Area",
          x => if x < 30 { x } else { 30 },
        )
      }
    )
  })
]

=== Força Peso

$
  bold(tau_accent("p", arrow) = P dot h)
$

=== Força Elástica

$
  bold(tau_accent("El.", arrow) = (k dot x^2) / 2)
$

=== Potência Mecânica

$
  bold("Pot" = tau / (Delta t))
$

=== Rendimento

= Energia

== Cinética

$
  bold(E_"c" = (m dot v^2) / 2)
$

== Potencial Gravitacional

$
  bold(E_"p" = m dot g dot h)\
  "ou"\
  bold(E_"p" = tau_accent("p", arrow))
$

== Impulso

$
  bold(accent("I", arrow) = accent("F", arrow) dot Delta t)
$

== Velocidade Relativa

== Coeficiente de Restituição

== Eletrização

=== Atrito

=== Contato

=== Indução

== Eletrostática

=== Lei de Coulomb

$K = 9 dot 10^9$

$
  F = (K dot |Q| dot |q|) / d^2\
  "ou"\
  accent("F", arrow) = accent("E", arrow) dot |q|\
$

=== Campo Elétrico

$
  accent("E", arrow) = (K dot |Q|) / d^2
$

=== Campo Elétrico Resultante

$
  E_"res" = E' + E''\
  E_"res" = E' - E''\
  E^2_"res" = E'^2 + E''^2
$

=== Linhas de Força

== Potencial Elétrico

$
  VV = (K dot Q) / d
$

=== Trabalho da Força Elétrica

$
  tau_"fel" = q dot (VV_i - VV_f)
$

=== Campo Elétrico Uniforme

1. $
  E dot d = u
$ #align(center)["éd-u"\ (usar "edu" pode confundir)]

== Eletrodinâmica

1. $
  Q = i dot Delta t
$ #align(center)["Quit"]

2. $
  i = (n dot e) / (Delta t)
$

=== Consumo Elétrico e Potencia

1. $
  P = i dot u\
$

2. $
  E = P dot Delta t
$

$
  
$

=== Lei de Ohm

"O que é uma resistência elétrica?"

Quanto maior a resistência, menor o efeito jaule e menor o calor emitido.

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot, chart

    plot.plot(
      size: (10, 6),
      x-tick-step: 1.75,
      y-tick-step: 15,
      x-min: 0,
      x-max: 7,
      y-min: 0,
      y-max: 45,
      axis-style: "school-book",
      x-label: $x$,
      y-label: $y$,
      {
        plot.add(
          domain: (0, 8),
          samples: 100,
          style: (stroke: blue + 1.5pt),
          fill: false,
          label: "não ôhmico",
          x => calc.pow(x, 2),
        )
        plot.add(
          domain: (0, 8),
          samples: 100,
          style: (stroke: red + 1.5pt),
          fill: false,
          label: "ôhmico",
          x => x * 7,
        )
      }
    )
  })
]

1. $
  U = R dot i
$

2. $
  P = R dot i^2
$

3. $
  P = u^2 / R
$ #align(center)[ronronado ("Purr") em inglês]

=== "Segunda" Lei de Ohm

1. $
  R = (sigma dot l) / A
$ #align(center)["rola"]

=== Série e Paralelo

= Conversão de Medidas

$
  "mm" = 10^(-3)"m"\
  "mm"^2 = 10^(-6)"m"^2
$

= Outro

Associação em Série
$
  "Req" = Sigma R
$

Associação em Paralelo
$
  1/"Req" = sum_(k=1)^n 1 / R_k
$

Associação em Paralelo, dois elementos
$
  "Req" = (R_1 dot R_2) / (R_1 + R_2)
$

#let circuit = e.dc-circuit(
  style: (
    scale: 1.6,
    parallel-gap: 2,
    minimum-loop-width: 10,
  ),
  e.voltage-source("V", voltage: 18),
    e.parallel(
      e.resistor("R300", resistance: 300, route: "under"),
      e.resistor("R250", resistance: 250, route: "over"),
  ),
)

//Assertion failed: typed-physics: unknown electricity diagram style key "compoent"; accepted keys are wire-stroke, component-stroke, component-fill, source-fill, junction-fill, resistor-symbol, voltage-source-symbol, component-length, resistor-length, resistor-height, capacitor-plate-gap, capacitor-plate-height, source-radius, source-plate-gap, source-long-plate, source-short-plate, parallel-gap, branch-lead, label-offset, source-clearance, apex-rise, frame-rise, minimum-loop-width, label-text, show-junctions, scale

#align(center)[#e.diagram(circuit, labels: "value")]