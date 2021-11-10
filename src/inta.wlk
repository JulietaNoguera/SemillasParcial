
import parcelas.*

object inta {
	const parcelas=#{}
	
	method totalDeParcelas()= parcelas.size()
	
	method sumaDePlantas()= parcelas.sum{ p=> p.totalPlantasPlantadas()}
	
	method promedioPlantas()= self.sumaDePlantas() / self.totalDeParcelas()
	
	method parcelasConMasDe_Plantas()= parcelas.filter{ p => p.totalPlantasPlantadas() >= 4}
	
	method masAutosustentable()=  self.parcelasConMasDe_Plantas().max{p=> p.porcentajeBienAsociadas()}
}
