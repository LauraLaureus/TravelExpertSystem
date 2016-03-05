;Selection rules
;Select those destinies with lower or equal cost than destired one.
(defrule cost_threshold
	(travel_preferences (maxCost ?c))
	?f <-(country (name ?) (officialLanguages ?) (livingCost ?l&:(> ?l ?c)) )
=>
	(retract ?f)
)

;Select those destinies which contains almost one of languages which user can speak.
(defrule language_matching
=>
)
;Select those countries with bigger number of destinies that have the same kind than user travel kind.
(defrule country_selection
=>
)

;Working rules.
