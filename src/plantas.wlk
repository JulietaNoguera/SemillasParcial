
import parcelas.*

class Plantas{
	var property anioDeObtencion
	var property altura
	
	method horasDeSol()
	
	method esFuerte()= self.horasDeSol() >=10
	
	method daNuevasSemillas()= self.esFuerte()
	
	method espacio()
	

}

class Menta inherits Plantas{
	
	override method horasDeSol()= 6
	
	override method daNuevasSemillas()= super() and self.altura()>= 0.4
	
	override method espacio()= self.altura()*3
	
	method parcelaIdeal(parcela)= parcela.superficie() >= 6
	
	
}


class Soja inherits Plantas{
	
	override method horasDeSol(){
		var horas=0
		if(altura > 0 and altura < 0.5){
			horas= 6
		}
		else if( altura > 0.5 and altura < 1 ){
			horas =7
		}
		else {
			horas= 9
		}
		return horas
	}
	
	override method daNuevasSemillas()= super() and anioDeObtencion >= 2007
	
	override method espacio()= self.altura()
	
	method parcelaIdeal(parcela)= parcela.horasDeSolParcela() == self.horasDeSol()
}

class Quinoa inherits Plantas{
	var property hrsSol
	
	override method  horasDeSol()= hrsSol
	override method daNuevasSemillas()= super() and 2005 <= anioDeObtencion 
	
	override method espacio()= 0.5
	
	method parcelaIdeal(parcela)= parcela.alturaDePlantaMasGrande() <= 1.5
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas()= false
	
	method parcelaIdeal(parcela)= parcela.cantidadMaXima() ==1
}

class Hierbabuena inherits Menta{
	override method espacio()= super() * 2 
}
