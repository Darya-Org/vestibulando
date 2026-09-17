#import "model.typ": *

#show: prova_model.with(
  title: [Resumo de Geografia - E.M.],
)

= Geografia Física

= Geologia

== Dobramentos Modernos

== Escudos Cristalinos

== Bacias Sedimentares

= Cartografia

== Mapas

=== Coordenadas Geográficas

Representam linhas imaginárias para abstrair as posições dos elementos geográficos. Essas são as longitudes (meridianos) e latitudes (paralelos) perpendiculares entre si.

== Superfícies de Projeção

== Projeções Cartográficas

== Trópicos

== Escala

== Curvas de Nível

= Demografia

== Teorias Demográficas

=== Teoria Mautasiana

=== Teoria Reformista

== Transição Demográfica

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *
    import "@preview/cetz-plot:0.1.3": plot, chart

    // Funções logísticas aproximando as curvas de natalidade e mortalidade
    let birth(x) = 20 + 70 / (1 + calc.exp((x - 6) / 0.8))
    let death(x) = 15 + 70 / (1 + calc.exp((x - 2.5) / 0.8))
    let growth(x) = birth(x) - death(x)

    plot.plot(
      size: (14, 6),
      x-tick-step: none,
      y-tick-step: none,
      x-min: 0,
      x-max: 10,
      y-min: 0,
      y-max: 100,
      axis-style: "left",
      x-label: [tempo],
      y-label: [Taxa\ por\ habitantes],
      legend: "inner-north-east",
      {
        // Linhas verticais separando as 4 fases
        plot.add-vline(2.5, style: (stroke: (paint: gray, thickness: 0.5pt)))
        plot.add-vline(5, style: (stroke: (paint: gray, thickness: 0.5pt)))
        plot.add-vline(7.5, style: (stroke: (paint: gray, thickness: 0.5pt)))

        // Taxa de natalidade (azul escuro)
        plot.add(
          domain: (0, 10),
          samples: 100,
          style: (stroke: rgb(70, 70, 110) + 2pt),
          label: [Taxa de natalidade],
          birth,
        )

        // Taxa de mortalidade (azul claro)
        plot.add(
          domain: (0, 10),
          samples: 100,
          style: (stroke: rgb(30, 150, 200) + 2pt),
          label: [Taxa de mortalidade],
          death,
        )

        // Crescimento vegetativo (vermelho tracejado)
        plot.add(
          domain: (0, 10),
          samples: 100,
          style: (stroke: (paint: red, dash: "dotted", thickness: 1.5pt)),
          label: [Crescimento vegetativo],
          growth,
        )
      }
    )

    // Rótulos das fases (posições em cm, calculadas a partir do domínio 0-10 escalado para size: 12)
    content((0, -0.8), anchor: "west", [*Fase 1*])
    content((3.5, -0.8), anchor: "west", [*Fase 2*])
    content((7, -0.8), anchor: "west", [*Fase 3*])
    content((10.5, -0.8), anchor: "west", [*Fase 4*])
  })
]

=== Pré-transição

Não há nenhum país em estado de pré-transição (fase 1).

- Taxa de natalidade estável/alta;
- Taxa de mortalidade estável/alta;
- Crescimento vegetativo estável/baixo.

=== Aceleração Demográfica

Países sem acesso a contraceptivos estão classificados como estando nesse estágio (fase 2).

- Taxa de natalidade estável/alta;
- Taxa de mortalidade em queda brusca;
- Crescimento vegetativo em ascensão.

Alguns países dessa lista incluem:

- Somália
- República Democrática do Congo
- Nigéria
- Haiti
- Guatemala

=== Desaceleração Demográfica

Países com acesso a contraceptivos e muito acesso ao sistema de saúde estão classificados como estando nesse estágio (fase 3).

- Taxa de natalidade em queda brusca;
- Taxa de mortalidade estável/baixa;
- Crescimento vegetativo em queda.

=== Estabilização da População

Países nesse estágio (fase 4) são aqueles com o melhor índice de desenvolvimento.

- Taxa de natalidade estável/baixa;
- Taxa de mortalidade estável/baixa;
- Crescimento vegetativo estável/baixo.

=== Bônus Demográfico

Países em bônus demográfico tem a população economicamente ativa (PEA) maior do que a população aposentada ou jovem de mais para trabalhar. Quanto maior for a PEA do país, melhor é o sustento do mesmo.

== Fluxos Migratórios no Brasil

#let mapa = read("data/brasil.json", encoding: none)

#let config = json.encode((
  graticule: (step: 15),
  stroke_width: 0.1,
  point_color: "none",
  label_font_size: 2,
))

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *
    ctz-init()

    let mapa = render-map(mapa, config, width: 100%)

    let size = (10, 10)
    
    content((0, 0), size, mapa)
    content((size.at(0) * 0.25, size.at(1) * 0.25), [1960 - 1980])

    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.625, size.at(1) * 0.375),
      stroke: red + 4.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.437, size.at(1) * 0.687),
      (size.at(0) * 0.593, size.at(1) * 0.375),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.375, size.at(1) * 0.562),
      (size.at(0) * 0.562, size.at(1) * 0.375),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.600, size.at(1) * 0.350),
      stroke: red + 1.5pt, mark: (end: ">")
    )
  })
]

Sudeste é a região com maior quantidade de imigrantes, especialmente aqueles vindos do nordeste, fugindo da pobreza e seca, em busca de trabalhos nas industrias de São Paulo: Metalúrgica, Siderúrgica, automobilística etc.

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *
    ctz-init()

    let mapa = render-map(mapa, config, width: 100%)
    let size = (10, 10)

    content((0, 0), size, mapa)
    content((size.at(0) * 0.25, size.at(1) * 0.25), [1980 - 1990])

    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.625, size.at(1) * 0.375),
      stroke: red + 4.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(1) * 0.687),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(1) * 0.500),
      stroke: red + 2.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(0) * 0.250),
      stroke: red + 1.5pt, mark: (end: ">")
    )
  })
]

Expansão da fronteira agrícola no norte e centro-oeste do Brasil, maior quantidade de imigrantes continuam vindo do nordeste por conta dos problemas climáticos.

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *
    ctz-init()

    let mapa = render-map(mapa, config, width: 100%)
    let size = (10, 10)

    content((0, 0), size, mapa)
    content((size.at(0) * 0.25, size.at(1) * 0.25), [1990 - 2000])

    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.625, size.at(1) * 0.375),
      stroke: red + 3.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(1) * 0.687),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(1) * 0.500),
      stroke: red + 2pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.375, size.at(0) * 0.625),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.5, size.at(1) * 0.475),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.605, size.at(1) * 0.365),
      stroke: red + 1.5pt, mark: (end: ">")
    )
  })
]

Intensificação da expansão da fronteira agrícola, investimento tecnológico em melhoramento genético, aumento da qualidade do solo e maquinário. Muitos imigrantes saem da região sul do país.

#align(center)[
  #ctz-canvas(length: 1cm, {
    import cetz.draw: *
    ctz-init()

    let mapa = render-map(mapa, config, width: 100%)
    let size = (14, 14)

    content((0, 0), size, mapa)
    content((size.at(0) * 0.25, size.at(1) * 0.25), [2000 - hoje])

    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.625, size.at(1) * 0.375),
      stroke: red + 3.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(1) * 0.687),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.750, size.at(1) * 0.625),
      (size.at(0) * 0.500, size.at(1) * 0.500),
      stroke: red + 2pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.375, size.at(0) * 0.625),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.5, size.at(1) * 0.475),
      stroke: red + 1.5pt, mark: (end: ">")
    )
    line(
      (size.at(0) * 0.500, size.at(0) * 0.250),
      (size.at(0) * 0.605, size.at(1) * 0.365),
      stroke: red + 1.5pt, mark: (end: ">")
    )
  })
]

Muitos indivíduos que haviam se mudado da região do nordeste para a sudeste do país agora estão retornando para suas terras natais, em especial a população em idade avançada ou aposentada e a PEA em deslocamento econômico. Também ha um deslocamento interno na região nordestina por conta de melhorias socioeconômicas e na educação, em especial entre as cidades de Fortaleza, Recife e Salvador. Ainda, muitos do setor terciário, buscando melhores condições de vida, se deslocam para o sudeste.

== Industrias

=== Linha do Tempo

=== Industrialização no Brasil

A industrialização no Brasil foi tardia, ocorrendo na 3° revolução industrial. O processo foi heterogêneo com foco no sudeste, em especial: Minas Gerais, abundância de minérios como o ferro; São Paulo, destaque na produção de café e porto de Santos; RJ, até então, capital do país e possuinte de muitos portos.

== Urbanização

= Geopolítica


