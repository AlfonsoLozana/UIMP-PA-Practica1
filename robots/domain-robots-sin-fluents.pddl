(define (domain domain-robots-sin-fluents)
    (:requirements :strips :typing)
    (:types
        location pobject robot capacidad - object
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
        (capacidad_robot ?r - robot ?c - capacidad)
        (predecesor_capacidad ?c1 - capacidad ?c2 - capacidad)
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
        :parameters (?rb - robot-brazo ?l - location ?p - pobject ?capacidad_actual ?final_capacidad - capacidad)
        :precondition (and (at-robot ?rb ?l)
            (not(capacidad_robot ?rb capacidad0))
            (capacidad_robot ?rb ?capacidad_actual)
            (predecesor_capacidad ?final_capacidad ?capacidad_actual)
            (at-pobject ?p ?l))
        :effect (and (not (at-pobject ?p ?l))
            (not(capacidad_robot ?rb ?capacidad_actual))
            (capacidad_robot ?rb ?final_capacidad)
            (holding ?rb ?p))
    )

    (:action PUT-DOWN
        :parameters (?rb - robot-brazo ?l - location ?p - pobject ?capacidad_actual ?final_capacidad - capacidad)
        :precondition (and (at-robot ?rb ?l)
            (capacidad_robot ?rb ?capacidad_actual)
            (predecesor_capacidad ?capacidad_actual ?final_capacidad)
            (holding ?rb ?p))
        :effect (and (not (holding ?rb ?p))
            (not(capacidad_robot ?rb ?capacidad_actual))
            (capacidad_robot ?rb ?final_capacidad)
            (at-pobject ?p ?l))
    )

    (:action GIVE
        :parameters (?rb - robot-brazo ?r - robot ?p - pobject ?l - location ?capacidad_actual_rb ?capacidad_final_rb ?capacidad_actual_r ?final_capacidad_r - capacidad)
        :precondition (and (holding ?rb ?p)
            (at-robot ?rb ?l)
            (at-robot ?r ?l)
            (capacidad_robot ?rb ?capacidad_actual_rb)
            (predecesor_capacidad ?capacidad_actual_rb ?capacidad_final_rb)
            (or (not (has-brazo ?r))
                (and (not(capacidad_robot ?r capacidad0))
                    (capacidad_robot ?r ?capacidad_actual_r)
                    (predecesor_capacidad ?final_capacidad_r ?capacidad_actual_r))))
        :effect (and
            (not (holding ?rb ?p))
            (not(capacidad_robot ?rb ?capacidad_actual_rb))
            (capacidad_robot ?rb ?capacidad_final_rb)
            (when
                (has-brazo ?r)
                (and (not(capacidad_robot ?r ?capacidad_actual_r))
                    (capacidad_robot ?r ?final_capacidad_r)
                    (holding ?r ?p)))
            (when
                (not (has-brazo ?r))
                (in-cesta ?r ?p))
        )
    )

    (:action TAKE
        :parameters (?rb - robot-brazo ?r - robot ?p - pobject ?l - location ?capacidad_actual_rb ?capacidad_final_rb ?capacidad_actual_r ?final_capacidad_r - capacidad)
        :precondition (and (at-robot ?rb ?l)
            (at-robot ?r ?l)
            (not(capacidad_robot ?rb capacidad0))
            (capacidad_robot ?rb ?capacidad_actual_rb)
            (predecesor_capacidad ?capacidad_final_rb ?capacidad_actual_rb)
            (or (and (has-brazo ?r)
                    (holding ?r ?p)
                    (capacidad_robot ?r ?capacidad_actual_r)
                    (predecesor_capacidad ?capacidad_actual_r ?final_capacidad_r))
                (and (not (has-brazo ?r)) (in-cesta ?r ?p))))
        :effect (and
            (holding ?rb ?p)
            (not(capacidad_robot ?rb ?capacidad_actual_rb))
            (capacidad_robot ?rb ?capacidad_final_rb)
            (when
                (has-brazo ?r)
                (and
                    (not(capacidad_robot ?r ?capacidad_actual_r))
                    (capacidad_robot ?r ?final_capacidad_r)
                    (not (holding ?r ?p))))
            (when
                (not (has-brazo ?r))
                (not (in-cesta ?r ?p)))
        )
    )
)