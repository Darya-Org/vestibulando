#import "model.typ": *
#import "@preview/genotypst:0.11.0": parse-newick, render-rectangular-tree

#show: prova_model.with(
  title: [Resumo de Biologia - E.M.],
)

= Ciclos Gasosos

== Nitrogênio

== Oxigênio

== Gás Carbônico

= Biomas

== Cerrado

- Bioma adaptado para a seca
- ...

== Caatinga

- Bioma adaptado para queimadas
- Plantas com caule grosso ...
- Vegetação arbórea
- Folhas encobertas por camada de cera

== Mangue

- Bioma adaptado para ...
- Raízes Aéreas
- Filtração do sal presente na água
- Liberação de sal pelas folhas
- Atrativo pela sua grande biodiversidade
- Crucial para o ciclo reprodutório de muitos animais marinhos

= Origem da Vida na Terra

Duas teorias mais famosas:

Abiogênese:
Surgiu na Grécia antiga

Biogênese:

== Teoria da terra primitiva

\u{0399}. Formação

== LUCA

Last Universal Common Ancestor

= Vida Celular

== Seres Procariontes

=== Bactérias

Encontradas em grande parte do planeta e são muito importantes para diversos processos naturais, internos ou externos a outros indivíduos.

=== Arqueas _(extremófilos)_

Encontradas em locais de alta temperatura, salinidade elevada e em ausência de gás carbônico ($C O_2$). Muito mais simples do ponto de vista celular, mas muito mais complexas do ponto de vista metabólico.

=== Plasmídeos

Fragmentos de DNA (circular) da célula. Possui informações extras. São usados para compartilhar informações genéticas e mutações com outras bactérias.

=== Transdução Bacteriana

Um vírus, ao infectar uma célula

== Seres Eucarióticos

#align(center)[
  #ctz-canvas(length: 1cm, clip-canvas: (-8, -1, 8, 6), {
    import cetz.draw: *

    ctz-init()

    // Membrana plasmática (contorno da célula)
    circle((0, 0), radius: (7, 5), stroke: rgb(120, 170, 90) + 1.5pt, fill: rgb(235, 245, 225))

    // Núcleo (com envelope nuclear duplo)
    circle((-2.5, 0.8), radius: (2.2, 2), stroke: rgb(140, 100, 180) + 1.2pt, fill: rgb(225, 210, 240))
    circle((-2.5, 0.8), radius: (1.9, 1.7), stroke: rgb(140, 100, 180) + 0.6pt)

    // Nucléolo
    circle((-2.9, 1.1), radius: 0.45, stroke: rgb(100, 70, 140), fill: rgb(180, 150, 210))

    // Retículo endoplasmático rugoso (linha ondulada perto do núcleo, com ribossomos)
    let rer-pts = ()
    let n-rer = 24
    for i in range(n-rer + 1) {
      let t = i / n-rer
      let x = -0.2 + t * 3.4
      let y = -0.2 + 0.5 * calc.sin(t * 900deg)
      rer-pts.push((x, y))
    }
    line(..rer-pts, stroke: rgb(180, 120, 60) + 1pt)
    for pt in rer-pts.filter(p => calc.rem(int(p.at(0) * 10), 6) == 0) {
      circle(pt, radius: 0.08, fill: black, stroke: none)
    }

    // Retículo endoplasmático liso (linha ondulada sem ribossomos)
    let ser-pts = ()
    let n-ser = 24
    for i in range(n-ser + 1) {
      let t = i / n-ser
      let x = -0.2 + t * 3
      let y = -1.4 + 0.35 * calc.sin(t * 720deg)
      ser-pts.push((x, y))
    }
    line(..ser-pts, stroke: rgb(210, 150, 90) + 1pt)

    // Complexo de Golgi (pilha de arcos)
    for i in range(4) {
      let y = 3.3 - i * 0.35
      arc((1.6, y), start: 210deg, stop: 330deg, radius: 0.9, stroke: rgb(90, 140, 190) + 1.2pt)
    }

    // Mitocôndrias (com cristas internas)
    let mito-pos = ((3.8, -2), (-4.2, -2.6), (4.5, 0.2))
    for pos in mito-pos {
      circle(pos, radius: (0.9, 0.45), stroke: rgb(200, 80, 70) + 1.2pt, fill: rgb(250, 215, 205))
      for i in range(3) {
        let dx = -0.5 + i * 0.5
        line(
          (pos.at(0) + dx, pos.at(1) - 0.3),
          (pos.at(0) + dx + 0.15, pos.at(1) + 0.3),
          stroke: rgb(200, 80, 70) + 0.6pt,
        )
      }
    }

    // Lisossomos
    circle((1, -3.4), radius: 0.35, stroke: rgb(180, 160, 40), fill: rgb(240, 225, 150))
    circle((1.7, -3.1), radius: 0.25, stroke: rgb(180, 160, 40), fill: rgb(240, 225, 150))

    // Vacúolo
    circle((-1, -3.4), radius: 0.7, stroke: rgb(120, 170, 90) + 0.8pt, fill: rgb(245, 250, 240))

    // Ribossomos livres espalhados no citoplasma
    let riboss-pos = ((5.2, -0.5), (5.6, 0.6), (-5.5, 1.5), (-5.2, -1), (0.5, 3.5), (-1.5, 3.2))
    for pos in riboss-pos {
      circle(pos, radius: 0.08, fill: black, stroke: none)
    }

    // Rótulos
    content((-2.5, 0), [Núcleo])
    //content((-2.9, 0.2), [Nucléolo])
    content((1.6, 0.8), [RE rugoso])
    content((1.4, -2.2), [RE liso])
    content((4.6, 2.3), text(rgb("#488853"))[Complexo\ de Golgi])
    content((3.8, -2.8), [Mitocôndria])
    content((-1, -2.2), [Vacúolo])
    content((1.2, -4.2), [Lisossomos])
    content((0, 5.4), [Membrana plasmática])
  })
]

=== Protistas

Grupo artificial, todos aqueles que não são classificados como plantas, animais ou fungos.

=== Protozoários

Heterófos ou Unicelulares

- Zooplancton
- Parasitas

=== Algas

Produzem glicose e podem ser pluricelulares. Formam fitoplâncton e são os principais produtores do ecossistema aquático e produzem grande parte do oxigênio ($O_2$) do planeta.

Crescimento descontrolado pode ser provocado pelo aumento da temperatura oceânica, nutrientes ou salinidade da água. Os dois principais tipos são:
- Eutrofização (algas verdes)
- Maré-vermelha (algas vermelhas)

= Reino Animália: Metazoa

/*#align(center)[
  #ctz-canvas(length: 0.7cm, clip-canvas: (-1, -2, 8, 2), {
    import "@preview/cetz:0.5.2": tree
    import cetz.draw: *

    ctz-init()

    set-style(content: (frame: "rect", fill: white, padding: 4pt))
  
    line(name: "1", (0, 0), (3, 0))
    content("1.start", [Reino\ Animal])
    content("1.mid", anchor: "west", [1])
  
    line((3, 3), (3, -3))
    line(name: "6", (3, 3), (15, 3))
    content("6.mid", [6])
    content("6.end", [Poríferos])
  
    line(name: "2", (3, -3), (5, -3))
    line((5, 1), (5, -7))
    content("2.mid", [2])
  
    line(name: "7", (5, 1), (15, 1))
    content("7.mid", [7])
    content("7.end", [Cnidários])
  
    line(name: "3", (5, -7), (7, -7))
    content("3.mid", [3])
    line((7, -4), (7, -12))
  
    line(name: "5", (7, -12), (11, -12))
    content("5.mid", [5])
  
    line((11, -14), (11, -10))
    line(name: "14", (11, -14), (15, -14))
    content("14.end", [Cordados])
    line(name: "13", (11, -10), (15, -10))
    content("13.end", [Equinodérmios])
    //0km content("13.mid", (rel: (-1, 0.3)), [13])
    content("14.mid", anchor: "east", [14])
  
    line(name: "4", (7, -4), (9, -4))
    content("4.mid", [4])
    line((9, -7), (9, -1.5))
    line((9, -1.5), (11, -1.5))
  
    line((11, -1), (11, -4))
    line(name: "8", (11, -1), (15, -1))
    line(name: "9", (11, -2.5), (15, -2.5))
    line(name: "10", (11, -4), (15, -4))
    content("8.end", [Platelmintos])
    content("8.mid", anchor: "east", [8])
    content("9.end", [Moluscos])
    content("9.mid", anchor: "east", [9])
    content("10.end", [Anelídeos])
    content("10.mid", anchor: "east", [10])
  
    line(name: "11", (9, -7), (11, -7))
    line((11, -6), (11, -8))
    line(name: "13", (11, -8), (15, -8))
    line(name: "12", (11, -6), (15, -6))
    content("11.mid", [11])
    content("13.end", [Artrópodes])
    content("13.mid", anchor: "east", [13])
    content("12.end", [Nematódeos])
    content("12.mid", anchor: "east", [12])
  })
]*/

#let animalia = parse-newick(
  "
    (
      (
        (
          (
            Cordados:0.15,
            Equinodermios:0.15,
          )Deuterostomados:0.12,
          (
            (
              Artropodes:0.05,
              Nematódeos:0.05,
            )Ecdizoários:0.1,
            (
              Moluscos:0.05,
              Anelideos:0.05,
              Platelmintos:0.05,
            ):0.1,
          )Protostomados:0.12,
        ):0.05,
        Cnidários:0.32
      ):0.05,
      Poríferos:0.37
    )Metazoa;
  "
)

#align(center)[#render-rectangular-tree(
  animalia,
  width: 160mm,
  height: 100mm,
  align-tip-labels: true,
)]

== Metazoa

1. Características Exclusivas:
  - Multicelularidade com colágeno na matriz extracelular;
  - Espermatozoide como gameta masculino;
  - Desenvolvimento embrionário até a fase de blástula.

2. Características Exclusivas:
  - Desenvolvimento embrionário até a fase de gástrula;
  - Sistema digestório incompleto;
  - Dois folhetos embrionários:
    - Endoderme (dentro);
    - Ectoderme (fora);
  - Células contráteis;
  - Neurônios.

3. Características Exclusivas:
  - Simetria bilateral;
  - Centralização do sistema nervoso;
  - Terceiro folheto embrionário e celoma (Mesoderme);

== Protostomados

4. Convergência Adaptativa:
  - Protostomia: Forma a boca primeiro

== Deuterostomados

5. Convergência Adaptativa:
  - Deuterostomia: Forma o anus primeiro

6. Características Exclusivas:
  - Coanócitos (células)

7. Características Exclusivas:
  - Criodócitos (células)

8. Características Exclusivas:
  - Sistema digestório incompleto (reversão);
  - Perda do celoma (reversão);
  - Sistema excretor formado por células-flama (protonefrídios).

9. Características Exclusivas:
  - Concha calcária (exoesqueleto secretado pelo manto);
  - Pés musculares;
  - Rádula (ausente nos bivalves): "língua áspera"

10. Metameria
  - Segmentação do corpo repetitiva
  - cerdas (ausente nos hirudíneos)

== Ecdisozoários

11. Ecdisozoários
  - Processo de troca do exoesqueleto

12. Pseudoceloma

13. Exoesqueleto de quitina com apêndices articulados
  - tagmose do corpo (segmentação)

14. Características Exclusivas:
  - Notocorda

== Nematódeos

- Sistema circulatório inexistente
- Crescem por mudas/ecdise
- Corpo alongado e cilíndrico
- Reprodução sexuada

== Artropodes

Grupo mais diverso do planeta.

=== Classes Principais

#hlist(
  size: 16pt,
  (
    ([Insetos], rgb("#60708f")),
    ([Crustáceos], rgb("#606f00")),
    ([Quelicerados], rgb("#ff8f70")),
    ([Miriápodes], rgb("#e64553"))
  )
)

/*1. Insetos:\
  Possuem brânquias ou pulmão foliáceo

2. Crustáceos:\
  Possuem brânquias

3. Quelicerados:\
  Possuem traqueia

4. Miriápodes:\
  Possuem traqueia
*/

#align(center)[
  #cetz.canvas(length: 1cm, {
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot, chart

    //set-style(axes: (left: (tick: (label: (angle: 90deg)))))
    plot.plot(
      size: (10, 6),
      x-tick-step: 12,
      y-tick-step: 2,
      x-min: 0,
      x-max: 10,
      y-min: 0,
      y-max: 1.5,
      axis-style: "school-book",
      x-label: [tempo],
      y-label: [crescimento],
      {
        let end = 8;

        plot.add(
          domain: (1, 10),
          samples: 100,
          label: [Outros Filos],
          style: (stroke: blue + 1.5pt),
          x => if x < end {
            calc.log(x, base: 4)
          } else { calc.log(end, base:4) },
        )

        plot.add(
          domain: (1, 10),
          samples: 100,
          label: [Artrópodes],
          fill: true,
          style: (stroke: green + 1.5pt, fill: green.lighten(60%)),
          x => {
            //let period = if (x < end) {calc.floor(x / 3)} else {end}
            if x < 3 {
              // curve
              calc.log(x, base: 6) - 0.1
            } else if x < 4 {
              // flat
              calc.log(2.5, base: 6)
            } else if x < 6 {
              // curve
              calc.log(x - 2.3, base: 4) + 0.13
            } else if x < 7 {
              // flat
              calc.log(6.8, base: 6)
            } else if x < 8 {
              // curve
              calc.log(x - 1.8, base: 3) - 0.43
            } else {
              // flat
              calc.log(5.4, base: 4)
            }
          }
        )

        /*plot.add(
          domain: (1, 10),
          samples: 100,
          label: [Artrópodes],
          fill: true,
          style: (stroke: red + 1.5pt),
          x => {
            let p = 3;
            let b = 100;
            let period = if (x < end) {calc.floor(x / p)} else {end}

            let rem = calc.rem(x, p)
            if rem <= 1 and rem != 1 or x >= 8 {
              calc.log(x, base: b) + calc.log(calc.max(period, x), base: b)
            } else {
              calc.log(calc.max(period, x), base: b)
            }
          }
        )*/

        plot.add-vline(
          end,
          style: (stroke: (dash: "dashed", paint: red)),
          label: "fase adulta"
        )
      }
    )
  })
]

== Fungos

= Doenças

== Sistema Imunológico

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *
    // a hack to use squircles
    import "@preview/dorodango:0.2.0": *

    ctz-init()

    let antígeno((x, y)) = group({
      rotate(-22deg)
      circle((x, y), radius: (0.2cm, 0.5cm), fill: gray)
    })

    antígeno((0, 0))
    content((0.5, 0.4), anchor: "west", [Antígeno])

    // draw skin derm
    for i in range(10) {
      if (i == 5) {
        continue
      }
      // hacky
      content(
        (i - 5, -1), 
        squircle(
          width: 1cm, 
          height: 1.1cm, 
          radius: 30%, 
          fill: rgb("#cfe8ff73"),
          stroke: 1pt + rgb("#0055ff")
        )
      )
      circle(
        (i - 4.9, -1.2),
        radius: 0.13cm,
        fill: blue,
        stroke: 0pt
      )
    }

    content((5, -1), anchor: "west", [Epiderme])

    hobby((0, -1), (0.5, -2.5), (1,-2.5), close: false, mark: (
      end: "straight",
    ))

    content((1.3, -2.5), anchor: "west", [1.])
    antígeno((3, -1.8))

    content((2, -4), anchor: "west", [macrófago])
  }
)]

== Vírus

=== Estrutura Básica

- Ácido Nucleotídico (DNA ou RNA) circundado por camada formada por proteínas, capsídeo;
- Alguns possuem envelope membranoso e enzimas no interior do capsídeo.

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *

    ctz-init()

    let r-env = 4       // raio do envelope lipídico
    let r-caps = 2.6    // raio do capsídeo

    // Envelope lipídico (bicamada) - dois círculos próximos
    circle((0, 0), radius: r-env, stroke: rgb(255, 190, 110) + 1pt, fill: rgb(255, 235, 200))
    circle((0, 0), radius: r-env - 0.3, stroke: rgb(255, 190, 110) + 1pt)

    // Capsídeo (proteico)
    circle((0, 0), radius: r-caps, stroke: rgb(120, 170, 220) + 1.2pt, fill: rgb(210, 230, 250))

    // Capsômeros - subunidades proteicas ao redor do capsídeo
    let n-caps = 10
    for i in range(n-caps) {
      let ang = i * 360deg / n-caps
      let cx = r-caps * calc.cos(ang)
      let cy = r-caps * calc.sin(ang)
      circle((cx, cy), radius: 0.35, stroke: rgb(120, 170, 220), fill: rgb(230, 240, 255))
    }

    // DNA - fita em espiral dentro do capsídeo
    let dna-pts = ()
    let n-dna = 50
    for i in range(n-dna + 1) {
      let t = i / n-dna
      let ang = t * 720deg
      let rr = 1.8 * t
      dna-pts.push((rr * calc.cos(ang), rr * calc.sin(ang)))
    }
    line(..dna-pts, stroke: rgb(80, 150, 80) + 1.5pt)

    // Receptores (glicoproteínas) - espículas saindo do envelope
    let n-rec = 14
    for i in range(n-rec) {
      let ang = i * 360deg / n-rec
      let base = (r-env * calc.cos(ang), r-env * calc.sin(ang))
      let tip = ((r-env + 0.9) * calc.cos(ang), (r-env + 0.9) * calc.sin(ang))
      line(base, tip, stroke: rgb(200, 80, 80) + 1.5pt)
      circle(tip, radius: 0.15, stroke: rgb(200, 80, 80), fill: rgb(255, 200, 200))
    }

    // Rótulos
    content((0, -(r-env + 1.5)), [Envelope lipídico])
    content((r-caps + 1.5, r-caps + 0.3), [Capsídeo])
    content((0, 1.7), [DNA])
    content((0, r-env + 1.6), [Receptores (glicoproteínas)])
  })
]

= Botânica

== Ciclo Reprodutório Simplificado

#align(center)[#cycle(
  node: 1.7,
  (
    ([Esporófito (adulto $2n$)], rgb("#60708f")),
    ([Esporo ($n$)], rgb("#606f00")),
    ([Gametófito (adulto $n$)], rgb("#ff8f70")),
    ([Gameta ($n$)], rgb("#e64553"))
  )
)]

== Plantas

#let plantas = parse-newick(
  "(((Gimnospermas:0.2, Anv giospermas:0.2)Espermatófitas:0.2, Pteridófitas:0.4)Vascoluares:0.3, Briófitas:0.7)Plantas;"
)

#align(center)[#render-rectangular-tree(
  plantas,
  width: 130mm,
  height: 60mm,
  tip-label-italics: true,
  align-tip-labels: true,
)]


1. Cutícula

2. Estômato

3. Embrião multicelular protegido no interior do gametângio feminino

4. Filoides, cauloide e rizoide

5. Fase esporofítica predominante

== Vasculares

6. Fase gametófita predominante

7. Surgimento de folhas, caule e raízes

8. Surgimento dos vasos condutores de seiva

9. Esporângios reunidos em estruturas chamadas soros

== Espermatófitas

10. Surgimento do câmbio vascular

11. Independência total do meio aquático para a fecundação

12. Surgimento da semente

  - Formada a partir do óvulo
  - Equivale ao "ovo" das espermatófitas
  - Protege o embrião do novo esporófito que pode ficar no solo e germinar semente...

== Eventos Para Independência da Água

1. Aparecimento de dois tipos distintos de esporos:

  - Femininos (megásporos);
  - Masculinos (micrósporos).

2. Redução extrema dos gametófitos

  - Gametófito masculino torna-se uma "planta" com apenas duas células, chamado de grão de pólen;
  - Gametófito feminino torna-se uma "planta" com poucas células chamada de saco-embrionário.

3. Transporte dos gametófitos masculinos até os óvulos de outra planta

  - Uma vez prontos os grãos de pólen, os esporângios masculinos, são levados pelo vento até os óvulos de outra planta;
  - O processo de deslocamento pelo ar se chama polinização.

4. Formação do tubo polínico, possibilitando uma conexão física segura e direta entre os gametófitos masculinos e femininos.

== Plantas Vasculares

== Pteridófitas

Exemplo: Samambaia

== Gimnospermas

13. Estruturas reprodutivas do esporófito agrupadas em estróbilos (pinhas ou cones)

=== Classes Principais

#hlist(
  (
    ([Cicas], rgb("#60708f")),
    ([Gnetófitas], rgb("#606f00")),
    ([Gincófitas], rgb("#ff8f70")),
    ([Coníferas], rgb("#e64553"))
  )
)

Exemplo: Pinheiro

== Angiospermas