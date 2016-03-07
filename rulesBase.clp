;Selection rules
;Select those destinies with lower or equal cost than destired one.

(deffunction intersect (?set ?sett) 
   (bind ?r (create$)) 
   (foreach ?e ?set 
        (if (and (member$ ?e ?sett)  (member$ ?e ?r)) 
             then (bind ?r (create$ ?r ?e)))) 
 (return ?r))

(defrule cost_threshold
    (travel_preferences 
        (maxCost ?mc)
    )
    (country 
            (name ?n)
            (livingCost ?lc&:(<= ?lc ?mc))
    )
    (travel_destiny
            (name ?s)
            (countries $? ?n $?)
    )
=>
    (assert (second ?s))
)

;Select those destinies which contains almost one of languages which user can speak.
(defrule language_matching
    ?ad <- (second ?c)
    (country
        (name ?t)
        (officialLanguages $? ?o $?)
    )
    (travel_destiny
        (name ?c)
        (countries $? ?t $?)
    )
    (travel_preferences
        (language $? ?o $?)
    )
=>
    (retract ?ad)
    (assert (third ?c 0))

)
;Select those destinies with bigger number of interesting points that have the same kind than user travel kind.
(defrule country_selection
    ?t <- (third ?c ?n $?d)
    (travel_destiny
        (name ?c)
        (interestingPoint $?i)
    )
    (travel_preferences
        (travelKind $?k)
    )
    (test (< (length (intersect ?i ?k)) 1))
=>
    (bind ?int(intersect ?i ?k))
    (retract ?t)
    (printout t ?int crlf)
    (assert (candidate ?c (length ?i)))
    
)

(defrule best_candidate
    ?c1 <- (candidate ? ?l1)
    (candidate ? ?l2)
    (test (< ?l1 ?l2))
    =>
    (retract ?c1)
    (assert (bestCandidate))
)

(defrule print_bestcandidate
    ?b <- (bestCandidate)
    (candidate ?n ?p)
    =>
    (retract ?b)
    (printout t ?n ?p crlf)
)

;Working rules.
