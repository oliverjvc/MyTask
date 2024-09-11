Class {
	#name : #MTTask,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #MyTask
}

{ #category : #'instance creation' }
MTTask class >> title: aTitle text: aText [
^ self new
title: aTitle;
text: aText;
yourself
]

{ #category : #'instance creation' }
MTTask class >> title: aTitle text: aText category: aCategory [
^ (self title: aTitle text: aText)
category: aCategory;
yourself
]

{ #category : #'as yet unclassified' }
MTTask class >> unclassifiedTag [
^ 'Unclassified' 
]

{ #category : #action }
MTTask >> beVisible [
self visible: true
]

{ #category : #accessing }
MTTask >> category [
^ category
]

{ #category : #accessing }
MTTask >> category: anObject [
	category := anObject
]

{ #category : #accessing }
MTTask >> date [
^ date
]

{ #category : #accessing }
MTTask >> date: aDate [
	date := aDate
]

{ #category : #initialization }
MTTask >> initialize [
super initialize.
self category: MTTask unclassifiedTag.
self date: Date today.
self notVisible
]

{ #category : #testing }
MTTask >> isUnclassified [
	^ self category = MTTask unclassifiedTag
]

{ #category : #testing }
MTTask >> isVisible [
^ self visible
]

{ #category : #action }
MTTask >> notVisible [
self visible: false
]

{ #category : #accessing }
MTTask >> text [
^ text
]

{ #category : #accessing }
MTTask >> text: aString [
	text := aString
]

{ #category : #accessing }
MTTask >> title [
^ title
]

{ #category : #accessing }
MTTask >> title: aString [
title := aString
]

{ #category : #accessing }
MTTask >> visible [
^ visible
]

{ #category : #accessing }
MTTask >> visible: aBoolean [
visible := aBoolean
]
