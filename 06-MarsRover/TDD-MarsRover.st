!classDefinition: #Tests category: 'TDD-MarsRover'!
TestCase subclass: #Tests
	instanceVariableNames: 'puntoCardinalNorte puntoCardinalSur puntoCardinalEste puntoCardinalOeste cadenaDeComandosHaciaAdelante cadenaDeComandosHaciaAtras posicioInicial'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Tests methodsFor: 'inicializadorDeMovimientosMarsRover' stamp: 'MMeichtri 11/3/2022 09:16:11'!
iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalErroneo

	^ MovimientoDeMarsRover initializeWith: posicion andWithCardinalPoint: puntoCardinalErroneo 
		! !


!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:14:59'!
test01ElMovimientoDeMarsRoverSeInicializaConUnPuntoCardinalInvalidoYSeLanzaUnaExcepcion

	 | posicionInicial puntoCardinalErroneo |
	
	posicionInicial := (1/2@1/2).
	puntoCardinalErroneo := 'P'.
	
	self should:
		[ self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalErroneo ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: MovimientoDeMarsRover errorPuntoCardinalInvalido].
		! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:15:45'!
test02SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlNorte

	 | posicionInicial posicionDestino movimientoDeMarsRover |
	
	posicionInicial := (1@1).
	posicionDestino := (5@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicionInicial haciaElPuntoCardinal: puntoCardinalNorte.
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .
	
	self assert: (movimientoDeMarsRover estaEnLaPosicion: posicionDestino)		! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:16:03'!
test03SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAdelanteEnDireccionAlSur

	| movimientoDeMarsRover posicion |
	
	posicion := (5@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur .
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .
	
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:16:17'!
test04SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlNorte

	| movimientoDeMarsRover posicion  |
	
	posicion := (3@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalNorte .
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .

	
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (-1@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:16:34'!
test05SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverEnDireccionAlNorte

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalNorte .
	
	movimientoDeMarsRover movimiento: 'frfrf'.

	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:33:55'!
test06SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlEste

	| movimientoDeMarsRover posicion  |
	
	posicion := (2@5).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalEste.
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .

	self assert: (movimientoDeMarsRover estaEnLaPosicion: (2@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:00'!
test07SeRecibeUnaCadenaDeComandosParaMoverseEnDireccionAlOesteYMarsRoverSeMueveHaciaAdelante

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@5).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAdelante .

	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:08'!
test08SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlOeste

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras .

	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@5)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:13'!
test09ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElNorteYCambiaDeDireccionHaciaElOeste

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalNorte .
	
	movimientoDeMarsRover movimiento: 'ffl'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionOeste.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (3@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:19'!
test10ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElEsteYCambiaDeDireccionHaciaElNorte

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalEste .
	
	movimientoDeMarsRover movimiento: 'ffflf'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionNorte.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (2@4)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:24'!
test11ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElSurYCambiaDeDireccionHaciaElEste

	| movimientoDeMarsRover posicion  |
	
	posicion := (4@2).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur .
	
	movimientoDeMarsRover movimiento: 'fl'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionEste.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (3@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:28'!
test12ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElOesteYCambiaDeDireccionHaciaElNorte

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: 'br'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionNorte.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:34'!
test13MarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteYFinalmenteHaciaElEste

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: 'brr'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionEste.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:39'!
test14ElMovimientoDeMarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteLuegoHaciaElEsteYFinalmenteHaciaElSur

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: 'brrr'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionSur.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:45'!
test15ElMovimientoDeMarsRoversSeMueveInicialmenteHaciaElOesteLuegoHaciaElNorteLuegoHaciaElEsteLuegoHaciaElSurYFinalmenteHaciaElOeste

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal:puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: 'brrrr'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionOeste.
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:51'!
test16SeRecibeUnaCadenaDeComandosYSeRealizaElMovimientoDeMarsRoverHaciaAtrasEnDireccionAlSur

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur .
	
	movimientoDeMarsRover movimiento: cadenaDeComandosHaciaAtras.
	

	self assert: (movimientoDeMarsRover estaEnLaPosicion: (5@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:34:57'!
test17ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElNorteYCambiaDeDireccionHaciaElEste

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalNorte .
	
	movimientoDeMarsRover movimiento: 'ffr'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionEste .
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (3@1)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:35:02'!
test18ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElEsteYCambiaDeDireccionHaciaElSur

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalEste .
	
	movimientoDeMarsRover movimiento: 'fffrf'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionSur .
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (0@4)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:35:07'!
test19ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElSurYCambiaDeDireccionHaciaElOeste

	| movimientoDeMarsRover posicion  |
	
	posicion := (4@2).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalSur .
	
	movimientoDeMarsRover movimiento: 'fr'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionOeste .
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (3@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:35:12'!
test20ElMovimientoDeMarsRoversSeMueveApuntandoHaciaElOesteYCambiaDeDireccionHaciaElSur

	| movimientoDeMarsRover posicion  |
	
	posicion := (1@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalOeste .
	
	movimientoDeMarsRover movimiento: 'bl'.
	
	self assert: movimientoDeMarsRover estaEnLaDireccionSur .
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@2)).! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:35:16'!
test21SeRecibeUnaCadenaDeComandosDondeUnoEsErroneoYSeLanzaUnaExcepcion

	| movimientoDeMarsRover posicion cadena |
	
	posicion := (2@1).
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: posicion haciaElPuntoCardinal: puntoCardinalNorte.
	
	cadena := 'ffbxf'.
	
	self 
	should: [movimientoDeMarsRover movimiento: cadena]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorComandoInvalido ].
	
! !

!Tests methodsFor: 'tests' stamp: 'MMeichtri 11/4/2022 11:35:20'!
test22SeRecibeUnaCadenaDeComandosVaciaYSeLanzaUnaExcepcion

	| movimientoDeMarsRover  cadena |
	
	movimientoDeMarsRover := self iniciarMovimientoDeMarsRoverEnLaPosicion: (1@1) haciaElPuntoCardinal: puntoCardinalNorte .
	
	cadena := ''.
	
	self 
	should: [movimientoDeMarsRover movimiento: cadena]
	raise: Error
	withExceptionDo: [ :anError | self assert: anError messageText equals:MovimientoDeMarsRover errorCadenaDeComandosVacia ].
	
	self assert: (movimientoDeMarsRover estaEnLaPosicion: (1@1)).
! !


!Tests methodsFor: 'setUp' stamp: 'MMeichtri 11/3/2022 23:56:40'!
setUp

	puntoCardinalNorte _ 'N'.
	puntoCardinalSur _ 'S'.
	puntoCardinalEste _ 'E'.
	puntoCardinalOeste _ 'O'.
	
	cadenaDeComandosHaciaAdelante _ 'ffff'.
	cadenaDeComandosHaciaAtras _ 'bbbb'.
	
	posicioInicial _ (1@1)! !


!classDefinition: #DireccionesDeMovimientoDeMarsRover category: 'TDD-MarsRover'!
Object subclass: #DireccionesDeMovimientoDeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 09:46:08'!
moverseHaciaAdelante: marsRover

	self subclassResponsibility ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 19:38:34'!
moverseHaciaAtras: marsRover

	self subclassResponsibility ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:26:57'!
rotarHaciaLaDerecha: marsRover

	self subclassResponsibility ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:27:09'!
rotarHaciaLaIzquierda: marsRover

	self subclassResponsibility ! !


!DireccionesDeMovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:18'!
esDireccionEste

	self subclassResponsibility ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:12'!
esDireccionNorte

	self subclassResponsibility ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:16'!
esDireccionOeste

	self subclassResponsibility ! !

!DireccionesDeMovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:07'!
esDireccionSur

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionesDeMovimientoDeMarsRover class' category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover class
	instanceVariableNames: ''!

!DireccionesDeMovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:22:41'!
crearDireccionDeMovimientoAdecuadaParaMarsRover: unCaracter

	| direccionActual |
	
	direccionActual := DireccionesDeMovimientoDeMarsRover subclasses detect: [ : subclass | subclass with: unCaracter ].
	
	^ direccionActual new.! !

!DireccionesDeMovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:23:01'!
with: unCaracter

	self subclassResponsibility ! !


!classDefinition: #DireccionDeMovimientoHaciaElEste category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:13:51'!
moverseHaciaAdelante: marsRover


	marsRover moverseAAdelanteHaciaElEste! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:14:04'!
moverseHaciaAtras: marsRover

	marsRover moverseAAtrasHaciaElEste! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:26:32'!
rotarHaciaLaDerecha: marsRover

	marsRover rotarHaciaLaDerechaDesdeElEste! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:27:09'!
rotarHaciaLaIzquierda: marsRover

	marsRover  rotarHaciaLaIzquierdaDesdeElEste ! !


!DireccionDeMovimientoHaciaElEste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:40'!
esDireccionEste

	^ true! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:32'!
esDireccionNorte

	^ false! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:50'!
esDireccionOeste
	^ false! !

!DireccionDeMovimientoHaciaElEste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:36'!
esDireccionSur

	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElEste class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElEste class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElEste class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 23:31:43'!
with: unCaracter

	^ unCaracter = 'E'! !


!classDefinition: #DireccionDeMovimientoHaciaElNorte category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElNorte methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:16'!
esDireccionEste

	^false! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:05'!
esDireccionNorte

	^true! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:10'!
esDireccionOeste

	^false! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:39:59'!
esDireccionSur

	^false! !


!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:09:59'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElNorte! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:10:03'!
moverseHaciaAtras: marsRover

	marsRover moverseAAtrasHaciaElNorte! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'MMeichtri 11/4/2022 11:37:24'!
rotarHaciaLaDerecha: marsRover

	marsRover rotarHaciaLaDerechaDesdeElNorte! !

!DireccionDeMovimientoHaciaElNorte methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:43:43'!
rotarHaciaLaIzquierda: marsRover

	marsRover  rotarHaciaLaIzquierdaDesdeElNorte! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElNorte class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElNorte class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElNorte class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:24:00'!
with: unCaracter

	^ unCaracter = 'N'! !


!classDefinition: #DireccionDeMovimientoHaciaElOeste category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElOeste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:28'!
esDireccionEste

	^false! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:38'!
esDireccionNorte

	^false! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:24'!
esDireccionOeste

	^true! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:33'!
esDireccionSur

	^false! !


!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:10:11'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElOeste! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:35:36'!
moverseHaciaAtras: marsRover

	marsRover moverseAAtrasHaciaElOeste! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:44:01'!
rotarHaciaLaDerecha: marsRover

	marsRover rotarHaciaLaDerechaDesdeElOeste! !

!DireccionDeMovimientoHaciaElOeste methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:27:09'!
rotarHaciaLaIzquierda: marsRover

	marsRover  rotarHaciaLaIzquierdaDesdeElOeste! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElOeste class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElOeste class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElOeste class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:24:17'!
with: unCaracter

	^ unCaracter = 'O'! !


!classDefinition: #DireccionDeMovimientoHaciaElSur category: 'TDD-MarsRover'!
DireccionesDeMovimientoDeMarsRover subclass: #DireccionDeMovimientoHaciaElSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:10:21'!
moverseHaciaAdelante: marsRover

	marsRover moverseAAdelanteHaciaElSur! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:10:24'!
moverseHaciaAtras: marsRover

	marsRover moverseAAtrasHaciaElSur! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:44:20'!
rotarHaciaLaDerecha: marsRover

	marsRover rotarHaciaLaDerechaDesdeElSur! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:27:09'!
rotarHaciaLaIzquierda: marsRover

	marsRover  rotarHaciaLaIzquierdaDesdeElSur! !


!DireccionDeMovimientoHaciaElSur methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:41:07'!
esDireccionEste

	^false! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:41:00'!
esDireccionNorte

	^false! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:41:05'!
esDireccionOeste

	^false! !

!DireccionDeMovimientoHaciaElSur methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:40:49'!
esDireccionSur

	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionDeMovimientoHaciaElSur class' category: 'TDD-MarsRover'!
DireccionDeMovimientoHaciaElSur class
	instanceVariableNames: ''!

!DireccionDeMovimientoHaciaElSur class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:24:41'!
with: unCaracter

	^ unCaracter = 'S'! !


!classDefinition: #MovimientoDeMarsRover category: 'TDD-MarsRover'!
Object subclass: #MovimientoDeMarsRover
	instanceVariableNames: 'posicion direccionDelMovimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 09:49:05'!
moverseAAdelanteHaciaElEste

	posicion := posicion + (0@1)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 09:49:31'!
moverseAAdelanteHaciaElNorte

	posicion := posicion + (1@0)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 09:49:57'!
moverseAAdelanteHaciaElOeste

	posicion := posicion - (0@1)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 09:50:15'!
moverseAAdelanteHaciaElSur

	posicion := posicion - (1@0)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 19:40:53'!
moverseAAtrasHaciaElEste

	posicion := posicion - (0@1)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 19:41:20'!
moverseAAtrasHaciaElNorte

	posicion := posicion - (1@0)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 19:41:33'!
moverseAAtrasHaciaElOeste

	posicion := posicion + (0@1)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 19:41:45'!
moverseAAtrasHaciaElSur

	posicion := posicion + (1@0)! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:27:09'!
movimiento: cadena

	(self esUnaCadenaVacia: cadena) ifTrue: [ self error: MovimientoDeMarsRover errorCadenaDeComandosVacia].
	
	cadena do: [ : unComando | 
		
		(self elComandoEsValido: unComando) ifFalse: [ self error: MovimientoDeMarsRover errorComandoInvalido].
		
		(unComando = $f) ifTrue: [ direccionDelMovimiento moverseHaciaAdelante: self].
		
		(unComando = $b) ifTrue: [direccionDelMovimiento moverseHaciaAtras: self].
		
		(unComando = $l) ifTrue: [direccionDelMovimiento rotarHaciaLaIzquierda: self].
		
		(unComando = $r) ifTrue: [direccionDelMovimiento rotarHaciaLaDerecha: self].
		]! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:09:14'!
rotarHaciaLaDerecha: marsRover

	^ marsRover rotarHaciaLaDerechaDesdeElSur! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:23:20'!
rotarHaciaLaDerechaDesdeElEste

	direccionDelMovimiento := DireccionDeMovimientoHaciaElSur new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:23:34'!
rotarHaciaLaDerechaDesdeElNorte

	direccionDelMovimiento := DireccionDeMovimientoHaciaElEste new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:23:51'!
rotarHaciaLaDerechaDesdeElOeste

	direccionDelMovimiento := DireccionDeMovimientoHaciaElNorte new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:24:03'!
rotarHaciaLaDerechaDesdeElSur

	direccionDelMovimiento := DireccionDeMovimientoHaciaElOeste new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:24:18'!
rotarHaciaLaIzquierdaDesdeElEste

	direccionDelMovimiento := DireccionDeMovimientoHaciaElNorte new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:24:31'!
rotarHaciaLaIzquierdaDesdeElNorte

	direccionDelMovimiento := DireccionDeMovimientoHaciaElOeste new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:24:43'!
rotarHaciaLaIzquierdaDesdeElOeste

	direccionDelMovimiento := DireccionDeMovimientoHaciaElSur new.! !

!MovimientoDeMarsRover methodsFor: 'movimientos' stamp: 'MMeichtri 11/3/2022 23:24:57'!
rotarHaciaLaIzquierdaDesdeElSur

	direccionDelMovimiento := DireccionDeMovimientoHaciaElEste new.! !


!MovimientoDeMarsRover methodsFor: 'inicializacion' stamp: 'MMeichtri 11/3/2022 09:20:16'!
inicializarCon: unPuntoInicial yConPuntoCardinal: unPuntoCardinal

	posicion := unPuntoInicial .
	direccionDelMovimiento := DireccionesDeMovimientoDeMarsRover crearDireccionDeMovimientoAdecuadaParaMarsRover: unPuntoCardinal! !


!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 09:50:52'!
elComandoEsValido: unComando

	^ #($f, $b, $l, $r) includes: unComando! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 09:44:43'!
esUnaCadenaVacia: cadena

	^ cadena sameAs: ''! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:38:31'!
estaEnLaDireccionEste

	^ direccionDelMovimiento esDireccionEste! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:38:47'!
estaEnLaDireccionNorte

	^ direccionDelMovimiento esDireccionNorte! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:38:39'!
estaEnLaDireccionOeste

	^ direccionDelMovimiento esDireccionOeste! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 23:38:54'!
estaEnLaDireccionSur

	^ direccionDelMovimiento esDireccionSur! !

!MovimientoDeMarsRover methodsFor: 'testing' stamp: 'MMeichtri 11/3/2022 09:39:51'!
estaEnLaPosicion: unaPosicion

	^ posicion = unaPosicion ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MovimientoDeMarsRover class' category: 'TDD-MarsRover'!
MovimientoDeMarsRover class
	instanceVariableNames: ''!

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:44:16'!
errorCadenaDeComandosVacia

	^ 'Error cadena de comandos no puede ser vacia'! !

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:42:50'!
errorComandoInvalido

	^ 'Error comando invalido'! !

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:26:54'!
errorPuntoCardinalInvalido

	^ 'Error el punto cardinal ingresado no es valido'! !

!MovimientoDeMarsRover class methodsFor: 'as yet unclassified' stamp: 'MMeichtri 11/3/2022 09:26:59'!
initializeWith: anInitialPoint andWithCardinalPoint: aCardinalPoint

	(#('N', 'S', 'E', 'O') includes: aCardinalPoint ) ifFalse: [ self error: self errorPuntoCardinalInvalido ].
	
	^ self new inicializarCon: anInitialPoint yConPuntoCardinal: aCardinalPoint.! !
