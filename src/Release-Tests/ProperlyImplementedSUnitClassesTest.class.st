"
This class checks if test classes have been properly implemented
"
Class {
	#name : #ProperlyImplementedSUnitClassesTest,
	#superclass : #TestCase,
	#category : #'Release-Tests-Tests'
}

{ #category : #tests }
ProperlyImplementedSUnitClassesTest >> testAndMakeSureSuperSetupIsCalledAsFirstMessageInSetupMethodsOfTestCases [
	"Verify that each setUp method in a unit test starts with a call to super setUp as first message sent"

	|violating|	
	violating := OrderedCollection new.
	TestCase allSubclassesDo: [:each |	
 		each compiledMethodAt: #setUp ifPresent: [:method |
				(ShouldSendSuperSetUpAsFirstMessage superSetUpNotCalledFirstIn: method) 
					ifTrue: [ violating add: method ]
			] ifAbsent: nil ].
	
	self assert: violating isEmpty	
]

{ #category : #tests }
ProperlyImplementedSUnitClassesTest >> testAndMakeSureSuperTearDownIsCalledAsLastMessageInTearDownMethodsOfTestCases [
	"Verify that each tearDown method in a unit test ends with a call to super tearDown as last message sent"
	
	|violating|	
	violating := OrderedCollection new.
	TestCase allSubclassesDo: [:each |	
 		each compiledMethodAt: #tearDown ifPresent: [:method |
				(ShouldSendSuperTearDownAsLastMessage superTearDownNotCalledLastIn: method) 
					ifTrue: [ violating add: method ]
			] ifAbsent: nil ].
	self assert: violating isEmpty 
]
