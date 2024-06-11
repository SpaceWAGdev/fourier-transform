#import "@preview/polylux:0.3.1": *
#import "@preview/cetz:0.2.2"
#import themes.university: *
#set text(lang: "de")


#show: university-theme.with(short-title: "Fourier-Transformation", short-author: [Helmbold, Krämer, Stedman], progress-bar: true)


#title-slide(title: "Die Fourier-Transformation", institution-name: none, authors: ("Georg Helmbold", "Konrad Krämer", "Liam Stedman"), date: datetime.today().display("[month]/[year]"))

#focus-slide("Was?")

#slide[
  Aufwickeln von einem Signal auf einem Kreis. Bei den richtigen Windungsfrequenzen geht die $accent(f, hat)$-Funktion $>> 0$.

  #cetz.canvas(length: 3em, {
    import cetz.draw: *

    let opts = (x-tick-step: 1, y-tick-step: 1, size: (3,3), x-min: 0, x-max: 10,y-min: -2, y-max: 2, line: "spline")

    let data = cetz.plot.add(x => (calc.sin(x) + calc.sin(2 * x)), domain: (0,10), label: $f: x -> sin(x) + sin(2x)$)
    cetz.plot.plot(axis-style: "school-book", ..opts, {data}, name: "complex_plane", size: (5, 2))
  })
]

#focus-slide("Warum?")

#slide(title: "Fallbeispiel")[
  // TODO: Freibier-song dekomponieren
]

#focus-slide("Wie?")

#focus-slide[
  #align(horizon + center)[
    $ i = sqrt(-1) \ "oder" \ x^2 + 1 = 0 $
  ]
]

#matrix-slide(title: "Komplexe Zahlen",
[
  #cetz.canvas({
    import cetz.draw: *

    circle((0,0), radius: 5cm , fill: color.hsv(220deg, 255, 255, 50), name: "complex")
    circle("complex.north", radius: 10mm, fill: white)
    content("complex.north", $CC$)
    circle((0, 0), radius: 3.8cm, fill: white, name: "real-imaginary")
    line("real-imaginary.north", "real-imaginary.south")
    content((-1.5, 0), $RR$)
    content((1.5, 0), $II$)

  })

],
[ 
  #image("complex-plane.svg", width: 100%)
  // #cetz.canvas(length: 4cm, {
  //   import cetz.draw: *

  //   let opts = (x-tick-step: 1, y-tick-step: 1, size: (3,3), x-label: $RR$, y-label: $II$, grid: true, y-unit: $i$, x-min: -3, y-min: -3, x-max: 3, y-max: 3)

  //   let data = cetz.plot.add(((-1,-1), (1, 2)), mark: "o", mark-size: 10pt, style: (stroke: none))

  //   cetz.plot.plot(axis-style: "school-book", ..opts, data, name: "complex_plane")
  // })
])

#matrix-slide(title: "Die eulersche Identität",[
  #show math.equation: set text(40pt)

  #align(center)[
  $e^(i phi) = cos phi + i sin phi \ arrow.b.double $
  $e^(i pi) = -1 + 0 i$
  ]
],
[
  #image("euler-identity.svg")
])

#slide(title: "Definition")[
  #align(horizon + center)[
    / Fourier-Transformation: $ accent(f, hat)(xi) = integral_(-infinity)^(infinity)f(x) e^(-i 2 pi xi x) d x $

    / Inverse Fourier-Transformation: 
    $ f(x) = integral_(-infinity)^(infinity)f(xi) e^(i 2 pi xi x) d xi $
  ]
]

#slide(title: "Bibliographie")[
  #bibliography("bib.yaml", full: true, title: none, style: "institute-of-electrical-and-electronics-engineers")
]