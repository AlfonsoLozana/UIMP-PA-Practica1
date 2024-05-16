(define (domain domain-robots)
    (:requirements :strips :typing)
    (:types
        location pobject robot - object
        robot-brazo - robot
        robot-cesta - robot
    )

    (:predicates
        (at-robot ?r - robot ?l - location)
        (at-pobject ?p - pobject ?l - location)
        (holding ?r - robot ?p - pobject)
        (connected ?l - location ?l1 - location)
        (in-cesta ?r - robot ?p - pobject)
        (has-brazo ?r - robot)
    )

    (:functions
        (brazos-libres ?r - robot)
    )

    (:action MOVE
        :parameters (?r - robot ?l - location ?l1 - location)
        :precondition (and (at-robot ?r ?l)
            (connected ?l ?l1)
        )
        :effect (and (at-robot ?r ?l1)
            (not (at-robot ?r ?l)))
    )

    (:action PICK-UP
        :parameters (?rb - robot-brazo ?l - location ?p - pobject)
        :precondition (and (at-robot ?rb ?l)
            (> (brazos-libres ?rb) 0)
            (at-pobject ?p ?l))
        :effect (and (not (at-pobject ?p ?l))
            (decrease (brazos-libres ?rb) 1)
            (holding ?rb ?p))
    )

    (:action PUT-DOWN
        :parameters (?rb - robot-brazo ?l - location ?p - pobject)
        :precondition (and (at-robot ?rb ?l)
            (holding ?rb ?p))
        :effect (and (not (holding ?rb ?p))
            (increase (brazos-libres ?rb) 1)
            (at-pobject ?p ?l))
    )

    (:action GIVE
        :parameters (?rb - robot-brazo ?r - robot ?p - pobject ?l - location)
        :precondition (and (holding ?rb ?p)
            (at-robot ?rb ?l)
            (at-robot ?r ?l)
            (or (not (has-brazo ?r))
                (and (has-brazo ?r) (> (brazos-libres ?r) 0))))
        :effect (and
            (not (holding ?rb ?p))
            (increase (brazos-libres ?rb) 1)
            (when
                (has-brazo ?r)
                (and (decrease (brazos-libres ?r) 1)
                    (holding ?r ?p)))
            (when
                (not (has-brazo ?r))
                (in-cesta ?r ?p))
        )
    )

    (:action TAKE
        :parameters (?rb - robot-brazo ?r - robot ?p - pobject ?l - location)
        :precondition (and (at-robot ?rb ?l)
            (at-robot ?r ?l)
            (> (brazos-libres ?rb) 0)
            (or (and (has-brazo ?r) (holding ?r ?p))
                (and (not (has-brazo ?r)) (in-cesta ?r ?p))))
        :effect (and
            (holding ?rb ?p)
            (decrease (brazos-libres ?rb) 1)
            (when
                (has-brazo ?r)
                (and
                    (increase (brazos-libres ?r) 1)
                    (not (holding ?r ?p))))
            (when
                (not (has-brazo ?r))
                (not (in-cesta ?r ?p)))
        )
    )
)