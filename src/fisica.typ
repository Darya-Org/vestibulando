#import "model.typ": prova_model
#import "@preview/ctz-euclide:0.1.5": *

#show: prova_model.with(
  title: [Resumo de Física - E.M.],
)

= Forças

== Equilibrio

== Momento de uma Força

=== Alavancas

=== Tombamento

== Trabalho de uma Força

$
  bold(tau_accent(F, arrow) = F dot d dot cos theta) \
  "ou"\
  bold(tau_accent(F, arrow) = "Area")
$

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
  F = (K dot |Q_1| dot |Q_2|) / 2\
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

#align(center)[
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
    for dy in (-0.35, 0, 0.35) {
      line((-1.8, dy * 1.3), (-3, dy * 3), stroke: black + 0.8pt)
      line((1.8, dy * 1.3), (3, dy * 3), stroke: black + 0.8pt)
    }

    // ---------- Ímã: polo S (esquerda) e polo N (direita) ----------
    rect((-1.8, -1), (0, 1), stroke: blue + 1.4pt, fill: white)
    rect((0, -1), (1.8, 1), stroke: red + 1.4pt, fill: white)

    content((-0.9, 0), text(size: 1.1em)[S])
    content((0.9, 0), text(size: 1.1em)[N])
  })
]

== Potencial Elétrico

$
  VV = (K dot Q) / d
$

=== Trabalho da Força Elétrica

$
  tau_"fel" = q dot (VV_i - VV_f)
$

=== Campo Elétrico Uniforme

$
  E dot d = u
$

== Eletrodinâmica

$
  i = q / (Delta t)\
  "ou"\
  i = (n dot e) / (Delta t)
$

=== Consumo Elétrico e Potencia

$
  P = i dot u\
  E = P dot Delta t
$