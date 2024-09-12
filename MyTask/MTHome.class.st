Class {
	#name : #MTHome,
	#superclass : #Object,
	#instVars : [
		'tasks'
	],
	#category : #MyTask
}

{ #category : #'as yet unclassified' }
MTHome class >> createDemoTasks [
self current
writeHomeTask: ((MTTask  title: 'title' text:
'text.' category:
'P1') visible: true);
writeHomeTask: ((MTTask title: 'title2' text:
'text2'
category: 'p2') visible: true)
]

{ #category : #accessing }
MTHome class >> current [
^ self selectAll
ifNotEmpty: [ :x | x anyOne ]
ifEmpty: [ self new save ]
]

{ #category : #'class initialization' }
MTHome class >> initialize [
self reset
]

{ #category : #initialization }
MTHome class >> initializeVoyageOnMemoryDB [
VOMemoryRepository new enableSingleton
]

{ #category : #initialization }
MTHome class >> reset [
self initializeVoyageOnMemoryDB
]

{ #category : #'as yet unclassified' }
MTHome class >> sVoyageRoot [
"Indicates that instances of this class are top level documents
in noSQL databases"
^ true
]

{ #category : #'as yet unclassified' }
MTHome >> AllVisibleHomeTasks [
^ tasks select: [ :p | p isVisible ]
]

{ #category : #'as yet unclassified' }
MTHome >> allHomeTasks [
	^ tasks
]

{ #category : #'as yet unclassified' }
MTHome >> allTasksFromCategory: aCategory [
^ tasks select: [ :p | p category = aCategory ]
]

{ #category : #initialization }
MTHome >> initialize [
super initialize.
tasks := OrderedCollection new
]

{ #category : #removing }
MTHome >> removeAllTasks [
tasks := OrderedCollection new.
self save.
]

{ #category : #accessing }
MTHome >> size [
^ tasks size
]

{ #category : #writing }
MTHome >> writeHomeTask: aTask [
	"Add the blog post to the list of posts."
	tasks add: aTask
]

{ #category : #writing }
MTHome >> writeTask: aTask [
"Write the blog post in database"
self allHomeTasks add: aTask.
self save
]
