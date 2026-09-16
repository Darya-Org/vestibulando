#import "model.typ": prova_model
#import "@preview/ctz-euclide:0.1.5": *

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

/*#align(center)[
  #ctz-canvas(length: 0.9cm, {
    import cetz.draw: *

    ctz-init()

    // ---------- Linhas de campo (elipses concêntricas, N -> S por fora) ----------
    let loops = ((3, 2.2), (4, 3.2), (5, 4.2))

    for (rx, ry) in loops {
      circle((0, 0), radius: (rx, ry), stroke: black + 1pt, fill: none)
    }

    // ---------- Setas indicando o sentido do campo (N -> S) ----------
    for (rx, ry) in loops {
      // topo: sentido N (direita) -> S (esquerda)
      line((rx * 0.35, ry * 0.97), (-rx * 0.35, ry * 0.97), stroke: red + 1.2pt, mark: (end: ">"))
      // base: sentido S (esquerda) -> N (direita), fechando o loop
      line((-rx * 0.35, -ry * 0.97), (rx * 0.35, -ry * 0.97), stroke: red + 1.2pt, mark: (end: ">"))
    }

    // ---------- Linhas de campo dispersas (fuga lateral) ----------
    /*for dy in (-0.35, 0, 0.35) {
      line((-1.8, dy * 1.3), (-3, dy * 3), stroke: black + 0.8pt)
      line((1.8, dy * 1.3), (3, dy * 3), stroke: black + 0.8pt)
    }*/

    // ---------- Ímã: polo S (esquerda) e polo N (direita) ----------
    rect((-1.8, -1), (0, 1), stroke: blue + 1.4pt, fill: white)
    rect((0, -1), (1.8, 1), stroke: red + 1.4pt, fill: white)

    content((-0.9, 0), text(size: 1.1em)[S])
    content((0.9, 0), text(size: 1.1em)[N])
  })
]*/

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

$
  "Req" = Sigma R
$