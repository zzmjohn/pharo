"
I model temp variables. With Closures, there are two kinds: Copying and those that are stored in a so called temp vector, a heap allocated array that itself is stored in a copying temp variable.
"
Class {
	#name : #TemporaryVariable,
	#superclass : #LocalVariable,
	#category : #'OpalCompiler-Core-Semantics'
}

{ #category : #visiting }
TemporaryVariable >> acceptVisitor: aProgramNodeVisitor node: aNode [
	^ aProgramNodeVisitor visitTemporaryNode: aNode
]

{ #category : #queries }
TemporaryVariable >> definingNode [
	^ scope node temporaries 
		detect: [ :each | each name = name ]
		ifNone: [ 
			" ugly workaround to support temps defined by primitives"
			| pragma |
			pragma := scope node methodNode pragmas detect: [ :each | each isPrimitiveError ].
			pragma ifNil: [ ^nil ].
			^ RBVariableNode named: (pragma argumentAt: #error:) value asString
			]
]

{ #category : #testing }
TemporaryVariable >> isTempVariable [

	^ true
]
