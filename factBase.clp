(deftemplate travel_preferences
	(slot maxCost (type INTEGER)(allowed-values 1 2 3 4 5))
	(multislot language)
	(multislot travelKind (allowed-values entertraining cultural landscape))
)

(deftemplate travel_destiny
	(slot interesPoint)
	(multislot contries)
)

(deftemplate contry
	(multislot officialLanguages)
	(slot livingCost (type INTEGER) (allowed-values 1 2 3 4 5))
)

