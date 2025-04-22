object knightRider {
	const peso = 500
	const nivelPeligrosidad = 10
	method peso() = peso
	
	method nivelPeligrosidad() = nivelPeligrosidad
	
	method activar() {
		
	}
	
	method cantidadBultos() = 1
}

object bumblebee {
	const peso = 800
	var transformado =false
	method peso() = peso
	
	method nivelPeligrosidad() = if(transformado){15}else{30}
	
	method activar() {
		transformado = true
	}
	
	method cantidadBultos() = 1
}

object paqueteDeLadrillos {
	var cantidadLadrillo = 0
	const pesoLadrillo = 2
	method peso() = cantidadLadrillo*pesoLadrillo
	
	method nivelPeligrosidad() = 2
	
	method activar() {
		cantidadLadrillo += 12
	}
	
	method cantidadBultos() = 1//falta corregir
}

object arenaAGranel {
	var peso = 0
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
	
	method activar() {
		peso+=20
	}
	
	method cantidadBultos() = 1
}

object bateriaAntiaerea {
	var cargado = false
	
	method peso() = if(cargado){300}else{200}
	
	method nivelPeligrosidad() = if(cargado){100}else{0}
	
	method activar() {
		cargado = true
	}
	
	method cantidadBultos() = if(cargado){2}else{1}
}
//quedo hasta contenedor portuario,completar en casa
object contenedorPortuario {
	const pesoPropio = 100
	const cosasDentro = #{}
	method cosasDentro() =cosasDentro 
	method peso() = pesoPropio + cosasDentro.sum({cosa=>cosa.peso()})
	
	method nivelPeligrosidad() = cosasDentro.maxIfEmpty({cosa=>cosa.nivelPeligrosidad()},{0})
	
	method activar() {
		
	}
	
	method cantidadBultos() = 1
}
/*
object residuosRadioactivos {
	var peso = 500
	
	method peso() = peso
	
	method nivelPeligrosidad() = 10
	
	method activar() {
		
	}
	
	method cantidadBultos() = 1
}}*/