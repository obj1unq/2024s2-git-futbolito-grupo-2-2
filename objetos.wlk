/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method darPaseAtras() {
		self.validarDarPaseAtras()
		pelota.position(pelota.posicionDespuesDeTaquito())

	}

	method validarDarPaseAtras() {
		if(!self.estaDondePelota()) {
			self.error("Lionel no se encuentra donde está la pelota. No puede patearla de taco.")
		}
	}

	method estaDondePelota() {
		return self.position()==pelota.position()
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method posicionDespuesDeTaquito() {
		return game.at((position.x()-2).max(0), position.y())
	}
}