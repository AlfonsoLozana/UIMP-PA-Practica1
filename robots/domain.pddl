(define (domain robots)
    (:requirements :strips :typing) 
  (:types location pobject robot - object)
  
  (:predicates (at-robot ?r - robot ?l - location)
	       (at-pobject ?p - pobject ?l - location)
	       (holding ?r - robot ?p - pobject)
	       (connected ?l - location ?l1 - location)
	       )

  (:action MOVE
	   :parameters (?r - robot ?l - location ?l1 - location)
	   :precondition (and (at-robot ?r ?l)
 			      (connected ?l ?l1))
	   :effect (and (at-robot ?r ?l1)
			(not (at-robot ?r ?l))))

  (:action PICK-UP
	   :parameters (?r - robot ?l - location ?p - pobject)
	   :precondition (and (at-robot ?r ?l)
			      (at-pobject ?p ?l))
	   :effect (and (not (at-pobject ?p ?l))
			(holding ?r ?p)))

  (:action PUT-DOWN
	   :parameters (?r - robot ?l - location ?p - pobject)
	   :precondition (and (at-robot ?r ?l)
			      (holding ?r ?p))
	   :effect (and (not (holding ?r ?p))
			(at-pobject ?p ?l)))
  )
