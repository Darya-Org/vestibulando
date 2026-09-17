#import "model.typ": prova_model, cetz

#show: prova_model.with(
  title: [Resumo de Português - E.M.],
)

= Gramática

= Literatura

== Padre Antônio Vieira

=== Contexto

Era um Jesuíta. Explorava o conceptismo, ou seja, construção de lógica, na sua prosa. Desenvolvendo argumentos usando uma estrutura persuasiva como um jogo de ideias, silogismo (_veja em "Figuras de Linguagem"_) aristotélico.

=== Estrutura do Sermão

- Introito ou Exórdio: Introdução do texto e apresentação do tema.\
  $arrow.r$ Pede inspiração a um santo, similarmente a como Camões pedia inspiração as 9 musas.
- Argumentos: Desenvolve argumentos para defender o seu ponto de vista e criticas.\
  $arrow.r$ Usa trechos bíblicos como justificativa para a base do seu argumento.
- Peroração: Conclusão, parte final e fechamento do discurso.\
  $arrow.r$ Reforça a mensagem principal.


== Arcadismo

Idade Clássica: Sociedade Greco-Romana (Homero)\
Idade média: Trovadorismo (D. Dinis)\
Transição: Humanismo (Gil Vicente)\
Renascimento: Classicismo (Camões)\
Transição: Maneirismo (Camões)\
Período Colonial: Barroco (Gregório de Matos)\
Neoclassicismo - Iluminismo: Arcadismo\

=== Figuras de linguagem e Sintaxe Importantes

L - Antítese: Palavras de sentidos contrario ("Amor e Ódio")\
L - Paradoxo: Ideias opostas ("ferida que doí, mas não se sente")\
S - Hipérbato: Troca na ordem das palavras. Troca das palavras na ordem.\
S - Quiasmo: Disposição cruzada em diferentes versos de um poema\
S - Silogismo: Argumentação lógica no poema "Já que... E que... Logo..."

=== Analise dos Poemas (em geral, Gregório de Matos)

#cetz.canvas({
  import cetz.draw: *

  content((-4,0), [1. Identificar:])

  content((0,-3), [
    - Estrutura: Soneto (14 versos e 4 estrofes)
    - Tema\
      $arrow.curve$ Problema/ Tese\
      $arrow.curve$ Se há interlocução
    - Argumentos
    - Conclusão: Tercetos
    - Construção de sentido\*
  ])

  content((0, -5.8), [\*Relaciona o cultismo ao conceptismo através:])
  content((-1.6, -8), [Possíveis Figuras de Sintaxe:
    - Quiasmo
    - Antítese
    - Paradoxo
    - Hipérbato
  ])
  content((6, -7.35), [Possíveis Figuras de Linguagem:
    - Hipérbole
    - Metáfora
  ])

  line((4.8, 0), (5,0),(5,-5),(5, -2.5), (5.5, -2.5), (5, -2.5), (5, -5), (4.8, -5))

  content((8, -2.5), [Conceptismo\ (com quem ele fala)])

  content((-1.4, -11), [
    2. Estabelecer relações
    3. Explicar
    4. Justificar usando elementos do texto
  ])

  line((3.8, -10), (4, -10), (4, -12), (4, -11), (4.5, -11), (4, -11), (4, -12), (3.8, -12))

  content((5.5, -11), [Autoral])

  content((2, -15), [
    Exemplo:\
    "É possível perceber elementos de cultismo no poema, como em ...,\ pelo uso da figura de linguagem ..., para criar um efeito de ... durante \ a elaboração do poema, que é conectada com o conceptismo através\ dos elementos ... apresentados na conclusão do poema. A intenção do\ _Autor_ ao usar essas figuras de linguagem é criar um jogo de ideias\ baseando-se em lógica, dessa forma, justificando seus argumentos\ através da razão."
  ])
})

== Romantismo

=== Contexto Histórico

=== Principais Características

- Subjetivismo
- Individualismo
- Classe dominante
- Pessimismo
- Admiração pela natureza
- Nacionalismo
- Exploração do sobrenatural
- historicismo

=== 1° Geração

Criação de identidade artística natural para o Brasil. Circulação própria no Rio de Janeiro (próximo do empeirador). Feito pela elite para a elite.

=== 2° Geração

Caráter sentimental e negativo.

=== 3° Geração

== Realismo & Naturalismo

Ligado a natureza, instinto animal do ser humano

=== Contexto Histórico

=== Contrapontos ao Romantismo:

#align(center)[
  #table(
    columns: (auto, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [*Romantismo*], [*Realismo*],
      [Subjetividade], [Objetividade],
      [Imaginário], [Realidade],
      [Sentimentalidade], [Racionalidade],
      [Individualismo], [Verdade universal],
      [Fantasia], [Fatos observáveis],
      [Centro do mundo], ["Peça" do mundo],
      [?], [Critica ao presente]
    ),
  )
]

== Parnasianismo

_enjambment_