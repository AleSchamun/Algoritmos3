!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/8/2022 23:20:42'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/8/2022 23:09:25'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/13/2022 22:56:41'!
test01AddSentencesToTheStackAndTheStackGrowsInSize

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	finder addSentence: 'Winter'.
	finder addSentence: 'is'.
	finder addSentence: 'comming'.
	
	self assert: (finder sizeOfStackOfSentences) equals: 3! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/13/2022 23:13:21'!
test02AllTheSentencesAddedToTheStackHaveTheSamePrefixAndFindReturnSameNumberOfSentences

	| finder sentencesWithPrefix |
	
	finder := SentenceFinderByPrefix new.
	
	finder  addSentence: 'hola como estas'.
	finder addSentence: 'hola todo bien'.
	finder addSentence: 'hola'.
	finder addSentence: 'hola'.
	
	sentencesWithPrefix := finder find: 'hol'.

	self assert: (finder sizeOfStackOfSentencesWithPrefix: sentencesWithPrefix) equals: 4.
	self assert: (finder find: 'hol') equals: (OrderedCollection with: 'hola' with: 'hola' with: 'hola todo bien' with: 'hola como estas').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/13/2022 23:14:50'!
test03PrefixIsCaseSensitiveAndFindDoesNotReturnSentences

	| finder sentencesWithPrefix |
	
	finder := SentenceFinderByPrefix new.
	
	finder  addSentence: 'hola'.
	finder addSentence: 'hoL andas'.
	finder addSentence: 'adios hola'.
	
	sentencesWithPrefix := finder find: 'Hol'.

	self assert: (finder sizeOfStackOfSentencesWithPrefix: sentencesWithPrefix) equals: 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/13/2022 23:18:16'!
test04AfterFindOperationStackKeepsSameOrder

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	finder  addSentence: '01'.
	finder addSentence: '02'.
	finder addSentence: '03'.

	finder find: '02'.
	finder find: '01'.
	finder find: '03'.
	

	self assert: (finder topOfStackSentences) equals: '03'
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/13/2022 23:18:47'!
test05FindJustReturnsTheSentencesThatMatchedWithThePrefix

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	finder  addSentence: 'winter is comming'.
	finder addSentence: 'winter is everything'.
	finder addSentence: 'the wind of Winter'.
	finder addSentence: 'Winter is here'.
	

	self assert: (finder find: 'Wint') equals: (OrderedCollection with: 'Winter is here').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/13/2022 23:22:30'!
test06FindDoesNotAcumulateSentencesJustReturnsTheSentecesThatMatchedWithTheCurrentlyFindOperation

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	finder  addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	finder addSentence: 'ho'.
	
	finder find: 'ad'.
	finder find: 'com'.

	self assert: (finder find: 'ho') equals: (OrderedCollection with: 'ho' with: 'hola').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 11:27:30'!
test07FindCanReturnDuplicateSentences

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	finder  addSentence: 'Winter is here'.
	finder addSentence: 'Winter is comming'.
	finder addSentence: 'winning is all'.
	finder addSentence: 'Winter is here'.
	finder addSentence: 'win'.


	self assert: (finder find: 'Wint') equals: (OrderedCollection with: 'Winter is here' with: 'Winter is comming' with: 'Winter is here').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 11:26:58'!
test08CanNotFindWhenPrefixIsEmpty

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	self
	 	should: [ finder prefixIsValid: ''.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ : anError | 
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 11:27:04'!
test09CanNotFindWhenPrefixContainsWhiteSpace

	| finder |
	
	finder := SentenceFinderByPrefix new.
	
	self
	 	should: [ finder prefixIsValid: 'winter is comming  '.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ : anError | 
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptySpaceErrorDescription ]
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'MMeichtri 10/11/2022 19:52:00'!
size
	
	^ stack size! !

!OOStack methodsFor: 'accessing' stamp: 'MMeichtri 10/12/2022 17:40:40'!
top

	^ self stateOfStack topOf: stack.
! !


!OOStack methodsFor: 'initialization' stamp: 'MMeichtri 10/11/2022 14:03:59'!
initialize

	stack := OrderedCollection new.

! !


!OOStack methodsFor: 'testing' stamp: 'MMeichtri 10/11/2022 14:41:19'!
isEmpty
	
	^ stack isEmpty
	! !

!OOStack methodsFor: 'testing' stamp: 'MMeichtri 10/12/2022 17:45:23'!
stateOfStack
	
	| estadoDelStack |
	estadoDelStack := StateOfOOStack subclasses detect: [ : state | state canInstantiateWith: stack ].
	
	^ estadoDelStack  new! !


!OOStack methodsFor: 'operations' stamp: 'MMeichtri 10/12/2022 17:40:40'!
pop
	
	^ self stateOfStack popFrom: stack
! !

!OOStack methodsFor: 'operations' stamp: 'MMeichtri 10/12/2022 17:40:56'!
push: unElemento
	
	stack addLast: unElemento .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackOfSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MMeichtri 10/13/2022 23:13:05'!
addSentence: aSentence

	stackOfSentences push: aSentence ! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MMeichtri 10/13/2022 23:05:20'!
find: aPrefix

	self prefixIsValid: aPrefix.
	^ self findSentencesWithSamePrefix: aPrefix ! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MMeichtri 10/13/2022 23:12:32'!
findSentencesWithSamePrefix: aPrefix

	| sentencesWithPrefix copyOfTheStackSentences |
	
	sentencesWithPrefix := OrderedCollection new.
	copyOfTheStackSentences := OrderedCollection new.
	
	1 to: (stackOfSentences size) do: [ : index | 
		(self sentenceHasSamePrefix: aPrefix) ifTrue: [ sentencesWithPrefix add: stackOfSentences top].
		copyOfTheStackSentences add: stackOfSentences pop.
		].
	
	self updateStackOfSentencesWith: copyOfTheStackSentences.
	^ sentencesWithPrefix ! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'MMeichtri 10/13/2022 23:04:30'!
updateStackOfSentencesWith: copyOfTheStackSentences

	| auxiliaryStack |
	
	auxiliaryStack := OOStack new.
	
	(1 to: copyOfTheStackSentences size) reverseDo: [ : index | auxiliaryStack push: (copyOfTheStackSentences at: index)].
	
	^ stackOfSentences := auxiliaryStack ! !


!SentenceFinderByPrefix methodsFor: 'intialization' stamp: 'MMeichtri 10/13/2022 23:12:19'!
initialize

	stackOfSentences := OOStack new.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'MMeichtri 10/13/2022 23:06:40'!
prefixIsValid: aPrefix.
	
	(aPrefix sameAs: '') ifTrue: [  ^ self error: SentenceFinderByPrefix prefixEmptyErrorDescription].
	(aPrefix withoutSeparators = aPrefix ) ifFalse: [^ self error: SentenceFinderByPrefix prefixEmptySpaceErrorDescription]! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'MMeichtri 10/13/2022 23:12:48'!
sentenceHasSamePrefix: aPrefix

	^ (aPrefix commonPrefixWith: stackOfSentences top) = aPrefix size! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'MMeichtri 10/13/2022 22:56:06'!
sizeOfStackOfSentences

	^ stackOfSentences size! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'MMeichtri 10/13/2022 23:08:56'!
sizeOfStackOfSentencesWithPrefix: sentencesWithPrefix

	^ sentencesWithPrefix size! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'MMeichtri 10/13/2022 23:18:35'!
topOfStackSentences

	^ stackOfSentences top! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 10/13/2022 23:07:07'!
prefixEmptyErrorDescription

	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 10/13/2022 23:07:25'!
prefixEmptySpaceErrorDescription

	^ 'Prefix can not include an empty space'! !


!classDefinition: #StateOfOOStack category: 'Stack-Exercise'!
Object subclass: #StateOfOOStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StateOfOOStack methodsFor: 'operations' stamp: 'MMeichtri 10/12/2022 17:51:24'!
popFrom: aStack

	self subclassResponsibility ! !


!StateOfOOStack methodsFor: 'accessing' stamp: 'MMeichtri 10/12/2022 17:51:12'!
topOf: aStack
	
	self subclassResponsibility ! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'operations' stamp: 'MMeichtri 10/12/2022 17:50:51'!
popFrom: aStack

	^ self error: OOStack stackEmptyErrorDescription! !


!OOStackEmpty methodsFor: 'accessing' stamp: 'MMeichtri 10/12/2022 17:50:57'!
topOf: aStack

	^ self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: 'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'instanceCreation' stamp: 'MMeichtri 10/12/2022 17:45:23'!
canInstantiateWith: stack

	^ stack isEmpty! !


!classDefinition: #OOStackNotEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'operations' stamp: 'MMeichtri 10/12/2022 17:50:44'!
popFrom: aStack

	^ aStack removeLast ! !


!OOStackNotEmpty methodsFor: 'accessing' stamp: 'MMeichtri 10/11/2022 19:32:45'!
topOf: unStack

	^ unStack at: (unStack size)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: 'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'instanceCreation' stamp: 'MMeichtri 10/12/2022 17:45:23'!
canInstantiateWith: stack

	^ stack isEmpty not! !
