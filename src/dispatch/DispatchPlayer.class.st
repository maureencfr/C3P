"
a class for my examples with message dispatch
"
Class {
	#name : 'DispatchPlayer',
	#superclass : 'Object',
	#category : 'dispatch',
	#package : 'dispatch'
}

{ #category : 'API' }
DispatchPlayer >> additionTwoNumbers: int1 and: int2 [
    ^'Addition de deux entiers ',int1 asString, ' et ', int2 asString, ' donne ', (int1 + int2) asString
]

{ #category : 'API' }
DispatchPlayer >> concateneTwoStrings: str1 and: str2 [
    ^'Concaténation de deux chaînes avec un espace: ', str1, ' ', str2
]

{ #category : 'API' }
DispatchPlayer >> makeResult: arg1 and: arg2 [
    (arg1 isNumber and: [arg2 isNumber])
      ifTrue: [ ^self additionTwoNumbers: arg1 and: arg2 ].
    (arg1 isString and: [arg2 isString])
      ifTrue: [ ^self concateneTwoStrings: arg1 and: arg2 ].
    
    ^'Cas non pris en charge'
]
