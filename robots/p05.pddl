(define (problem robots)
  (:domain domain-robots)
  (:objects
    l01 l02 l03 l04 l05 l06 l07 l08 l09 l10 - location
    robotB0 - robot-brazo
    robotC0 - robot-cesta
    pobject0 pobject1 pobject2 pobject3 pobject4 pobject5 - pobject
  )
  (:init
    ;FUNCTIONS
    (= (brazos-libres robotB0) 2)

    (at-robot robotB0 l01)
    (at-robot robotC0 l02)
    (has-brazo robotB0)
    (at-pobject pobject0 l03)
    (at-pobject pobject1 l04)
    (at-pobject pobject2 l05)
    (at-pobject pobject3 l06)
    (at-pobject pobject4 l07)
    (at-pobject pobject5 l08)
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
      (at-pobject pobject0 l01)
      (at-pobject pobject1 l02)
      (at-pobject pobject2 l03)
      (at-pobject pobject3 l04)
      (at-pobject pobject4 l05)
      (at-pobject pobject5 l06))
  )
)