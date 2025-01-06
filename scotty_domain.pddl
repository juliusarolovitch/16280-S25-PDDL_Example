(define (domain scotty-domain)
    (:requirements :strips :typing :negative-preconditions)
    
    (:types
        item
        paw table
        glass cookie - item
    )
    
    (:predicates
        (PAW ?x - paw)
        (GLASS ?x - glass)
        (COOKIE ?x - cookie)
        (TABLE ?x - table)
        (PAW_FREE ?x - paw)
        (GLASS_EMPTY ?x - glass)
        (COOKIE_EATEN ?x - cookie)
        (COOKIE_WET ?x - cookie)
        (ON ?x - item ?y - table)
        (CARRYING ?x - paw ?y - item)
    )
    
    (:action PICK_UP_GLASS
        :parameters (?x - glass ?y - paw)
        :precondition (and
            (GLASS ?x)
            (ON ?x Table1)
            (PAW_FREE ?y)
        )
        :effect (and
            (not (ON ?x Table1))
            (not (PAW_FREE ?y))
            (CARRYING ?y ?x)
        )
    )
    
    (:action PICK_UP_COOKIE
        :parameters (?x - cookie ?y - paw)
        :precondition (and
            (COOKIE ?x)
            (ON ?x Table1)
            (PAW_FREE ?y)
        )
        :effect (and
            (not (ON ?x Table1))
            (not (PAW_FREE ?y))
            (CARRYING ?y ?x)
        )
    )
    
    (:action DIP
        :parameters (?x - cookie ?y - glass)
        :precondition (and
            (CARRYING LPaw ?y)
            (CARRYING RPaw ?x)
            (not (GLASS_EMPTY ?y))
            (not (COOKIE_EATEN ?x))
        )
        :effect (and
            (GLASS_EMPTY ?y)
            (COOKIE_WET ?x)
        )
    )
    
    (:action EAT
        :parameters (?x - cookie)
        :precondition (and
            (COOKIE ?x)
            (COOKIE_WET ?x)
            (not (ON ?x Table1))
            (not (COOKIE_EATEN ?x))
        )
        :effect (COOKIE_EATEN ?x)
    )
)
