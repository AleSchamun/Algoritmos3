!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 15:59:56'!
generate: typeOfError in: blockOfMethod andResponseWith: blockCode

	[ blockOfMethod value.
		
	self fail ]
		on: typeOfError 
		do: blockCode ! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test01StackShouldBeEmptyWhenCreated
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test02PushAddElementsToTheStack
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:11:32'!
test03PopRemovesElementsFromTheStack
	
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test04PopReturnsLastPushedObject

	| pushedObject |
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:11:40'!
test05StackBehavesLIFO

	|  firstPushedObject secondPushedObject |
	
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test06TopReturnsLastPushedObject

	|  pushedObject |

	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test07TopDoesNotRemoveObjectFromStack

	|  pushedObject |
	

	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	self generate: Error - MessageNotUnderstood  in: [	stack pop] andResponseWith: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ].

		
! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	stack push: 'something'.
	stack pop.
	
	self generate: Error - MessageNotUnderstood  in: [stack pop] andResponseWith: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ].

! !

!OOStackTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:07:48'!
test10CanNotTopWhenThereAreNoObjectsInTheStack
	
	self generate: Error - MessageNotUnderstood  in: [stack pop] andResponseWith: [  :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText].

	
		
! !


!OOStackTest methodsFor: 'setUp' stamp: 'MMeichtri 10/14/2022 16:07:48'!
setUp

	stack := OOStack new.! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'finder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:16:09'!
generate: typeOfError in: blockOfMethod andResponseWith: blockCode

	[ blockOfMethod value.
		
	self fail ]
		on: typeOfError 
		do: blockCode ! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:18:13'!
test01AddSentencesToTheStackAndTheStackGrowsInSize

	finder addSentence: 'Winter'.
	finder addSentence: 'is'.
	finder addSentence: 'comming'.
	
	self assert: (finder sizeOfStackOfSentences) equals: 3! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:15:26'!
test02AllTheSentencesAddedToTheStackHaveTheSamePrefixAndFindReturnSameNumberOfSentences

	|  sentencesWithPrefix |
	
	finder  addSentence: 'hola como estas'.
	finder addSentence: 'hola todo bien'.
	finder addSentence: 'hola'.
	finder addSentence: 'hola'.
	
	sentencesWithPrefix := finder find: 'hol'.

	self assert: (finder sizeOfStackOfSentencesWithPrefix: sentencesWithPrefix) equals: 4.
	self assert: (finder find: 'hol') equals: (OrderedCollection with: 'hola' with: 'hola' with: 'hola todo bien' with: 'hola como estas').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:15:26'!
test03PrefixIsCaseSensitiveAndFindDoesNotReturnSentences

	|  sentencesWithPrefix |

	finder addSentence: 'hola'.
	finder addSentence: 'hoL andas'.
	finder addSentence: 'adios hola'.
	
	sentencesWithPrefix := finder find: 'Hol'.

	self assert: (finder sizeOfStackOfSentencesWithPrefix: sentencesWithPrefix) equals: 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:15:26'!
test04AfterFindOperationStackKeepsSameOrder

	finder  addSentence: '01'.
	finder addSentence: '02'.
	finder addSentence: '03'.

	finder find: '02'.
	finder find: '01'.
	finder find: '03'.
	

	self assert: (finder topOfStackSentences) equals: '03'
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:15:26'!
test05FindJustReturnsTheSentencesThatMatchedWithThePrefix

	finder  addSentence: 'winter is comming'.
	finder addSentence: 'winter is everything'.
	finder addSentence: 'the wind of Winter'.
	finder addSentence: 'Winter is here'.
	

	self assert: (finder find: 'Wint') equals: (OrderedCollection with: 'Winter is here').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:15:26'!
test06FindDoesNotAcumulateSentencesJustReturnsTheSentecesThatMatchedWithTheCurrentlyFindOperation
	
	finder  addSentence: 'hola'.
	finder addSentence: 'como andas'.
	finder addSentence: 'adios'.
	finder addSentence: 'ho'.
	
	finder find: 'ad'.
	finder find: 'com'.

	self assert: (finder find: 'ho') equals: (OrderedCollection with: 'ho' with: 'hola').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:15:26'!
test07FindCanReturnDuplicateSentences

	finder  addSentence: 'Winter is here'.
	finder addSentence: 'Winter is comming'.
	finder addSentence: 'winning is all'.
	finder addSentence: 'Winter is here'.
	finder addSentence: 'win'.


	self assert: (finder find: 'Wint') equals: (OrderedCollection with: 'Winter is here' with: 'Winter is comming' with: 'Winter is here').
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:17:19'!
test08CanNotFindWhenPrefixIsEmpty
	
	self generate: Error - MessageNotUnderstood  in: [finder prefixIsValid: ''.] andResponseWith: [ : anError | 
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription  ].

	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MMeichtri 10/14/2022 16:17:59'!
test09CanNotFindWhenPrefixContainsWhiteSpace
	
	self generate: Error - MessageNotUnderstood  in: [finder prefixIsValid: 'winter is comming  '.] andResponseWith: [ : anError | 
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptySpaceErrorDescription  ].

	! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'MMeichtri 10/14/2022 16:15:26'!
setUp

	finder := SentenceFinderByPrefix new.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackStorage'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'size' stamp: 'MMeichtri 10/14/2022 16:36:31'!
size
	
	^ stackStorage size! !


!OOStack methodsFor: 'accessing' stamp: 'MMeichtri 10/14/2022 16:36:31'!
top

	^ self stateOfStack topOf: stackStorage.
! !


!OOStack methodsFor: 'initialization' stamp: 'MMeichtri 10/14/2022 16:36:31'!
initialize

	stackStorage := OrderedCollection new.

! !


!OOStack methodsFor: 'testing' stamp: 'MMeichtri 10/14/2022 16:36:31'!
isEmpty
	
	^ stackStorage isEmpty
	! !

!OOStack methodsFor: 'testing' stamp: 'MMeichtri 10/14/2022 16:36:31'!
stateOfStack
	
	| stateStack |
	stateStack := StateOfOOStack subclasses detect: [ : anState | anState canInstantiateWith: stackStorage ].
	
	^ stateStack  new! !


!OOStack methodsFor: 'operations' stamp: 'MMeichtri 10/14/2022 16:36:31'!
pop
	
	^ self stateOfStack popFrom: stackStorage
! !

!OOStack methodsFor: 'operations' stamp: 'MMeichtri 10/14/2022 16:36:31'!
push: unElemento
	
	stackStorage addLast: unElemento .
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


!SentenceFinderByPrefix methodsFor: 'size' stamp: 'MMeichtri 10/13/2022 22:56:06'!
sizeOfStackOfSentences

	^ stackOfSentences size! !

!SentenceFinderByPrefix methodsFor: 'size' stamp: 'MMeichtri 10/13/2022 23:08:56'!
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

!StateOfOOStack methodsFor: 'operations' stamp: 'MMeichtri 10/14/2022 16:55:34'!
popFrom: aStackStorage

	self subclassResponsibility ! !


!StateOfOOStack methodsFor: 'accessing' stamp: 'MMeichtri 10/14/2022 16:49:50'!
topOf: aStackStorage
	
	self subclassResponsibility ! !


!classDefinition: #OOStackEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackEmpty methodsFor: 'operations' stamp: 'MMeichtri 10/14/2022 16:55:45'!
popFrom: aStackStorage

	^ self error: OOStack stackEmptyErrorDescription! !


!OOStackEmpty methodsFor: 'accessing' stamp: 'MMeichtri 10/14/2022 16:55:50'!
topOf: aStackStorage

	^ self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackEmpty class' category: 'Stack-Exercise'!
OOStackEmpty class
	instanceVariableNames: ''!

!OOStackEmpty class methodsFor: 'instanceCreation' stamp: 'MMeichtri 10/14/2022 16:47:59'!
canInstantiateWith: stackStorage

	^ stackStorage isEmpty! !


!classDefinition: #OOStackNotEmpty category: 'Stack-Exercise'!
StateOfOOStack subclass: #OOStackNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotEmpty methodsFor: 'operations' stamp: 'MMeichtri 10/14/2022 16:55:57'!
popFrom: aStackStorage

	^ aStackStorage removeLast ! !


!OOStackNotEmpty methodsFor: 'accessing' stamp: 'MMeichtri 10/14/2022 16:56:03'!
topOf: aStackStorage

	^ aStackStorage at: (aStackStorage size)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotEmpty class' category: 'Stack-Exercise'!
OOStackNotEmpty class
	instanceVariableNames: ''!

!OOStackNotEmpty class methodsFor: 'instanceCreation' stamp: 'MMeichtri 10/14/2022 16:48:04'!
canInstantiateWith: stackStorage

	^ stackStorage isEmpty not! !
