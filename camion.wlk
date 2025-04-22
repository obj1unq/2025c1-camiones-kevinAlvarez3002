import cosas.*

object camion {
	const property cosas = #{}
	const pesoMaximoAguantado = 2500
	
	method cargar(unaCosa) {
		unaCosa.activar()
		cosas.add(unaCosa)
	}
	
	method todoPesoPar() = cosas.all({ cosa => cosa.peso().even() })
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method elDeNivel(nivel) = cosas.find({ cosa => cosa.nivelPeligrosidad() })
	
	//tira error si no hay dicho objeto
	method pesoTotal() = cosas.sum({ cosa => cosa.peso() })
	
	method excedidoDePeso() = self.pesoTotal() > pesoMaximoAguantado
	
	method objetosQueSuperanPeligrosidad(nivelDePeligro) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() > nivelDePeligro }
	)
	
	method objetosMasPeligrososQue(cosa) = self.objetosQueSuperanPeligrosidad(
		cosa.nivelPeligrosidad()
	)
	
	method objetoMasPeligroso() = cosas.max({ cosa => cosa.nivelPeligrosidad() })
	
	method peligroMaximo() = self.objetoMasPeligroso().nivelPeligrosidad()
	
	method excedidoDePeligro(
		nivelDePeligro
	) = nivelDePeligro < self.peligroMaximo()
	
	method puedeCircularEnRuta(
		nivelMaximoPeligrosidad
	) = self.excedidoDePeso() && self.excedidoDePeligro(nivelMaximoPeligrosidad)
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any(
		{ cosa => cosa.peso().between(min, max) }
	) //deberia agregar la condicion a los objetos
	
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	
	method pesos() = cosas.map({ cosa => cosa.peso() })
	
	method totalBultos() = cosas.sum({ cosa => cosa.cantidadBultos() })
}