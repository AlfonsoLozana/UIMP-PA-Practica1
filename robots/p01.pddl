(define (problem p01)
     (:domain robots)
     (:objects
          l01 l02 l03 l04 l05 l06 l07 l08 l09 l10 - location
          robot0 - robot
          pobject0 - pobject
     )
     (:init
          (at-robot robot0 l01)
          (at-pobject pobject0 l01)
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
          (and (at-pobject pobject0 l10))
     )
)