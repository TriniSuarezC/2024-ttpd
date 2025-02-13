Class {
	#name : 'AParsectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AParsectTest >> test_02_ParsecNotAffectedByConvertToParsec [ 

| aParsec |
aParsec:=Parsec withValue: 4.

self assert:aParsec convertToParsec equals: 4.

]
