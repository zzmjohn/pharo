Extension { #name : #SpTablePresenter }

{ #category : #'*Spec2-Examples' }
SpTablePresenter class >> example [
	<sampleInstance>
	
	^ self new
		addColumn: (SpImageTableColumn title: 'Icon' evaluated: #systemIcon);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		items: Smalltalk allClasses;
		openWithSpec
]

{ #category : #'*Spec2-Examples' }
SpTablePresenter class >> exampleWithColumnHeaders [
	<sampleInstance>

	^ self new
		addColumn: (SpStringTableColumn title: 'Number' evaluated: #yourself);
		addColumn: (SpStringTableColumn title: 'Hex' evaluated: #hex);
		showColumnHeaders;
		items: (1 to: 10) asArray;
		openWithSpec
]

{ #category : #'*Spec2-Examples' }
SpTablePresenter class >> exampleWithCompositeColumn [
	
	^ self new
		showColumnHeaders;
		addColumn: (SpStringTableColumn title: 'Package' evaluated: [ :aClass | aClass package packageName ]);
		addColumn: (SpCompositeTableColumn new
			title: 'Class';
			addColumn: (SpImageTableColumn evaluated: #systemIcon) beNotExpandable;
			addColumn: (SpStringTableColumn evaluated: #name);
			yourself);
		items: Smalltalk allClasses;
		openWithSpec
]

{ #category : #'*Spec2-Examples' }
SpTablePresenter class >> exampleWithDecoratedString [
	
	^ self new
		addColumn: (SpImageTableColumn title: 'Icon' evaluated: [ :aClass | aClass systemIcon ]);
		addColumn: (SpStringTableColumn new 
			title: 'Name'; 
			evaluated: [ :aClass | aClass name ];
			displayColor: [ :aClass | 
				(aClass name endsWith: 'Test')
					ifTrue: [ Color green ]
					ifFalse: [ Smalltalk ui theme textColor ] ];
			displayItalic: [ :aClass | aClass name includesSubstring: 'abstract' caseSensitive: false ];
			displayBold: [ :aClass | aClass hasSubclasses ];
			displayUnderline: [ :aClass | aClass numberOfMethods > 10 ];
			yourself);
		items: Smalltalk allClasses;
		openWithSpec
]

{ #category : #'*Spec2-Examples' }
SpTablePresenter class >> exampleWithoutColumnHeaders [
	<sampleInstance>
	| example |
	example := self new.
	example
		addColumn: (SpStringTableColumn title: 'Number' evaluated: #yourself);
		addColumn: (SpStringTableColumn title: 'Hex' evaluated: #hex);
		items: (1 to: 10) asArray;
		hideColumnHeaders;
		openWithSpec.
	^ example
]
