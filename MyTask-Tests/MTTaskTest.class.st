Class {
	#name : #MTTaskTest,
	#superclass : #TestCase,
	#category : #'MyTask-Tests'
}

{ #category : #tests }
MTTaskTest >> testTaskIsCreatedCorrectly [
| task|
task := MTTask 
title: 'Welcome to MyTask'
text: 'MyTask is made with Pharo.'
category: 'MyTask'.
self assert: task title equals: 'Welcome to MyTask' .
self assert: task text equals: 'MyTask is made with Pharo.' .
]

{ #category : #tests }
MTTaskTest >> testWithoutCategoryIsUnclassified [
| task |
task := MTTask 
title: 'Welcome to MyTask'
text: 'MyTask is a small task engine made with Pharo.'.
self assert: task title equals: 'Welcome to MyTask' .
self assert: task isUnclassified.
self deny: task isVisible
]
