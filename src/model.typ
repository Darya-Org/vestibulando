// Libraries Used
#import "@preview/edgeframe:0.3.0": *
#import "@preview/bulb:0.2.1": *
#import "@preview/typart:0.1.1": *
#import "@preview/ctz-euclide:0.1.5": *
#import "@preview/mercator:0.1.2": *
//#import "@preview/based:0.2.0": base64

#let prova_model(
  title: text,
  body,
) = {
  show: ef-document.with(
    watermark: context {
    if here().page() > 1 {
        image(dither(
          read("./.figures/Darya-logo.nobg.png", encoding: none),
          palette: (white, rgb("#f4f4f4")), 
          edge-threshold: 0.2,
          brightness: -0.2,
        ))
      }
    },
    watermark-rotation: 0deg,
    footer: (
      content: text(rgb("#959595"))[licenciado MIT],
    ),
    ..ef-defaults,
  )
  set text(
    font: "Libertinus Serif",
    lang: "pt",
    region: "br",
    size: 14pt,
  )
  set figure.caption(position: top)
  set heading(numbering: "1.1.")
  show heading: set block(below: 1.5em)
  show math.equation: set text(font: "IBM Plex Math" )

  align(center)[
    #image("./.figures/Darya-logo.png", width: 25%)
    #text(1em, weight: 300, "DISPONIBILIZADO POR DARYA ORG\n")
    #text(0.8em, weight: 300, title)
  ]

  pagebreak()

  outline(title: [Sumário])

  pagebreak()
  set page(numbering: "1", number-align: left)
  counter(page).update(1)
  body
  pagebreak()

  align(center)[#text(size: 2em)[Atribuição]]
  // Again, this is a hack (I hate good code)
  grid(
    columns: (1fr, 2fr),
    gutter: 0fr,
    rows: (auto),
    rect(width: 20em, height: 20em, stroke: none)[IMAGEM AQUI],
    rect(width: 100%, stroke: none)[
      #strong[Felipe S.C. Lorentz]\
      Aluno Colégio Dante Alighieri\
      ---\
      Referências e ilustrações
    ],
    rect(width: 20em, height: 20em, stroke: none)[IMAGEM AQUI],
    rect(width: 100%, stroke: none)[
      #strong[Gabriela Capuzzo]\
      Aluna Colégio Dante Alighieri\
      ---\
      Referências
    ],
    rect(width: 20em, height: 20em, stroke: none)[IMAGEM AQUI],
    rect(width: 100%, stroke: none)[
      #strong[Júlia Hora]\
      Aluna Colégio Dante Alighieri\
      ---\
      Fotos
    ],
  )
  align(center + bottom)[
    por favor, mantenha as páginas de atribuição
  ]
}

#let ctz-picture(path) = {
  assert(
    (type(path) == str and path != none),
    message: "Argumento 'path' deve ser uma string"
  )
  eval(
    read(path)
        .clusters()
        .slice(1)
        .join()
  )
}