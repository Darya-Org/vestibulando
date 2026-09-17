#import "model.typ": *

#show: prova_model.with(
  title: [Resumo de História - E.M.],
)

= Imperialismo

#timeline((
  ("2024", [Start]),
  ("2025", [Pilot]),
  ("2026", [Launch])
))

== Conferência de Berlim

== Guerra dos Bôvus

== Índia

== Ásia

== China

= Independência do Brasil

== Primeiro Reinado

== Período de Regência

== Segundo Reinado

== Crise do Império

#align(center)[
  #ctz-canvas(length: 1cm, clip-canvas: (0, -2, 8, 0), {
    import cetz.draw: *

    ctz-init()

    let pos = (0, 0)

    line((pos.at(0) -1, pos.at(1) + 8), (pos.at(0) + 11, pos.at(1) + 8))

    /*rect((pos.at(0) + 4, pos.at(1)), (pos.at(0) + 6, pos.at(1) + 8))
    rect((pos.at(0) + 8, pos.at(1)), (pos.at(0) + 10, pos.at(1) + 8))*/

    for x in range(3) {
      rect(
        (pos.at(0) + x, pos.at(1)),
        (pos.at(0) + x * 2, pos.at(1) + 8),
      )
    }

    content(
      (pos.at(0) - 0.2, pos.at(1) - 1), anchor: "west",
      [Elite Agrária]
    )
    content(
      (pos.at(0) + 3.3, pos.at(1) - 1), (pos.at(0) + 7, pos.at(1) - 1), anchor: "west",
      align(center)[
        *Igreja Católica*\
        Legitimidade atrelada ao estado _Padroado_
      ]
    )
    content(
      (pos.at(0) + 8.2, pos.at(1) - 1), anchor: "west",
      [Exército]
    )
  })
]

== Instauração da República

== República da Espada

== República Oligárquica

=== Bandidismo Social e Cangaço

=== Guerra dos Canudos

=== Revolta da Vacina

== Ditadura de 1937

== Golpe Militar de 19649