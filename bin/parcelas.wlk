import plantas.*

class Parcela{
	var property ancho 
	var property largo 
	
	var property horasDeSolPorDia
	
	const plantas = []
	
	method plantas() = return plantas
	
	method superficie() = return ancho * largo
	
	method cantMaxima() = return if(ancho > largo){ self.superficie() / 5}else{ (self.superficie() / 3)+ largo }
	
	
	method tieneComplicaciones() = return plantas.any( { e => e.getHorasDeSol() < horasDeSolPorDia} )
	
	
	method plantar(unaPlanta){
		if ( plantas.size()+1  >  self.cantMaxima() || (unaPlanta.getHorasDeSol() - horasDeSolPorDia) == -2  ){
			self.error("No se puede plantar la planta")
		} else {
			plantas.add(unaPlanta)
		}
	}
	
	
}




// -------------------------- //
// 	  ASOCIACION DE PLANTAS   //
// -------------------------- //


class ParcelaEcologica inherits Parcela{
	method puedeAsociar(unaPlanta) = return not self.tieneComplicaciones() && unaPlanta.esParcelaIdeal(self)
}


class ParcelaIndustrial inherits Parcela{
	method puedeAsociar(unaPlanta) = return plantas.size()+1  <= 2 && unaPlanta.esFuerte()
}




