/** First Wollok example */
import wollok.game.*

object lionel {
	var camiseta = "titular"
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-" + camiseta + ".png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method cambiarCamiseta() {
		self.validarCambiarCamiseta()
		if (camiseta == "titular") {
			camiseta = "suplente"
		} else {
			camiseta = "titular"
		}
	}

	method validarCambiarCamiseta() {
		if(!self.posicionCambiarCamiseta()) {
			self.error("No es lugar para cambiarme")
		}
	}

	method posicionCambiarCamiseta() {
		return position.x() == 0
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	
}
