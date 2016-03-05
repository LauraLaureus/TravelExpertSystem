(deftemplate travel_preferences
	(slot maxCost (type INTEGER)(allowed-values 1 2 3 4 5))
	(multislot language)
	(multislot travelKind (allowed-values entertraining cultural landscape))
)

(deftemplate travel_destiny
	(slot interestingPoint)
	(multislot countries)
)

(deftemplate country
	(multislot officialLanguages (default english))
	(slot livingCost (type INTEGER) (allowed-values 1 2 3 4 5) (default 4))
)

(deffacts contriesBase
	(country Spain (officialLanguages spanish catala euskera galician))
	(country France (officialLanguages french)(livingCost 5))
	(country USA (officialLanguages english)(livingCost 5))
	(country Brasil (officialLanguages portuguese))
	(country Japan (officialLanguages japanese)(livingCost 3))
)

(deffacts destiniesBase
	(travel_destiny Paris (interestingPoint cultural entertraining landscape) (countries France))
	(travel_destiny Madrid (interestingPoint cultural entertraining landscape) (countries Spain))
	(travel_destiny Paris (interestingPoint landscape) (countries Brasil))
	(travel_destiny Pirineos (interestingPoint entertraining landscape) (countries France Spain))
)