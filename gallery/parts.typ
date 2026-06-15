// Gallery: full-page part styles across four representative styles
#import "@preview/beautitled:0.2.7": *

#set page(width: 10cm, height: 14cm, margin: 1.5cm)
#set text(font: "Linux Libertine", size: 10pt)

#beautitled-setup(style: "modern", chapter-prefix: "Chapter", part-prefix: "Part")
#show: beautitled-init
#part[Foundations]

#beautitled-setup(style: "elegant", part-prefix: "Part")
#part[Advanced Topics]

#beautitled-setup(style: "titled", part-prefix: "Part")
#part[Appendices]

#beautitled-setup(style: "scholarly", part-prefix: "Part")
#part[References]
