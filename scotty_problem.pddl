(define (problem scotty-eating-cookie)
    (:domain scotty-domain)
    
    (:objects
        LPaw RPaw - paw
        Glass1 - glass
        Cookie1 - cookie
        Table1 - table
    )
    
    (:init
        (PAW LPaw)
        (PAW RPaw)
        (GLASS Glass1)
        (COOKIE Cookie1)
        (TABLE Table1)
        (ON Cookie1 Table1)
        (ON Glass1 Table1)
        (not (COOKIE_WET Cookie1))
        (not (COOKIE_EATEN Cookie1))
        (PAW_FREE LPaw)
        (PAW_FREE RPaw)
        (not (GLASS_EMPTY Glass1))
    )
    
    (:goal
        (and
            (COOKIE_EATEN Cookie1)
        )
    )
)
