"
the browser for the aerth map
"
Class {
	#name : 'EarthCountryBrowser',
	#superclass : 'SpPresenterWithModel',
	#instVars : [
		'countryList',
		'countryCode',
		'countryFlag'
	],
	#category : 'Flags',
	#package : 'Flags'
}

{ #category : 'API' }
EarthCountryBrowser >> connectPresenters [
	countryList whenSelectedItemChangedDo: [ :item |
	self onCountrySelected: item ].
]

{ #category : 'API' }
EarthCountryBrowser >> defaultLayout [
	^ SpBoxLayout newTopToBottom
	add: (SpBoxLayout newLeftToRight
	add: countryList expand: true;
	add: countryCode width: 40)
	height: self class toolbarHeight;
	add: countryFlag height: 350;
	yourself
]

{ #category : 'API' }
EarthCountryBrowser >> flagForCountryCode: astring [
	| request pngArray |
	request := ZnClient new.
	request get:
	'https://flagcdn.com/w320/' , astring asLowercase , '.png'.
	request isSuccess ifTrue: [
	pngArray := request response contents.
	^ ImageReadWriter formFromStream: (ReadStream on: pngArray) ].
	^ BorderedMorph new asForm
]

{ #category : 'initialization' }
EarthCountryBrowser >> initializePresenters [
	super initializePresenters.
	countryList := self newDropList.
	countryList display: [ :item | item name ].
	countryList sortingBlock: [ :a :b | a model name < b model name ].
	countryList items: self model countries.
	countryCode := self newTextInput.
	countryCode editable: false.
	countryCode text: ' -- '.
	countryFlag := self newImage
]

{ #category : 'API' }
EarthCountryBrowser >> onCountrySelected: countryItem [
	countryCode text: ' ' , countryItem code.
	self flagForCountryCode: countryItem code
]
