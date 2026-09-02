-#import "model.typ": prova_model
#import "@preview/ctz-euclide:0.1.5": *

#show: prova_model.with(
  title: [Resumo de Matemática - E.M.],
)

= Álgebra

== Logaritmo

Função inversa à função exponencial, imagem e domínio trocados

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot, chart

    plot.plot(
      size: (10, 6),
      x-tick-step: 2,
      y-tick-step: 1,
      x-min: 0,
      x-max: 10,
      y-min: -1,
      y-max: 1.5,
      axis-style: "school-book",
      x-label: $x$,
      y-label: $y$,
      {
        plot.add(
          domain: (0.05, 10),
          samples: 100,
          style: (stroke: blue + 1.5pt),
          x => calc.log(x, base: 10),
        )

        plot.add-hline(calc.log(3), style: (stroke: (dash: "dashed", paint: red)))

        plot.add(
          ((3, calc.log(3)),),
          mark: "o",
          mark-style: (fill: red, stroke: none),
          style: (stroke: none),
          label: $log_10 3 = 0.47$,
        )
      }
    )
  })
]

=== Propriedades do Logaritmo

#grid(
  columns: 3,
  gutter: 2em,
  [$log_b^(a c) = log_b^a + log_b^c$],
  [$log_b^(a/c) = log_b^a - log_b^c$],
  [$log_b^(a^m) = m dot log_b^a$],
  [$log_(b^m)^a = 1/m dot log_a^b$],
  [$log_b^a = 1 / log_a^b$]
)

=== Casos

$
a) log_(b)^f(x) = log_(b)^g(x) \
b) log_(b)^t(x) = y
$

=== Exemplos

#ctz-canvas({
  import cetz.draw: *

  ctz-init()

  let point = (0, 0)

  content(point, anchor: "west", [a)$
    cancel(log_5)^(3x-5) = cancel(log_5)^7
    &=> 3x-5 = 7 \
    &= 3x = 12 \
    &= underline(x = 4)\
    S = {4}
  $])

  content((point.at(0) + 10, point.at(1)), anchor: "west", [$
    C.E.: \
    &3x - 5 > 0 \
    &underline(x > 1)
  $])

  content((point.at(0), point.at(1) - 6), anchor: "west", [b)$
    log_x^(4-3x) = 2 &=> x^2 = 4 - 3x\
    &= x^2 + 3x - 4 = 0\
    &= (x+4)(x-1) = 0 \
    &underline(x^' = -4)&underline(x^'' = 1)\
    S = nothing
  $])

  content((point.at(0) + 10, point.at(1) - 6), anchor: "west", [$
    C.E.:\
    &underline(x > 0) " e " underline(x != 1)\ \
    &4 -3x > 0\
    &3x < 4\
    &x < 4 / 3\
  $])
})\

== Progressões

=== Aritmética

PA($A_1, A_2, A_3, A_4, A_5, dots, A_n$)

Termo Geral:

$A_n = A_1 + (n - 1)r$

Soma dos Termos:
\
$S = ((A_1 + A_n) dot n) / 2$

=== Geométrica

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -1, 8, 6), {
    import cetz.draw: *

    ctz-init()

    let point = (-3, 0)

    ctz-def-points(
      A: point,
      B: (point.at(0), point.at(1) + 1),
      C: (point.at(0) + 1, point.at(1) + 1),
      D: (point.at(0) + 1, point.at(1)),

      E: (point.at(0) + 3, point.at(1)),
      F: (point.at(0) + 3, point.at(1) + 2),
      G: (point.at(0) + 1, point.at(1) + 2),

      H: (point.at(0) + 3, point.at(1) + 5),
      I: (point.at(0), point.at(1) + 5),
      J: (point.at(0), point.at(1) + 2),

      K: (point.at(0) - 5, point.at(1)),
      L: (point.at(0) - 5, point.at(1) + 5)
    )

    ctz-draw-polygon("A", "B", "C", "D")
    ctz-draw-polygon("D", "E", "F", "G")
    ctz-draw-polygon("F", "H", "I", "J")
    ctz-draw-polygon("I", "A", "K", "L")

    content(((point.at(0) + 4), point.at(1) + 3.8), anchor: "west", [
      PG($A_1, A_2, A_3, A_4, A_5, ..., A_n$)\ \
      $A_n = A_1 dot q^(n - 1)$
    ])
  })
]

Soma dos Termos (finita):

$S = (A_1 dot (q^n - 1)) / (q - 1)$

Soma dos Termos (infinita) onde $0 < q < 1$:

$lim S = A_1 / (1 - q)$

Média Geométrica:

$A_2 = sqrt(A_1 dot A_3)$

== Matrizes

$
  mat(A_1, B_1, C_1; A_2, B_2, C_2; A_3, B_2, C_3)
$

=== Tipos

linha $
  mat(A, B, C, D) -> M_(1x n)
$

coluna $
  mat(A; B; C; D) -> M_(n x 1)
$

nula $
  mat(0, 0, dots; 0, 0, dots; dots, dots, dots.down)
$

=== Soma

=== Multiplicação

$
M_(2 x 3) dot M_(3 x 2) = M_(2 x 2)
$

$
  &mat(A_1, B_1, C_1; A_2, B_2, C_2;)
  dot
  mat(D_1, E_1; D_2, E_2; D_3, E_3) =\
  &=
  mat(
    A_1 dot D_1 + B_1 dot D_2 + C_1 dot D_3,
    A_1 dot E_1 + B_1 dot E_2 + C_1 dot E_3;
    A_2 dot D_1 + B_2 dot D_2 + C_2 dot D_3,
    A_2 dot E_1 + B_2 dot E_2 + C_2 dot E_3
  )
$

exemplo:

$
  &mat(1, 2, 5; 4, 8, 10)
  dot
  mat(9, 7; 15, 2; 1, 8)=\
  &=
  mat(
    1 dot 9 + 2 dot 15 + 5 dot 1,
    1 dot 7 + 2 dot 2 + 5 dot 8;
    4 dot 9 + 8 dot 15 + 10 dot 1,
    4 dot 7 + 8 dot 2 + 10 dot 8
  )
  =
  mat(35, 51; 86, 124)
$\

=== Determinantes

=== Teorema de Laplace

O determinante será a soma dos elementos de uma linha ou coluna (escolhida) pelo seu cofator.

=== Regra de Chió

== Sistemas Lineares
Um sistema linear é composto por equações lineares e o conjunto solução é um par ordenado (x, y), uma terna ordenada (x, y, z) e assim por diante. Uma equação é linear quando possuí duas ou mais incógnitas.

=== Adição

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-1, -2, 8, 2), {
    import cetz.draw: *

    ctz-init()

    let point = (0.5, 0)

    content(point, anchor: "west", [
      $
        cases(
          3x + 2y = 10 space space space (-2),
          2x + 4y = 12,
        )
        space ~ space
        &underline(cases(
          2x + cancel(4y) = 12,
          -6x - cancel(4y) = -20
        ))\
        &-4x = -8\
        & x = 2
      $
    ])
  })
]

=== Escalonamento

O escalonamento de um sistema linear é um método para resolver sistemas que consiste em eliminar incógnitas para formar uma "escada". Esse método é nais indicado para resolver sistemas de ordem igual ou maior que 3.

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-1, -2, 8, 2), {
    import cetz.draw: *

    ctz-init()

    let point = (0.5, 0)

    content(point, anchor: "west", [
      $
        cases(
          2x + 3y + 4z = 35,
          3x + 2y + 5z = 43,
          x + 4y + 2z = 24
        )
        space ~ space
        cases(
          x + 4y + 2z = 24,
          2x + 3y + 4z = 35,
          3x + 2y + 5z = 43
        )
      $
    ])

    curved-arrow(cetz.draw, (point.at(0) + 15, point.at(1) + 0.5), (point.at(0) + 14, point.at(1) + 0), stroke: (paint: black))

    curved-arrow(cetz.draw, (point.at(0) + 16, point.at(1) + 0.5), (point.at(0) + 14, point.at(1) - 1), stroke: (paint: black))

    content((point.at(0) + 14, point.at(1) + 0.85), anchor: "west", [$(-2)(-3)$])

    content((point.at(0), point.at(1) - 3), anchor: "west", [$
      -5y = -13 \
      y = 2,6
    $])

    content((point.at(0) + 12, point.at(1) - 3.4), anchor: "west", [$
      & x + 4 dot 2,6 + 2 dot 3 = 24 \
      & x + 10,4 + 6 = 24 \
      & x = 7,6
    $])

    content((point.at(0) + 5, point.at(1) - 3.4), anchor: "west", [$
      & -10y - z = -29 \
      & -26 - z = -29 \
      & z = 3
    $])

    content((point.at(0), point.at(1) - 7), anchor: "west", [$
      S = {(7,6; 2,6; 3)}
    $])
  })
]

=== Cramer

O teorema de Cramer é um método de resolver sistemas através de determinantes. Esse método pode ser usado em sistemas de qualquer ordem (2x2, 3x3, 4x4 etc).

=== Discussão de Sistemas Lineares

= Análise Combinatória e Estatística

== Diagrama de Arvore

Imagine que *você* quer comprar um carro e está em duvida entre duas marcas diferentes, sendo que cada uma delas oferece 3 cores diferentes. Quantas combinações de carros diferentes temos para escolher entre?

#align(left)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-2, -8, 8, 2), {
    import "@preview/cetz:0.5.2": tree
    import cetz.draw: *

    ctz-init()

    set-style(content: (padding: 0.5em))
    tree.tree(
      ([Carro], (
        [BYD],
        ("Azul", "C-B-A"),
        ("Vermelho", "C-B-V"),
        ("Roxo", "C-B-R"),
      ), (
        [FIAT],
        ("Azul", "C-F-A"),
        ("Vermelho", "C-F-V"),
        ("Roxo", "C-F-R")
      ))
    )

    content((14.5, -9), anchor: "east", [$
        therefore #h(1em) "combinações possiveis" =  6
    $])
  }
)]

== Variância

$
  "Var"(x) &= (sum_(i=1)^n (x_i - #overline[x])^2) / n\
  & = ((x_i - #overline[x])^2 + ... + (x_1 + #overline[x])^2)/ n
$

=== Desvio Padrão

$
  "DP"(x) = sqrt("Var"(x))
$

== Permutação

Permutar é trocar todos os elementos de posição. Para fazer isso, geralmente, usamos o fatorial.

=== Fatorial

Simplificando, fatoriais são: $n! = n dot (n - 1) dot ... dot 3 dot 2 dot 1$

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot, chart

    set-style(content: (padding: 0.2em))

    plot.plot(
      size: (10, 6),
      x-tick-step: 1,
      y-tick-step: 1000000,
      x-min: 0,
      x-max: 10,
      y-min: 0,
      y-max: 4000000,
      axis-style: "school-book",
      x-label: $x$,
      y-label: $y$,
      {
        let data = range(1, 11).map(x => (x, calc.fact(x)))
        plot.add(data, label: [Fatorial], mark: "o")

        plot.add-hline(
          3628800,
          style: (stroke: (dash: "dashed", paint: red)),
        )
      }
    )
  })
]

=== lista de fatoriais

$&2! = 2 dot 1 = 2\
  &3! = 3 dot 2! = 6\
  &4! = 4 dot 3! = 24\
  &5! = 5 dot 4! = 120\
  &6! = 6 dot 5! = 720\
  &7! = 7 dot 6! = 5040\
  &8! = 8 dot 7! = 40320\
  &9! = 9 dot 8! = 362880\
  &10! = 10 dot 9! = 3628800\
$

= Geometria Plana

== Triângulos

Figura plana formada por três vértices e três arestas cujo a soma dos ângulos internos se iguala a 180°.

#ctz-canvas(length: 0.7cm, clip-canvas: (-2, -4, 8, 6), {
  import cetz.draw: *

  ctz-init()

  let point = (-3, -1)

  ctz-def-points(
    A: point,
    B: (point.at(0) + 7, point.at(1)),
    C: (point.at(0) + 2, point.at(1) + 3)
  )

  ctz-draw(
      points: ("A", "B", "C"),
      labels: (
        B: "below right",
        A: "below left",
        C: "above",
      ),
    )

  content((point.at(0), point.at(1) + 5), [
    $A_\u{25B3} = 1/2 dot theta dot b dot sin alpha$\ \
    Exemplo:
  ])

  ctz-draw-polygon("A", "B", "C")
  ctz-draw-angle("A", "B", "C", label: "    60°")
  content((point.at(0) + 3.2, point.at(1) - 0.8), "15 cm")
  content((point.at(0) - 0.4, point.at(1) + 1.6), "10 cm")

  content((point.at(0) + 8, point.at(1) + 1), anchor: "west", [
    $A &= 1 / 2 dot 10 dot 15 dot sin 60° \
    &= 1 / cancel(2) dot cancel(10) dot 15 dot sqrt(3)/2 \
    &= 5 dot 15 dot sqrt(3) / 2 \
    & = (75 dot sqrt(3)) / 2 approx 37.5 "cm"^2$
  ])
})

// Heron
#ctz-canvas(length: 0.7cm, clip-canvas: (-2, -4, 8, 6), {
  import cetz.draw: *

  ctz-init()

  let point = (-6, 0)

  ctz-def-points(
    A: point,
    B: (point.at(0) + 7, point.at(1)),
    C: (point.at(0) + 2, point.at(1) + 3)
  )

  ctz-draw(
      points: ("A", "B", "C"),
      labels: (
        B: "below right",
        A: "below left",
        C: "above",
      ),
    )

  content((point.at(0) - 1, point.at(1) + 8), anchor: "west", [
    Formula de Heron \ \
    $A_\u{25B3} = sqrt(p dot (p-A) dot (p-B) dot (p-C))$\ \
    Exemplo:
  ])

  ctz-draw-polygon("A", "B", "C")

  content((point.at(0), point.at(1) + 1.9), [7 cm])
  content((point.at(0) + 5.5, point.at(1) + 2), [14 cm])
  content((point.at(0) + 3.4, point.at(1) - 0.8), [9 cm])

  content((point.at(0) + 8, point.at(1) + 2), anchor: "west", [
    $A &= sqrt(15 dot (15 - 9) dot (15 - 14) dot (15 - 7))\
    &= sqrt(15 dot 6 dot 8) = 12 sqrt(5) "cm"^2$
  ])
})

#ctz-canvas(length: 0.7cm, clip-canvas: (-2, -4, 8, 6), {
  import cetz.draw: *

  ctz-init()

  let point = (0, 0)

  ctz-def-points(
    A: point,
    B: (point.at(0) + 4.2, point.at(1)),
    C: (point.at(0) + 2, point.at(1) + 3.5)
  )

  ctz-draw(
      points: ("A", "B", "C"),
      labels: (
        B: "below right",
        A: "below left",
        C: "above",
      ),
  )

  content((point.at(0) -2, point.at(1) + 8), anchor: "west", [
    Formula do Triângulo Equilátero\ \
    $A_\u{25B3} = (l^2 sqrt(3)) / 4$\ \
    Exemplo:
  ])

  ctz-draw-polygon("A", "B", "C")

  content((point.at(0), point.at(1) + 2), [7 cm])
  content((point.at(0) + 2.1, point.at(1) - 0.5), [7 cm])
  content((point.at(0) + 4, point.at(1) + 2), [7 cm])

  content((point.at(0) + 8, 1.5), anchor: "west", [$
    A &= (7^2 sqrt(3)) / 4\
    &= (49 sqrt(3)) / 4\
    &= 12.25 sqrt(3) "cm"^2
  $])
})

#ctz-canvas(length: 0.7cm, clip-canvas: (-2, -4, 8, 6), {
  import cetz.draw: *

  ctz-init()

  let point = (0, 0)

  ctz-def-points(
    A: point,
    B: (point.at(0) + 6, point.at(1)),
    C: (point.at(0), point.at(1) + 3.5)
  )

  ctz-draw(
      points: ("A", "B", "C"),
      labels: (
        B: "below right",
        A: "below left",
        C: "above",
      ),
  )

  content((point.at(0) - 2, point.at(1) + 8), anchor: "west", [
    Formula (genérica) do Triângulo\ \
    $A_\u{25B3} = (b dot h) / 2$\ \
    Exemplo:
  ])

  ctz-draw-polygon("A", "B", "C")

  content((point.at(0) + 2.8, point.at(1) - 0.5), [8 cm])
  content((point.at(0) - 1, point.at(1) + 1.8), [6 cm])
  content((point.at(0) + 3.7, point.at(1) + 2.3), [10 cm])

  content((point.at(0) + 8, point.at(1) + 2), anchor: "west", [$
    A &= (cancel(8) dot 6) / cancel(2)\
    &= 4 dot 6\
    & = 24 "cm"^2
  $])
})

== Circunferências

#lorem(20)

#ctz-canvas(length: 0.7cm, clip-canvas: (-2, -6, 8, 6), {
  import cetz.draw: *

  ctz-init()

  let point = (0, 0)

  ctz-def-points(
    O: point,
    B: (point.at(0) + 4, point.at(1)),
  )

  ctz-draw(
      points: ("O", "B"),
      labels: (
        B: "below right",
        O: "below left",
      ),
  )

  content((point.at(0) - 10, point.at(1) + 2), anchor: "west", [
    Área do Circulo\ \
    $A_\u{25CB} = pi dot r^2$\ \
    Exemplo:
  ])

  ctz-def-circle("C1", "O", through: "B")
  ctz-draw("C1")

  ctz-draw-line("O", "B")

  content((point.at(0) + 6, point.at(1) + 3), anchor: "west", [$
    A &= pi dot 6^2\
    &= 36pi\
    & approx 113.04 "cm"^2
  $])
})

#ctz-canvas(length: 0.7cm, clip-canvas: (-2, -6, 8, 6), {
  import cetz.draw: *

  ctz-init()

  let point = (0, 0)

  ctz-def-points(
    O: point,
    B: (point.at(0) + 3, point.at(1)),
  )

  ctz-draw(
      points: ("O", "B"),
      labels: (
        B: "below right",
        O: "below left",
      ),
  )

  content((point.at(0) - 10, point.at(1) + 2), anchor: "west", [
    Perímetro do Circulo\ \
    $2P_\u{25CB} = 2 pi dot r$\ \
    Exemplo:
  ])

  ctz-def-circle("C1", "O", through: "B")
  ctz-draw("C1")

  ctz-draw-line("O", "B")

  content((point.at(0) + 4.5, point.at(1) + 3), anchor: "west", [$
    2P &= 2 pi dot 4.5\
    &= 9pi\
    & approx 28.26 "cm"
  $])
})

== Funções Periódicas

Uma função $f: RR -> RR$ é periódica se $exists p in RR^*_+ \/ f(x) = f(x + p), forall_x "e" RR$\

Ou seja, existe período positivo no qual imagem de x é igual a imagem de x + p, para todo x pertencente ao conjunto dos números reais. \

Por exemplo: $bold(cos pi / 6 = cos (13 pi) / 6)$, $cos (pi / 6 + p)$ sendo $p = 2 pi$

#ctz-canvas(length: 0.7cm, clip-canvas: (-1, -2, 18, 13), {
  import cetz.draw: *
  import "@preview/cetz-plot:0.1.3": plot, chart

  plot.plot(
    size: (14, 10),
    x-tick-step: 2,
    y-tick-step: 2,
    x-min: 0,
    x-max: 10,
    y-min: -2,
    y-max: 4,
    axis-style: "school-book",
    x-label: $x$,
    y-label: $y$,
    y-grid: true,
    {
      plot.add(
        domain: (0, calc.pi * 4),
        x => calc.sin(x),
        label: $f(x) = sin x$
      )
      plot.add(
        domain: (0, calc.pi * 4),
        x => (calc.sin(x) + 3),
        label: $g(x) = sin x + 3$
      )
      plot.add(
        domain: (0, calc.pi * 4),
        x => (calc.sin(x) * 2),
        label: $h(x) = 2 sin x$
      )
    }
  )
})

=== Elementos da função cossenoide e senoide

== Circunferência trigonométrica

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -8, 8, 8), {
    import cetz.draw: *

    ctz-init()
    let r = 7

    // Ângulos calculados uma única vez e reaproveitados nos pontos e nos
    // rótulos abaixo, em vez de recalcular cos/sin duas vezes por ângulo.
    let ptB = (r * calc.cos(30deg), r * calc.sin(30deg))
    let ptD = (r * calc.cos(150deg), r * calc.sin(150deg))
    let ptE = (r * calc.cos(210deg), r * calc.sin(210deg))
    let ptF = (r * calc.cos(330deg), r * calc.sin(330deg))
    let ptG = (r * calc.cos(45deg), r * calc.sin(45deg))
    let ptH = (r * calc.cos(135deg), r * calc.sin(135deg))
    let ptI = (r * calc.cos(225deg), r * calc.sin(225deg))
    let ptJ = (r * calc.cos(315deg), r * calc.sin(315deg))
    let ptK = (r * calc.cos(60deg), r * calc.sin(60deg))
    let ptL = (r * calc.cos(120deg), r * calc.sin(120deg))
    let ptM = (r * calc.cos(240deg), r * calc.sin(240deg))
    let ptN = (r * calc.cos(300deg), r * calc.sin(300deg))
    let ptA = (r * calc.cos(180deg), r * calc.sin(180deg))

    ctz-def-points(
      O: (0, 0),

      B: ptB,
      D: ptD,
      E: ptE,
      F: ptF,
      G: ptG,
      H: ptH,
      I: ptI,
      J: ptJ,
      K: ptK,
      L: ptL,
      M: ptM,
      N: ptN,
      A: ptA,

      // Reaproveita a coordenada x já calculada para B (mesmo ângulo, y = 0)
      C: (ptB.at(0), 0),
    )

    // Círculo trigonométrico
    ctz-def-circle("C1", "O", through: "B")

    ctz-draw-line-add(
      (-6, 0),
      (6, 0),
      //mark: (end: ">"),
    )

    ctz-draw-line-add(
      (0, -6),
      (0, 6),
      //mark: (end: ">"),
    )

    // Círculo
    ctz-draw("C1")

    ctz-draw-line(
      "B",
      "D",
      "E",
      "F",
      "B",
      stroke: (
        paint: blue,
        dash: "dashed",
      )
    )

    ctz-draw-line(
      "G",
      "H",
      "I",
      "J",
      "G",
      stroke: (
        paint: orange,
        dash: "dashed",
      )
    )

    ctz-draw-line(
      "K",
      "L",
      "M",
      "N",
      "K",
      stroke: (
        paint: rgb(255, 0, 100),
        dash: "dashed",
      )
    )

    ctz-draw(
      points: ("O"),
      labels: (
        O: "below left",
        B: "above right",
        A: "above left",
        C: "below left",
      ),
    )

    content(
      (ptB.at(0) + 0.4, ptB.at(1) + 0.4),
      [$pi / 6$]
    )

    content(
      (ptG.at(0) + 0.4, ptG.at(1) + 0.4),
      [$pi / 4$]
    )

    content(
      (ptK.at(0) + 0.4, ptK.at(1) + 0.4),
      [$pi / 3$]
    )

    content(
      (ptD.at(0) - 0.4, ptD.at(1) + 0.4),
      [$(5 dot pi) / 6$]
    )

    content(
      (r * calc.cos(130deg) - 0.4, r * calc.sin(130deg) + 0.4),
      [$(3 dot pi) / 4$]
    )

    content(
      (ptL.at(0) - 0.4, ptL.at(1) + 0.4),
      [$(2 dot pi) / 3$]
    )

    content(
      (ptE.at(0) - 0.6, ptE.at(1) - 0.4),
      [$(7 dot pi) / 6$]
    )

    content(
      (ptI.at(0) - 0.5, ptI.at(1) - 0.5),
      [$(5 dot pi) / 4$]
    )

    content(
      (ptM.at(0) - 0.5, ptM.at(1) - 0.6),
      [$(5 dot pi) / 4$]
    )

    content(
      (ptN.at(0) + 0.6, ptN.at(1) - 0.6),
      [$(5 dot pi) / 3$]
    )

    content(
      (ptF.at(0) + 0.6, ptF.at(1) - 0.6),
      [$(11 dot pi) / 6$]
    )

    content(
      (ptJ.at(0) + 0.5, ptJ.at(1) - 0.6),
      [$(7 dot pi) / 4$]
    )

    content(
      (r * calc.cos(90deg) + 0.4, r * calc.sin(90deg) + 0.6),
      [$(pi) / 2$]
    )
    content(
      (r * calc.cos(270deg) + 0.4, r * calc.sin(270deg) - 0.8),
      [$(pi) / 2$]
    )

    content(
      (ptA.at(0) - 0.4, ptA.at(1) + 0.4),
      [$pi$]
    )

    content(
      (r * calc.cos(0deg) + 0.5, r * calc.sin(0deg) + 0.4),
      [$0 degree$]
    )

    content((8, -0.8), [$cos$])
    content((-1, 8), [$sin$])
  })
]

=== Transformações Trigonométricas

#align(left)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -8, 8, 8), {
    import cetz.draw: *

    ctz-init()

    let r = 5

    // Reaproveita o mesmo ângulo já calculado para B em vez de recalculá-lo para C
    let ptB = (r * calc.cos(30deg), r * calc.sin(30deg))

    ctz-def-points(
      O: (0, 0),
      X: (5, 0),

      B: ptB,
      A: (
        r * calc.cos(180deg),
        r * calc.sin(180deg),
      ),

      C: (ptB.at(0), 0),
    )

    // Círculo trigonométrico
    ctz-def-circle("C1", "O", through: "B")
    ctz-def-circle("C2", "A", through: "B")

    // Eixos
    ctz-draw-line-add(
      (-5, 0),
      (5, 0),
      //mark: (end: ">"),
    )

    ctz-draw-line-add(
      (0, -5),
      (0, 5),
      //mark: (end: ">"),
    )

    ctz-draw-line(
      "B", "A", "C", "B"
    )

    // Círculo
    ctz-draw("C1")
    ctz-draw("C2", stroke: (
      paint: blue,
      dash: "dashed",
    ))

    // Triângulo
    ctz-draw-line("O", "B", "C")

    ctz-draw-line(
      "B",
      "C",
      stroke: red,
    )

    ctz-draw-angle(
      "O",
      "X",
      "B",
      radius: 1,
      label: $alpha$,
    )

    ctz-draw-angle(
      "A",
      "X",
      "B",
      radius: 1,
      //label: $beta$,
    )

    ctz-draw-mark-right-angle(
      "B",
      "C",
      "O",
    )

    ctz-draw(
      points: ("O", "B", "A", "C"),
      labels: (
        O: "below left",
        B: "above right",
        A: "above left",
        C: "below left"
      ),
    )

    ctz-draw-label-segment(
      "O",
      "C",
      pos: "bottom",
    )

    ctz-draw-label-segment(
      "C",
      "B",
      pos: "right",
    )

    content(
      (-10, -6),
      anchor: "west",
      box(
        inset: 0.4cm,
        [$
          //Â = alpha / 2 therefore \
          sin Â = accent("BC", "-") / sqrt(2 + 2 dot cos alpha)
        $],
      ),
    )
    //accent("AB", \u{23DC})

    content((-12.2, -14), [
      Exemplo:  $alpha = 30°$ \ \
      $Â = alpha / 2 therefore Â = 15°$
    ])

    content((-5 , -15), [
      $sqrt(2 + 2 dot cos 30°) =\
      = sqrt(2 + cancel(2) dot sqrt(3) / cancel(2)) approx 1.92
      $
    ])

    content((2, -15), [
      $accent("BC", "-") = 0.5\
      sin 15° approx 0.5 / 1.92 = \
      = bold(0.26)$
    ])

    /*content((-8, -20),
      anchor: "east",
      [$
        &sin 30 = sqrt(2) / 2\
        &"AB" = 1\
        &"AB"^2 = "BC"^2 + "AC"^2\
        &1 = "BC"^2 + "AC"^2
        /*&sin^2 x = 1 - cos^2 x\
        &sin x =  sqrt(1 - cos^2 x)\*/
      $]
    )*/

    content((4, -18), [aproximação do google: 0.2588190451])

    content((6, -0.8), [$cos$])
    content((-1, 6), [$sin$])
  })
]

=== Fórmulas de transformações trigonométricas

1. $sin(alpha + beta) = sin alpha dot cos beta + sin beta dot cos alpha$
\
2. $sin(alpha - beta) = sin alpha dot cos beta - sin beta dot cos alpha$
\
3. $cos(alpha + beta) = cos alpha dot cos beta - sin alpha dot sin beta$
\
4. $cos(alpha - beta) = cos alpha dot cos beta + sin alpha dot sin beta$
\
5. $tg(alpha + beta) = (tg alpha + tg beta) / (1 - tg alpha dot tg beta)$
\
6. $tg(alpha - beta) = (tg alpha - tg beta) / (1 + tg alpha dot tg beta)$
\
7. $sin 2alpha = 2 dot sin alpha dot cos alpha$
\
8. $cos 2alpha = 2 dot cos^2 alpha - 1$
\
9. $cos 2alpha = cos^2 alpha - sin^2 alpha$
\
10. $cos 2alpha = 1 - 2sin^2 alpha$
\
11. $tg 2 = (2 dot tg alpha) / (1 - tg^2 alpha)$
\
12. $cos(alpha / 2) = plus.minus sqrt((cos alpha + 1) / 2)$

== Pitágoras

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -5, 8, 5), {
    import cetz.draw: *

    ctz-init()

    let point = (-5, 0)

    ctz-def-points(
      A: (point.at(0), point.at(1) + 3),
      B: (point.at(0) + 4, point.at(1) + 0),
      C: (point.at(0), point.at(1)),

      B1: (point.at(0) + 4, point.at(1) - 4),
      C1: (point.at(0), point.at(1) - 4),

      A1: (point.at(0) - 3, point.at(1) + 3),
      C2: (point.at(0) - 3, point.at(1)),

      B2: (point.at(0) + 7, point.at(1) + 4),
      A2: (point.at(0) + 3, point.at(1) + 7),
    )

    ctz-draw-polygon("C", "B", "B1", "C1", fill: rgb(200, 220, 255), stroke: blue)

    ctz-draw-polygon("C", "A", "A1", "C2", fill: rgb(255, 225, 200), stroke: (paint: rgb(255, 140, 0)))

    ctz-draw-polygon("A", "B", "B2", "A2", fill: rgb(220, 255, 220), stroke: green)

    ctz-draw-polygon("A", "B", "C")
    ctz-draw-mark-right-angle("A", "C", "B")
    ctz-draw-angle("A", "B", "C")

    ctz-draw(
      points: ("A", "B", "C"),
      labels: (
        A: "above left",
        B: "below right",
        C: "below left",
      ),
    )

    // Rótulos das áreas dos quadrados
    content((point.at(0) + 2, point.at(1) - 2), [$b^2$])
    content((point.at(0) - 1.5, point.at(1) + 1.5), [$a^2$])
    content((point.at(0) + 3.5, point.at(1) + 3.5), [$c^2$])

    content((point.at(0) - 0.6, point.at(1) + 1.5), [$a$])
    content((point.at(0) + 2, point.at(1) - 0.5), [$b$])
    content((point.at(0) + 2.5, point.at(1) + 2.1), [$c$])

    content((point.at(0) + 8, point.at(1) + 2), anchor: "west", [$
      & sin^2 Â + cos^2 Â = 1\
      & (b/c)^2 + (a/c)^2 = 1\
      & (b^2 + a^2) / c^2 = 1
    $])

    content((point.at(0) + 8, point.at(1) - 2), anchor: "west", frame: "rect", padding: 0.5, [$
      a^2 + b^2 = c^2
    $])
  })
]

= Geometria Espacial

== Relação de Euler

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [*Poliedro*], [Vértices], [Faces], [Arestas],
      [prisma triangular], [6], [5], [9],
      [paralelepípedo], [8], [6], [12],
      [prisma pentagonal], [10], [7], [15],
      [prisma hexagonal], [12], [8], [18],
      [pirâmide pentagonal], [6], [6], [10],
      [pirâmide hexagonal], [7], [7], [12],
      [...]
    ),
  )
  $V + F = A + 2$
]

== Prismas
\
#lorem(25)

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -8, 8, 8), {
    import cetz.draw: *

    ctz-init()

    point = (-8, 0)

    ctz-def-points(
      A: point,
      B: (point.at(0) + 4, point.at(1)),
      C: (point.at(0) + 2, point.at(1) + 3),
      D: (point.at(0) + 4, point.at(1) + 4),
      E: (point.at(0) + 8, point.at(1) + 4),
      F: (point.at(0) + 6, point.at(1) + 7),
      h: (point.at(0) + 2, point.at(1))
    )

    ctz-draw(
      points: ("A", "B", "C", "D", "E", "F", "h"),
      labels: (
        A: "below",
        B: "below",
        D: "below",
        E: "below",
        h: "below"
      )
    )

    ctz-draw-polygon("A", "B", "C")
    ctz-draw-line("D", "E", stroke: (paint: black, dash: "dotted"))
    ctz-draw-line("E", "F")
    ctz-draw-line("F", "D", stroke: (paint: black, dash: "dotted"))

    ctz-draw-line("A", "D", stroke: (paint: black, dash: "dotted"))
    ctz-draw-line("B", "E")
    ctz-draw-line("C", "F")
    ctz-draw-line("h", "C", stroke: (paint: red))

    content(
      (point.at(0) + 10, point.at(1) + 4),
      anchor: "west",
      [
        $
          & V = A_\u{25B3} dot #overline("CF")\
          & A_t = 2 A_\u{25B3} +  #text(red)[3] A_\u{25AD}\ \ \
          & A_\u{25AD} = #overline[CF] dot #overline[FE]\
          & A_\u{25B3} = (#overline("AB") dot h) / 2
        $
      ]
    )
  })
]

== Pirâmides

Dado um plano $alpha$, um polígono convexo P, contido em $alpha$, e um ponto V não pertencente a $alpha$, denominamos como piramides a reunião de todos os seguimentos com uma extremidade em P e a outra em V.

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -8, 8, 8), {
    import cetz.draw: *

    ctz-init()

    point = (-10, 0)

    ctz-def-points(
      A: point,
      B: (point.at(0) + 8, point.at(1)),
      C: (point.at(0) + 12, point.at(1) + 2),
      D: (point.at(0) + 4, point.at(1) + 2),

      O: (point.at(0) + 6, point.at(1) + 1),
      V: (point.at(0) + 6, point.at(1) + 8),
      G: (point.at(0) + 10, point.at(1) + 1)
    )

    ctz-draw-line("G", "O", "V", stroke: (paint: red, dash: "dotted"))
    ctz-draw-line("V", "G", stroke: (paint: red))
    ctz-draw-line("A", "D", "C", stroke: (dash: "dotted"))
    ctz-draw-line("B", "V")
    ctz-draw-line("A", "V", "C", "B", "A")
    ctz-draw-line("D", "V", stroke: (dash: "dotted"))

    ctz-draw(
      points: ("A", "B", "C", "D", "O", "V"),
      labels: (
        B: "below right",
        A: "below left",
        C: "below",
        D: "below",
        O: "below",
      ),
    )

    content(
      (point.at(0) + 14, point.at(1) + 4),
      anchor: "west",
      [
        $V = (A_square dot #overline("EV")) / 3$\ \
        $A_square = #overline("AB")^2$
      ]
    )
  })
]

=== Tetraedro Regular

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -8, 8, 8), {
    import cetz.draw: *

    ctz-init()

    point = (-10, 0)

    ctz-def-points(
      A: point,
      B: (point.at(0) + 8, point.at(1)),
      C: (point.at(0) + 4, point.at(1) + 2),

      O: (point.at(0) + 4, point.at(1) + 1),
      V: (point.at(0) + 4, point.at(1) + 6),
      G: (point.at(0) + 6, point.at(1) + 1),

      H: (point.at(0) - 1, point.at(1) + 6),
      I: (point.at(0) - 1, point.at(1) + 1)
    )

    ctz-draw-line("G", "O", "V", stroke: (paint: red, dash: "dotted"))
    ctz-draw-line("V", "G", stroke: (paint: red))
    ctz-draw-line("A", "C", stroke: (dash: "dotted"), name: "l")
    ctz-draw-line("B", "V")
    ctz-draw-line("A", "V", "C", "B", "A")
    ctz-draw-line("H", "I", stroke: (paint: red), name: "h")

    ctz-draw(
      points: ("A", "B", "C", "O", "V"),
      labels: (
        B: "below right",
        A: "below left",
        C: "above left",
        O: "below",
      ),
    )

    content("l.mid", anchor: "south-east", padding: .2em, [a])
    content("h.mid", anchor: "east", padding: .4em, [h])

    content(
      (point.at(0) + 14, point.at(1) + 4),
      anchor: "west",
      [
        $V = (a^3 sqrt(2)) / 12$\ \
        $h = (a sqrt(6)) / 3$\ \
        $A_t = a^2 sqrt(3)$
      ]
    )
  })
]

=== Tronco da Pirâmide

#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-8, -8, 8, 8), {
    import cetz.draw: *

    ctz-init()

    point = (-10, 0)

    ctz-def-points(
      A: point,
      B: (point.at(0) + 8, point.at(1)),
      C: (point.at(0) + 12, point.at(1) + 2),
      D: (point.at(0) + 4, point.at(1) + 2),

      O: (point.at(0) + 6, point.at(1) + 1),
      V: (point.at(0) + 6, point.at(1) + 8),
      CB: (point.at(0) + 10, point.at(1) + 1),

      P: (point.at(0), point.at(1) + 3.5),
      Q: (point.at(0) + 8, point.at(1) + 3.5),
      R: (point.at(0) + 4, point.at(1) + 5.5),
      S: (point.at(0) + 12, point.at(1) + 5.5),

      E: (point.at(0) + 10, point.at(1) - 10),
      F: (point.at(0) + 18, point.at(1) - 10),
      G: (point.at(0) + 14, point.at(1) - 8),
      H: (point.at(0) + 22, point.at(1) - 8),
      I: (point.at(0) + 12.8, point.at(1) - 6),
      J: (point.at(0) + 17.2, point.at(1) - 6),
      K: (point.at(0) + 19.2, point.at(1) - 5),
      L: (point.at(0) + 14.8, point.at(1) - 5),
      M: (point.at(0) + 15.8, point.at(1) - 9),
      N: (point.at(0) + 20.2, point.at(1) - 8.9),
      T: (point.at(0) + 15.8, point.at(1) - 5.5),
      U: (point.at(0) + 18.2, point.at(1) - 5.5)
    )

    ctz-draw-polygon(
      "R", "P", "Q", "S", stroke: (paint: blue),
      fill: blue.lighten(80%)
    )
    ctz-draw-line("CB", "O", "V", stroke: (paint: red, dash: "dotted"))
    ctz-draw-line("V", "CB", stroke: (paint: red))
    ctz-draw-line("A", "D", "C", stroke: (dash: "dotted"))
    ctz-draw-line("B", "V")
    ctz-draw-line("A", "V", "C", "B", "A")
    ctz-draw-line("D", "V", stroke: (dash: "dotted"))
    ctz-draw-line("P", "Q", "S", stroke: (paint: blue))

    ctz-draw-line(
      "T", "M", "N",
      stroke: (dash: "dotted", paint: red)
    )
    ctz-draw-line("T", "U", "N", stroke: (paint: red))

    ctz-draw-polygon("K", "J", "I", "E", "F", "H")
    ctz-draw-line("J", "F")
    ctz-draw-line("I", "L", "K")
    ctz-draw-line("G", "L", stroke: (dash: "dotted"))
    ctz-draw-line("E", "G", "H", stroke: (dash: "dotted"))

    ctz-draw(
      points: ("A", "B", "C", "D", "O", "V", "M", "N"),
      labels: (
        B: "below right",
        A: "below left",
        C: "below",
        D: "below",
        O: "below",

        M: "below",
        N: "below"
      ),
    )

    content(
      (point.at(0) + 14, point.at(1) + 4),
      anchor: "west",
      [
        $V_t = (h dot t) / 3 dot (A + B + sqrt(A dot B))$\ \
        $A_t= "Ab" + "AB" + "Al"$\ \
        $"Al"_t = "Al"_"(maior)" - "Al"_"(menor)"$
      ]
    )
  })
]
