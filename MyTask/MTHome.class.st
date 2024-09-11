Class {
	#name : #MTHome,
	#superclass : #Object,
	#instVars : [
		'tasks'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #MyTask
}

{ #category : #accessing }
MTHome class >> current [
"answer the instance of the TBRepository"
^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #comparing }
MTHome class >> initialize [
self reset
]

{ #category : #initialization }
MTHome class >> reset [
uniqueInstance := nil
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
tasks := OrderedCollection new
]

{ #category : #accessing }
MTHome >> size [
^ tasks size
]

{ #category : #writing }
MTHome >> writeBlogPost: aPost [
	"Add the blog post to the list of posts."
	tasks add: aPost
]

{ #category : #writing }
MTHome >> writeHomeTask: aTask [
	"Add the blog post to the list of posts."
	tasks add: aTask
]
