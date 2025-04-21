import cosas.*

object camion {
	const property cosas = #{}
	const pesoMaximoAguantado =2500 
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method todoPesoPar() = cosas.all({cosa=> cosa.peso().even()})
	method hayAlgunoQuePesa(peso) = cosas.any({cosa=> cosa.peso()==peso})
	method elDeNivel(nivel) = cosas.find({cosa=>cosa.nivelPeligrosidad()})//tira error si no hay dicho objeto
	method pesoTotal() = cosas.sum({cosa=>cosa.peso()})
	method excedidoDePeso() = self.pesoTotal()> pesoMaximoAguantado
	method objetosQueSuperanPeligrosidad(nivelDePeligro) = cosas.filter({cosa=> cosa.nivelPeligrosidad()>nivelDePeligro})
}
