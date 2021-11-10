class Planta{
	var property anoObtencion
	var property altura
	var horasDeSol = 0
	
	method setHorasDeSol(horas){
		horasDeSol = horas
	}
	method getHorasDeSol() = return horasDeSol
	
	method esFuerte() = return self.getHorasDeSol() > 10 
	
	method daSemillas() = self.esFuerte()
	
	method cuantoEspacioOcupa()
	
	method esParcelaIdeal(unaParcela)
	
	method sePuedeAsociarCon_(unaParcela) = return unaParcela.puedeAsociar(self)
}


class Menta inherits Planta{
	override method getHorasDeSol() = return 6
	
	override method daSemillas() = self.esFuerte() || altura > 0.4
	
	override method cuantoEspacioOcupa() = return altura*3
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.superficie() > 6
}

class Soja inherits Planta{
	override method getHorasDeSol(){
		return if ( altura < 0.5){ 6 } else if (altura.between(0.5,1)){ 7 } else if (altura > 1) { 9 }
	}
	
	override method daSemillas() = return self.esFuerte() ||   anoObtencion > 2007 && altura > 1
	
	override method cuantoEspacioOcupa() = return altura/2	
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.horasDeSolPorDia() === self.getHorasDeSol()
}


class Quinoa inherits Planta{
	
	override method cuantoEspacioOcupa() = return 0.5
	
	override method daSemillas() = return self.esFuerte() || anoObtencion < 2005
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.plantas().all( { e => e.altura() <= 1.5 })
}







//---------------------------------//
// 			VARIEDADES			   //
//---------------------------------//


class SojaTransgenica inherits Soja{
	override method daSemillas() = return false
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.cantMaxima() <= 1
}

class Hierbabuena inherits Menta{
	override method cuantoEspacioOcupa() = return altura * 6
	
	override method esParcelaIdeal(unaParcela) = return unaParcela.superficie() > 6
}




