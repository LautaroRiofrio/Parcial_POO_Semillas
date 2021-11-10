
import plantas.*
import parcelas.*

object inta {
	const parcelas = []
	
	method agregarParcela(unaParcela){
		parcelas.add(unaParcela)
	}
	
	method promedioPlantasXParcela() = return parcelas.sum( { e => e.plantas().size() } ) / parcelas.size()
	
	
	method parcelaMasAutosustentable(){
		// primero un filter para conseguir las parcelas que tienen +4 plantas
		
		// segundo un max para conseguir la parcela con el mayor percentaje de plantas bien asociadas
		
		// tercero un sum para conseguir la cantidad de plantas bien asociadas en cada parcela
		
		// el sum se lo divide entre la cantidad de plantas totales de la parcela y se lo multiplica x 100 
		// para conseguir el porcentaje de plantas bien asociadas
		
		
		return  parcelas.filter( { e => e.plantas().size() > 4 } ).max( { 
			parcela => (
				parcela.plantas().sum( {
				planta => if(planta.sePuedeAsociarCon_(parcela) ){1} else {0}
			} ) / parcela.plantas().size()
			) * 100
		} )
	} 
}
