"
represents the entiere map of earth
"
Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'Flags',
	#package : 'Flags'
}

{ #category : 'acccessing' }
EarthMap >> countries [
	^ countries
]

{ #category : 'API' }
EarthMap >> importCountriesFrom: aXmlFile [
    | xmlTree nodes |
    xmlTree := self xmlTreeFromFile: aXmlFile.
    nodes := xmlTree allNodes.
    nodes do: [ :node | node class = XMLElement ifTrue:[countries add: (self importCountryFromXMLNode: node)] ].

	
]

{ #category : 'API' }
EarthMap >> importCountryFromXMLNode: aXMLElement [
	countries add: (EarthMapCountry new fromXML: aXMLElement)
]

{ #category : 'initialize' }
EarthMap >> initialize [
	super initialize.
	countries := OrderedCollection new
]

{ #category : 'API' }
EarthMap >> openPopulatedCanvas [
	self populatedCanvas open
]

{ #category : 'API' }
EarthMap >> populatedCanvas [
	^ RSCanvas new
	addAll: (countries collect: [ :country | country asRSShape ]);
	@ RSCanvasController;
	yourself
]

{ #category : 'API' }
EarthMap >> xmlTreeFromFile: aFileName [
	^ aFileName asFileReference readStreamDo: [ :stream | (XMLDOMParser parse: stream) document ]
]
