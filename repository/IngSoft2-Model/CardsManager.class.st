Class {
	#name : 'CardsManager',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardsManager >> cardsdistribution [

	| cardsDistribution |
	cardsDistribution := OrderedCollection new.
	cardsDistribution add: (Array with: OverloadCard with: 10).
	cardsDistribution add: (Array with: AllyCard with: 20).
	cardsDistribution add: (Array with: AccelerationCard with: 30).
	cardsDistribution add: (Array with: CancellationCard with: 40).
	cardsDistribution add: (Array with: RedoCard with: 50).
	cardsDistribution add: (Array with: RepeatCard with: 60).
	^cardsDistribution.
]

{ #category : 'as yet unclassified' }
CardsManager >> createACard [
	
	| aDistributionOfCards randomValue selectedCard |
	aDistributionOfCards := self cardsdistribution.
	randomValue := Random new next * 60.
	selectedCard := aDistributionOfCards detect: [:each |
            randomValue <= (each at: 2).
        ] ifNone: [aDistributionOfCards last].
	
	^(selectedCard at: 1) new.
]
