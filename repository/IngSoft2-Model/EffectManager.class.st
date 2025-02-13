Class {
	#name : 'EffectManager',
	#superclass : 'Object',
	#instVars : [
		'boxesDistributions'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
EffectManager class >> with: aBoxDistributionCollection [ 
	^self new initilizeWith: aBoxDistributionCollection.
]

{ #category : 'as yet unclassified' }
EffectManager >> boxForRandomValue: randomValue cumulativeDistributions: cumulativeDistributions place: aPlace [ 
	| selectedBox |
        selectedBox := cumulativeDistributions detect: [:each |
            randomValue <= (each at: 2).
        ] ifNone: [cumulativeDistributions last].
        ^((selectedBox at: 1) inPlace: aPlace)
  
]

{ #category : 'as yet unclassified' }
EffectManager >> calculateCumulativeDistributions [

	| cumulativeProbabilities currentSum |
	cumulativeProbabilities := OrderedCollection new.
	currentSum := 0.
	boxesDistributions do: [ :each |
		currentSum := currentSum + (each getDistribution).
		cumulativeProbabilities add:
			(Array with: (each getEffect) with: currentSum) ].
	^ cumulativeProbabilities
]

{ #category : 'as yet unclassified' }
EffectManager >> createFor: anAmountOfBoxes [

	| boxes cumulativeDistributions randomValue random aWormHole anotheWormHole anIndex anotherIndex |
	random := Random new.
	boxes := OrderedCollection new: anAmountOfBoxes.
	boxes add: (NoEffectBox inPlace: 1).
	cumulativeDistributions := self calculateCumulativeDistributions.
	anIndex := (2 to: anAmountOfBoxes - 1) atRandom.
	anotherIndex := (anIndex + 1 to: anAmountOfBoxes) atRandom.
	aWormHole := WormHoleBox inPlace: anIndex.
	anotheWormHole := WormHoleBox inPlace: anotherIndex.
	aWormHole withDestiny: anotheWormHole.
	anotheWormHole withDestiny: aWormHole.

	2 to: anAmountOfBoxes do: [ :i |
		i
			caseOf: {
					([ anIndex ] -> [ boxes add: aWormHole ]).
					([ anotherIndex ] -> [ boxes add: anotheWormHole ]) }
			otherwise: [
				randomValue := random next * 100.
				boxes add: (self
						 boxForRandomValue: randomValue
						 cumulativeDistributions: cumulativeDistributions
						 place: i) ] ].

	^ boxes
]

{ #category : 'as yet unclassified' }
EffectManager >> initilizeWith: aBoxDistributionCollection [ 
	boxesDistributions := aBoxDistributionCollection.
]
