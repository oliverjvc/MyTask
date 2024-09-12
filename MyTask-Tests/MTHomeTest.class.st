Class {
	#name : #MTHomeTest,
	#superclass : #TestCase,
	#instVars : [
		'home',
		'task',
		'first',
		'previousRepository'
	],
	#category : #'MyTask-Tests'
}

{ #category : #running }
MTHomeTest >> setUp [
previousRepository := VORepository current.
VORepository setRepository: VOMemoryRepository new.
home := MTHome current.
first := MTTask title: 'A title' text: 'A text' category: 'First
Category'.
home writeHomeTask: first.
task := (MTTask title: 'Another title' text: 'Another text'
category: 'Second Category') beVisible
]

{ #category : #running }
MTHomeTest >> tearDown [
VORepository setRepository: previousRepository
]

{ #category : #tests }
MTHomeTest >> testAddHomeTask [
home writeHomeTask: task.
self assert: home size equals: 2
]

{ #category : #tests }
MTHomeTest >> testAllTasks [
home writeHomeTask: task.
self assert: home allHomeTasks size equals: 2
]

{ #category : #tests }
MTHomeTest >> testAllTasksFromCategory [
self assert: (home allTasksFromCategory: 'First Category')
size equals: 1
]

{ #category : #tests }
MTHomeTest >> testAllVisibleHomeTasks [
	home writeBlogPost: task.
	self assert: home AllVisibleHomeTasks size equals: 1s
]

{ #category : #tests }
MTHomeTest >> testRemoveAllHomeTasks [
task removeAllTasks.
self assert: home size equals: 0
]

{ #category : #tests }
MTHomeTest >> testSize [
	self assert: home size equals: 1
]
