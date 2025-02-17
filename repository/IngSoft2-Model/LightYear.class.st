Class {
	#name : 'LightYear',
	#superclass : 'Lenght',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
LightYear >> convertToParsec [

	^ value / 3
]
