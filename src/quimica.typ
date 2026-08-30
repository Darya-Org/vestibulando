#import "model.typ": prova_model
#import "@preview/ctz-euclide:0.1.5": *
#import "@preview/typsium:0.3.2":*

#show: prova_model.with(
  title: [Resumo de Química - E.M.],
)

//= Agradecimentos
//\
Agradecimentos especiais a Grabriela Capuzzo, Tomás Baracat, Ana Prokopowitsch e Manuela Bitencourt pela disponibilização de alguns conteúdos usados como referência para a criação deste documento

#pagebreak()

= Teoria Atômica Molecular
\
#align(center)[
  #ctz-canvas(length: 0.62cm, {
    import cetz.draw: *

    ctz-init()

    // ---------- Dados ----------
    let periodos = (
      ("H","","","","","","","","","","","","","","","","","He"),
      ("Li","Be","","","","","","","","","","","B","C","N","O","F","Ne"),
      ("Na","Mg","","","","","","","","","","","Al","Si","P","S","Cl","Ar"),
      ("K","Ca","Sc","Ti","V","Cr","Mn","Fe","Co","Ni","Cu","Zn","Ga","Ge","As","Se","Br","Kr"),
      ("Rb","Sr","Y","Zr","Nb","Mo","Tc","Ru","Rh","Pd","Ag","Cd","In","Sn","Sb","Te","I","Xe"),
      ("Cs","Ba","La*","Hf","Ta","W","Re","Os","Ir","Pt","Au","Hg","Tl","Pb","Bi","Po","At","Rn"),
      ("Fr","Ra","Ac*","Rf","Db","Sg","Bh","Hs","Mt","Ds","Rg","Cn","Nh","Fl","Mc","Lv","Ts","Og"),
    )

    let lantanideos = ("La","Ce","Pr","Nd","Pm","Sm","Eu","Gd","Tb","Dy","Ho","Er","Tm","Yb","Lu")
    let actinideos  = ("Ac","Th","Pa","U","Np","Pu","Am","Cm","Bk","Cf","Es","Fm","Md","No","Lr")

    let nao-metais   = ("H","C","N","O","P","S","Se")
    let halogenios   = ("F","Cl","Br","I","At","Ts")
    let gases-nobres = ("He","Ne","Ar","Kr","Xe","Rn","Og")
    let metaloides   = ("B","Si","Ge","As","Sb","Te","Po")

    let categoria(sym) = {
      if sym in nao-metais or sym in halogenios or sym in gases-nobres {
        "ametal"
      } else if sym in metaloides {
        "metaloide"
      } else {
        "metal"
      }
    }

    let cor-categoria(cat) = {
      if cat == "metal" { rgb(70, 110, 200) }
      else if cat == "ametal" { rgb(60, 150, 80) }
      else { rgb(150, 70, 170) }
    }

    let bloco(sym, grupo) = {
      if sym == "He" { "s" }
      else if grupo == 1 or grupo == 2 { "s" }
      else if grupo >= 3 and grupo <= 12 { "d" }
      else { "p" }
    }

    let cor-bloco(b) = {
      if b == "s" { rgb(255, 215, 215) }
      else if b == "p" { rgb(255, 248, 200) }
      else if b == "d" { rgb(205, 225, 255) }
      else { rgb(210, 255, 215) }
    }

    // ---------- Célula ----------
    let celula(sym, x, y, blk-override: none) = {
      if sym != "" {
        let cat = categoria(sym.replace("*", ""))
        let blk = if blk-override != none { blk-override } else { bloco(sym, x) }
        rect(
          (x - 0.48, y - 0.48), (x + 0.48, y + 0.48),
          fill: cor-bloco(blk),
          stroke: cor-categoria(cat) + 1.4pt,
          radius: 0.06,
        )
        content((x, y), text(size: 0.8em)[#sym])
      }
    }

    // ---------- Tabela principal ----------
    for (i, linha) in periodos.enumerate() {
      let periodo = i + 1
      for (j, sym) in linha.enumerate() {
        celula(sym, j + 1, -periodo)
      }
    }

    // ---------- Lantanídeos e Actinídeos ----------
    for (j, sym) in lantanideos.enumerate() {
      celula(sym, j + 3, -8.5, blk-override: "f")
    }
    for (j, sym) in actinideos.enumerate() {
      celula(sym, j + 3, -9.5, blk-override: "f")
    }

    line((3.48, -6.48), (2.6, -8.02), stroke: (paint: gray, dash: "dashed"))
    line((3.48, -7.48), (2.6, -9.02), stroke: (paint: gray, dash: "dashed"))

    // ---------- Contornos dos blocos s, p, d, f ----------
    rect((0.52, -7.48), (2.48, 0.48), stroke: rgb(200, 60, 60) + 1.6pt)
    content((1.5, 0.85), text(size: 0.85em, fill: rgb(200, 60, 60))[Bloco *s*])

    rect((12.52, -7.48), (18.48, 0.48), stroke: rgb(180, 140, 20) + 1.6pt)
    content((15.5, 0.85), text(size: 0.85em, fill: rgb(180, 140, 20))[Bloco *p*])

    rect((2.52, -7.48), (12.48, -3.52), stroke: rgb(50, 90, 190) + 1.6pt)
    content((7.5, -3.15), text(size: 0.85em, fill: rgb(50, 90, 190))[Bloco *d*])

    rect((2.52, -10.02), (17.48, -7.98), stroke: rgb(30, 140, 60) + 1.6pt)
    content((9.9, -10.4), text(size: 0.85em, fill: rgb(30, 140, 60))[Bloco *f*])

    // ---------- Setas de eletronegatividade crescente ----------
    line(
      (0.5, 2), (18.5, 2), mark: (end: ">"), stroke: rgb(220, 40, 40) + 1.6pt
    )
    content((9.5, 3), text(size: 0.85em, fill: rgb(220, 40, 40))[EN])

    line(
      (20, -7), (20, -0.5), mark: (end: ">"), stroke: rgb(220, 40, 40) + 1.6pt
    )
    content(
      (21, -3.5), anchor: "west",
      text(size: 0.85em, fill: rgb(220, 40, 40))[EN]
    )

    // Destaque do elemento mais eletronegativo (Flúor)
    rect((16.5, -2.5), (17.5, -1.5), stroke: rgb(220, 40, 40) + 2.2pt)

    // ---------- Legenda ----------
    content((10, -12), text(size: 0.8em)[
      #box(width: 0.4cm, height: 0.4cm, fill: cor-categoria("metal"), stroke: 1pt) Metal #h(0.5cm)
      #box(width: 0.4cm, height: 0.4cm, fill: cor-categoria("ametal"), stroke: 1pt) Ametal #h(0.5cm)
      #box(width: 0.4cm, height: 0.4cm, fill: cor-categoria("metaloide"), stroke: 1pt) Metaloide #h(0.5cm)
      #box(width: 0.4cm, height: 0.4cm, fill: rgb(220, 40, 40), stroke: 1pt) Mais eletronegativo
    ])
  })
]

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