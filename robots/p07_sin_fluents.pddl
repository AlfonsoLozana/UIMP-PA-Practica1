(define (problem robots)
  (:domain domain-robots-sin-fluents)
  (:objects
    l01 l02 l03 l04 l05 l06 l07 l08 l09 l10 - location
    capacidad0 capacidad1 capacidad2 - capacidad
    robotB0 robotB1 - robot-brazo
    robotC0 robotC1 - robot-cesta
    pobject0 pobject1 pobject2 pobject3 pobject4 pobject5 pobject6 pobject7 pobject8 pobject9 pobject10 pobject11 pobject12 pobject13 pobject14 - pobject
  )
  (:init
    ;FUNCTIONS
    (capacidad_robot robotB0 capacidad2)
    (capacidad_robot robotB1 capacidad2)
    (capacidad_robot robotC0 capacidad0)
    (capacidad_robot robotC1 capacidad0)

    (predecesor_capacidad capacidad0 capacidad1)
    (predecesor_capacidad capacidad1 capacidad2)

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
    (at-pobject pobject10 l01)
    (at-pobject pobject11 l01)
    (at-pobject pobject12 l01)
    (at-pobject pobject13 l01)
    (at-pobject pobject14 l01)

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
      (at-pobject pobject9 l08)
      (at-pobject pobject10 l08)
      (at-pobject pobject11 l08)
      (at-pobject pobject12 l08)
      (at-pobject pobject13 l08)
      (at-pobject pobject14 l08)
    )
  )
)