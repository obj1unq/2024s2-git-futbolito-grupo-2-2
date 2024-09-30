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
