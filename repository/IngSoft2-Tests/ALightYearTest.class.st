Class {
	#name : 'ALightYearTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
ALightYearTest >> test_02_LighYearConvertToParsecLenght [

| aLightYear |
aLightYear :=LightYear withValue: 5.

self assert: aLightYear convertToParsec equals:(5/3).

]
