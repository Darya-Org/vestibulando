#import "model.typ": *
#import "@preview/typsium:0.3.2":*

#show: prova_model.with(
  title: [Resumo de Química - E.M.],
)

// great hack!
#ctz-picture(".figures/periodic_table.typ")

= Teoria Atômica Molecular

Medida "$u$" é medida com base na massa do átomo de carbono. Ou seja, "$1u$" é o mesmo que $1/2$ do átomo de carbono.

== Massa Molecular

Soma das massas dos elementos presentes na substância.

Exemplo:
#align(right)[_MM:_ Massa Molecular]\
$
  "MM"_#ce[H2O] = 2 dot 1 + 1 dot 16 = 18u
$

= Soluções

== Dissolução Iônica
\
$
#ce[(s)NaCl ->[H2O] (aq)Na+ + (aq)Cl-]
$

== Estequiometria
\
#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr),
  align: (left, center, center, center, center),
  stroke: 0.5pt + gray,
  fill: (col, row) =>
    if row == 0 { rgb(163, 190, 225) }
    else if calc.rem(row, 2) == 1 { rgb(235, 235, 235) }
    else { white },

  [*Tipo de relação*],
  table.cell(colspan: 4)[
    #ce[(l)C2H6O + (g)3O2 -> (g)2CO2 + (l)3H2O]
  ],

  [Proporção em\ mols],
  [1 mol \ #sym.arrow.b], [3 mols \ #sym.arrow.b], [2 mols \ #sym.arrow.b], [3 mols \ #sym.arrow.b],

  [Em massa],
  [$1 dot 46$ g \ #sym.arrow.b], [$3 dot 32$ g \ #sym.arrow.b], [$2 dot 44$ g \ #sym.arrow.b], [$3 dot 18$ g \ #sym.arrow.b],

  [Em moléculas],
  [$6,0 dot 10^23$ \ #sym.arrow.b], [$3 dot 6 dot 10^23$ \ #sym.arrow.b], [$2 dot 6 dot 10^23$ \ #sym.arrow.b], [$3 dot 6 dot 10^23$ \ #sym.arrow.b],

  [Em volume\ (CNTP)],
  [é líquido], [$3 dot 22.4$ L], [$2 dot 22.4$ L], [é líquido],
)

$
1 "mol" approx 6 dot 10^23 approx 22.4L
$

=== Calculo Estequiométrico

1. Balancear a equação;
2. Colocar a proporção em mol;
3. Colocar dados da pergunta;
4. Adequar proporção em mol na unidade da pergunta.

Exemplo:

$
  &#ce[Al(OH)3 + 3HCl -> AlCl3 + 3H2O]\
  &1 "mol" #h(1.1cm) 3 "mol" #h(1.8cm) 1 "mol" #h(0.65cm) 3 "mol"\
  &#text(red)[$72"g" #h(1.5cm) 111"g"$]\
  &720"g" #h(1.5cm) m_"(g)"
$

=== Volume Molar

Volume ocupado por 1 mol da substância. Seguindo o principio de Avogadro, volumes iguais de gases quaisquer medidos nas mesmas condições e temperaturas, contem o mesmo número de partículas.

$
&p dot V = n dot R dot T\
&R = 0.082
$

=== Reagente Limitante

O reagente com menor quantidade de moléculas, determina o rendimento da reação.

=== Reagente em Excesso

Reagente que, ao fim da reação, não reage com nenhum outro reagente e acaba "sobrando", pois possuía maior quantidade de moléculas que os outros.

=== Pureza ou Teor de Reagente

#lorem(15)

== Titulometria

Forma técnica utilizada para determinar a concentração de uma solução por meio de uma reação.

#align(right)[_p.d.:_ partículas dispersas]\

no caso de uma partícula iônica (com exceção aos ácidos):
$
  &#ce[(s)NaCl ->[H2O] (aq)Na+ + (aq)Cl-]\
  &1 "mol" #h(2.4cm) 1 "mol" #h(0.5cm) + #h(0.2cm) 1 "mol"\ #v(2cm)
  &1 + 1 = 2 "mol p.d."
$

no caso de uma partícula covalente (molécula):\
#text(red)[_não ocorre dissociação iônica_]
$
  &#ce[(s)C6H12O6 ->[H2O] (aq)C6H12O6]\
  &1 "mol" #h(3.3cm) 1 "mol"\ #v(2cm)
  &1 "mol p.d."
$

=== Coeficiente de Solubilidade

Quantidade máxima de soluto possível de dissolver em uma certa quantidade de solvente a uma dada temperatura.

[gráfico curva de solubilidade]

=== Concentração de uma Solução

É a quantidade de soluto contido em uma solução.

$tau -> dot 10 ^2 -> "%" -> 10^4 -> "ppm" -> 10^3 -> "ppb"$

1. Concentração Comum (g/L)\
  Quantidade de soluto disperso em 1 litro

2. Concentração Molar\
  Quantidade de soluto, em mol, disperso em 1 litro de solução

3. Concentração Titulo ($tau$)\
  Quantidade, em gramas, de soluto que está contido em 1 grama de solução\
  $tau$ é adimensional e seu valor deve ser entre $0 < tau < 1$

4. Partes por Milhão (ppm)

5. Partes por Bilhão (ppb)

== Osmose

É a passagem do solvente do meio de menor concentração de partículas dispersas para o meio de maior concentração de partículas dispersas por meio de uma membrana semi-permeável.

=== Pressão Osmótica

Quanto maior o número de partículas dispersas , maior é a intensidade da osmose.

== Propriedades Coligativas

1. Crioscopia

2. Ebulioscopia

4. Tonoscopia

5. Pressão máxima de vapor

6. Ebulioscopia

7. Ebulioscopia

= Outro
\

#align(center)[
  #ctz-canvas(length: 0.9cm, {
    import cetz.draw: *

    ctz-init()

    // Substituintes laterais de C2 a C5 (esquerda, direita)
    let subst = (
      ("H", "OH"),   // C2
      ("OH", "H"),   // C3
      ("H", "OH"),   // C4
      ("H", "OH"),   // C5
    )

    // Cadeia principal (C1 a C6)
    line((0, 6), (0, 1), stroke: black + 1.3pt)

    // ---------- C1: grupo aldeído (CHO) ----------
    line((0, 6), (-0.9, 6.9), stroke: black + 1.3pt)
    line((-0.05, 6), (-0.85, 6.85), stroke: black + 1.3pt) // 2ª linha da dupla ligação
    content((-1.3, 7.05), [$O$])
    line((0, 6), (0.9, 6.4), stroke: black + 1pt)
    content((1.25, 6.4), [$H$])
    content((0.8, 5.8), text(size: 0.75em)[$C_1$])

    // ---------- C2 a C5: substituintes laterais ----------
    for (i, (esq, dir)) in subst.enumerate() {
      let y = 5 - i
      line((-0.9, y), (0, y), stroke: black + 1pt)
      line((0, y), (0.9, y), stroke: black + 1pt)
      content((-1.25, y), [#esq])
      content((1.25, y), [#dir])
      content((0.35, y + 0.3), text(size: 0.75em)[$C_#(i + 2)$])
    }

    // ---------- C6: CH2OH (base) ----------
    line((0, 1), (0.9, 0.4), stroke: black + 1pt)
    content((1.3, 0.35), [OH])
    content((0.35, 1.3), text(size: 0.75em)[$C_6$])
    content((-0.65, 0.6), text(size: 0.8em)[$H_2$])

    // ---------- Legenda ----------
    content((0.2, -1), text(size: 0.9em)[
      Glicose — #ce[C6H12O6]
    ])
  })
]