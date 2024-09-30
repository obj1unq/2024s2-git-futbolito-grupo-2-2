/** First Wollok example */
import wollok.game.*

object lionel {
	const property balon = pelota
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
		if (self.usaTitular()) {
			camiseta = "suplente"
		} else {
			camiseta = "titular"
		}
	}

	method usaTitular() {
		return camiseta == "titular"
	}

	method validarCambiarCamiseta() {
		if(!self.posicionCambiarCamiseta()) {
			self.error("No es lugar para cambiarme")
		}
	}

	method posicionCambiarCamiseta() {
		return position.x() == 0
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
	
	method patear() {
	  self.validarPatear()
	  balon.serPateada()
	}

	method validarPatear() {
	  if ( balon.position() != self.position()){
		 self.error("No hay ninguna pelota aca!")
		 game.say(self,"No hay ninguna pelota aca!")
	  }
	}

	method buscar() {
		position = game.at(pelota.position().x(), pelota.position().y())
	}

	method levantar() {
		self.validarLevantar()
		pelota.subir()
		game.schedule(2000, { pelota.bajar()})
	}

	method validarLevantar() {
		if(!self.hayPelota()){// && self.hayLugar()){
			self.error("no hay pelota")
		}
	}

	method hayPelota() {
		return pelota.position() == self.position()
	}
	/*
	method hayLugar() {
		return position <= game.height() - 1
	}*/
	
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method serPateada() {
	  position = game.at((game.width() - 1).min(position.x() + 3), position.y())
	}

	method posicionDespuesDeTaquito() {
		return game.at((position.x()-2).max(0), position.y())
	}

	method iniciar() {
		position = game.at(0,5)
	}

	method subir() {
		position = position.up(1)
	}

	method bajar() {
		position= position.down(1)
	}
}
