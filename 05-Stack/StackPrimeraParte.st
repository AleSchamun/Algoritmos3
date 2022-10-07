!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'tests' stamp: 'MMeichtri 10/6/2022 21:30:04'!
test01StackShouldBeEmptyWhenCreated
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'MMeichtri 10/6/2022 21:36:48'!
test02SeAgregaUnElementoAlStack
	
	self deny: (stack push: 1) isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'MMeichtri 10/6/2022 21:36:39'!
test03SeEliminaUnElementoDelStack

	stack push: 1.
	stack pop.
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'MMeichtri 10/6/2022 21:36:20'!
test04SeSacaUnElementoDelStackYSeObtieneElUltimo

	stack push: 1.
	stack push: 2.
	stack pop.
	
	self assert: stack pop = 1.! !

!StackTest methodsFor: 'tests' stamp: 'MMeichtri 10/6/2022 21:36:02'!
test05SeEliminaElUltimoElementoAgregado

	stack push: 1.
	stack push: 2.
	stack pop.

	self assert: stack pop = 1
! !

!StackTest methodsFor: 'tests' stamp: 'MMeichtri 10/6/2022 21:35:36'!
test06SeObtieneElUltimoElementoDelStackSinBorrarlo

	stack push: 1.
	stack push: 2.

	self assert: stack obtenerUltimoElemento equals: 2
! !


!StackTest methodsFor: 'setUp' stamp: 'MMeichtri 10/6/2022 21:29:49'!
setUp

	stack := Stack new.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'accessing' stamp: 'MMeichtri 10/6/2022 20:28:12'!
isEmpty
	
	^ stack isEmpty! !

!Stack methodsFor: 'accessing' stamp: 'MMeichtri 10/6/2022 21:28:19'!
obtenerUltimoElemento
	
	^ stack at: (self size)! !

!Stack methodsFor: 'accessing' stamp: 'MMeichtri 10/6/2022 21:18:05'!
pop

 	^ stack removeLast! !

!Stack methodsFor: 'accessing' stamp: 'MMeichtri 10/6/2022 21:06:10'!
push: unElemento

	stack addLast: unElemento ! !

!Stack methodsFor: 'accessing' stamp: 'MMeichtri 10/6/2022 21:13:30'!
size

	^ stack size! !


!Stack methodsFor: 'instanceCreation' stamp: 'MMeichtri 10/6/2022 20:28:44'!
initialize
	
	stack := OrderedCollection new.! !
