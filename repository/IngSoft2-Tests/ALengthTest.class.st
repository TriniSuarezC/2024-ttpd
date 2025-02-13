Class {
	#name : 'ALengthTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ALengthTest >> test_01_WhenAParsecHasMoreValueThanTheOtherThenThisParsecIsBigger [

| aParsec anotherParsec |
aParsec := Parsec withValue: 4.
anotherParsec := Parsec withValue: 3.
self assert: aParsec > anotherParsec.
]

{ #category : 'tests' }
ALengthTest >> test_02_WhenAParsecHasLessValueButTheConvertionIsBiggerThenTheParsecIsBetterThanTheLightYear [

| aParsec aLightYear |
aParsec := Parsec withValue: 4.
aLightYear := LightYear withValue: 10.
self assert: aParsec > aLightYear.
]

{ #category : 'tests' }
ALengthTest >> test_03_ALenghtObjectCanConvertToParsec [

| aLenght |
aLenght := Lenght withValue: 4.
self assert: aLenght convertToParsec equals: 4.
]
