
import plantas.*

class Parcelas{
	
	var property ancho
	var property largo
	const plantasDeParcela=#{}
	var property horasDeSolParcela
	
	
	method superficie()= ancho * largo
	
	method cantidadMaXima()= if(ancho > largo ){self.superficie() / 5} else{ (self.superficie() / 3) + largo }

	method tieneComplicaciones()= plantasDeParcela.any{ p=> p.horasDeSol() <= self.horasDeSolParcela()}
	
	method agregarPlanta(planta){ plantasDeParcela.add(planta)}
	
	method totalPlantasPlantadas()= plantasDeParcela.size()
	
	method plantarUnaPlanta(planta){
		if (self.totalPlantasPlantadas() < self.cantidadMaXima() and planta.horasDeSol() < (self.horasDeSolParcela() + 2)){
			self.error("No se le permite plantar mas plantas")
		}
			
		else{
			self.agregarPlanta(planta)
		}
	}
	
	method alturasPlantas()= plantasDeParcela.map({ p=> p.altura()})
	method alturaDePlantaMasGrande()= self.alturasPlantas().max()
	
	method bienAsociada()= plantasDeParcela.forEach{ p=> p.seAsocianBien(p) }
	
	method cantBienAsociadas()=plantasDeParcela.count(self.bienAsociada())
	
	method porcentajeBienAsociadas()= self.cantBienAsociadas() / self.totalPlantasPlantadas()
}

class Ecologicas inherits Parcelas{
	
	method seAsocianBien(planta)= not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	
}



class Industriales inherits Parcelas{
	method seAsocianBien(planta) = self.cantidadMaXima() == 2 and planta.esFuerte()
}