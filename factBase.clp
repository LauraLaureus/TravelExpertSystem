(deftemplate travel_preferences
	(slot maxCost (type INTEGER)(allowed-values 1 2 3 4 5))
	(multislot language)
	(multislot travelKind (allowed-values entertraining cultural landscape))
)

(deftemplate travel_destiny
	(slot name)
	(slot interestingPoint)
	(multislot countries)
)

(deftemplate country
	(slot name)
	(multislot officialLanguages (default english))
	(slot livingCost (type INTEGER) (allowed-values 1 2 3 4 5) (default 4))
)

(deffacts contriesBase
	(country (name Spain) (officialLanguages spanish catala euskera galician))
	(country (name France) (officialLanguages french)(livingCost 5))
	(country (name USA) (officialLanguages english)(livingCost 5))
	(country (name Brasil) (officialLanguages portuguese))
	(country (name Japan) (officialLanguages japanese)(livingCost 3))
)

(deffacts destiniesBase
	(travel_destiny (name Paris) (interestingPoint cultural entertraining landscape) (countries France))
	(travel_destiny (name Madrid) (interestingPoint cultural entertraining landscape) (countries Spain))
	(travel_destiny (name Amazonas) (interestingPoint landscape) (countries Brasil))
	(travel_destiny (name Pirineos) (interestingPoint entertraining landscape) (countries France Spain))
)