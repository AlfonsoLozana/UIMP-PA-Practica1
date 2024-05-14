(define (problem robots)
  (:domain domain-robots)
  (:objects
    l01 l02 l03 l04 l05 l06 l07 l08 l09 l10 - location
    robotB0 robotB1 - robot-brazo
    robotC0 robotC1 - robot-cesta
    pobject0 pobject1 pobject2 pobject3 pobject4 pobject5 pobject6 pobject7 pobject8 pobject9 - pobject
  )
  (:init
    ;FUNCTIONS
    (= (brazos-libres robotB0) 2)
    (= (brazos-libres robotB1) 2)

    ;Robots con brazos
    (at-robot robotB0 l01)
    (at-robot robotB1 l01)
    (has-brazo robotB0)
    (has-brazo robotB1)

    ;robots sin brazos
    (at-robot robotC0 l10)
    (at-robot robotC1 l10)

    ;posiciones de los objetos
    (at-pobject pobject0 l01)
    (at-pobject pobject1 l01)
    (at-pobject pobject2 l01)
    (at-pobject pobject3 l01)
    (at-pobject pobject4 l01)
    (at-pobject pobject5 l01)
    (at-pobject pobject6 l01)
    (at-pobject pobject7 l01)
    (at-pobject pobject8 l01)
    (at-pobject pobject9 l01)

    ;Localizaciones
    (connected l01 l02)
    (connected l02 l01)
    (connected l03 l02)
    (connected l02 l03)
    (connected l04 l02)
    (connected l02 l04)
    (connected l05 l02)
    (connected l02 l05)
    (connected l06 l05)
    (connected l05 l06)
    (connected l07 l05)
    (connected l05 l07)
    (connected l08 l05)
    (connected l05 l08)
    (connected l09 l08)
    (connected l08 l09)
    (connected l10 l08)
    (connected l08 l10)
  )
  (:goal
    (and
      (at-pobject pobject0 l08)
      (at-pobject pobject1 l08)
      (at-pobject pobject2 l08)
      (at-pobject pobject3 l08)
      (at-pobject pobject4 l08)
      (at-pobject pobject5 l08)
      (at-pobject pobject6 l08)
      (at-pobject pobject7 l08)
      (at-pobject pobject8 l08)
      (at-pobject pobject9 l08))
  )
)