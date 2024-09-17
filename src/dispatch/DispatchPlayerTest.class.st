Class {
	#name : 'DispatchPlayerTest',
	#superclass : 'TestCase',
	#category : 'dispatch',
	#package : 'dispatch'
}

{ #category : 'tests' }
DispatchPlayerTest >> testAdditionTwoIntegersWork [
	self assert: (DispatchPlayer new makeResult: 8 and: 9)
	equals: 'Addition de deux entiers 8 et 9 donne 17'
]

{ #category : 'tests' }
DispatchPlayerTest >> testConcateneTwoStringsWork [
	self assert: (DispatchPlayer new makeResult: 'bon'  and: 'jour')
	equals: 'Concaténation de deux chaînes avec un espace: bon jour'
]

{ #category : 'as yet unclassified' }
DispatchPlayerTest >> testtwoArgumentsDoesnotWorkTogether [
	self assert: (DispatchPlayer new makeResult: 8 and: 'bonjour')
	equals: 'Cas non pris en charge'
]
