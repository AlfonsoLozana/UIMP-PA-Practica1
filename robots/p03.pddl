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
    (at-robot robotC0 l01)
    (has-brazo robotB0)
    (at-pobject pobject0 l01)
    (at-pobject pobject1 l01)
    (at-pobject pobject2 l01)
    (at-pobject pobject3 l01)
    (at-pobject pobject4 l01)
    (at-pobject pobject5 l01)
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
      (at-pobject pobject5 l08))
  )
)


PICK-UP ROBOTB0 L01 POBJECT0
GIVE ROBOTB0 ROBOTC0 POBJECT0
PICK-UP ROBOTB0 L01 POBJECT1
GIVE ROBOTB0 ROBOTC0 POBJECT1
PICK-UP ROBOTB0 L01 POBJECT2
GIVE ROBOTB0 ROBOTC0 POBJECT2
PICK-UP ROBOTB0 L01 POBJECT3
GIVE ROBOTB0 ROBOTC0 POBJECT3
PICK-UP ROBOTB0 L01 POBJECT4
GIVE ROBOTB0 ROBOTC0 POBJECT4
PICK-UP ROBOTB0 L01 POBJECT5
GIVE ROBOTB0 ROBOTC0 POBJECT5
MOVE ROBOTB0 L01 L02
MOVE ROBOTB0 L02 L05
MOVE ROBOTB0 L05 L08
MOVE ROBOTC0 L01 L02
MOVE ROBOTC0 L02 L05
MOVE ROBOTC0 L05 L08
TAKE ROBOTB0 ROBOTC0 POBJECT0
PUT-DOWN ROBOTB0 L08 POBJECT0
TAKE ROBOTB0 ROBOTC0 POBJECT1
PUT-DOWN ROBOTB0 L08 POBJECT1
TAKE ROBOTB0 ROBOTC0 POBJECT2
PUT-DOWN ROBOTB0 L08 POBJECT2
TAKE ROBOTB0 ROBOTC0 POBJECT3
PUT-DOWN ROBOTB0 L08 POBJECT3
TAKE ROBOTB0 ROBOTC0 POBJECT4
PUT-DOWN ROBOTB0 L08 pobject4
TAKE ROBOTB0 ROBOTC0 POBJECT5
PUT-DOWN ROBOTB0 L08 pobject5