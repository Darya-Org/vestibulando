#import "@preview/cetz:0.4.2"

#let prova_model(
  title: text,
  body,
) = {
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
    #image(".figures/Darya-logo.png", width: 25%)
    #text(1em, weight: 300, "DISPONIBILIZADO POR DARYA ORG\n")
    #text(0.8em, weight: 300, title)
  ]

  pagebreak()

  outline(title: [Sumário])

  pagebreak()
  set page(numbering: "1", number-align: left)
  counter(page).update(1)
  body
}
