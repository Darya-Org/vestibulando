#import "@preview/cetz:0.4.2"
#import "@preview/edgeframe:0.3.0": *
#import "@preview/bulb:0.2.1": *
#import "@preview/typart:0.1.1": *
#import "@preview/ctz-euclide:0.1.5": *

#let prova_model(
  title: text,
  body,
) = {
  show: ef-document.with(
    watermark: context {
    if here().page() > 1 {
        image(
        	dither(
          	read("figures/Darya-logo.nobg.png",
           	encoding: none
          ),
          palette: (white, rgb("#f4f4f4")), 
          edge-threshold: 0.2,
          brightness: -0.2,
        ))
      }
    },
    watermark-rotation: 0deg,
    footer: (
      content: text(rgb("#959595"))[licensa MIT],
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
    #image("figures/Darya-logo.png", width: 25%)
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