// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
// dominic.wlk
object dominic {
  const autos = []

  method comprar(unAuto) {
    autos.add(unAuto)
  }

  method autosNoEnCondiciones() = autos.filter({ a => !a.enCondiciones() })

  method autosEnCondiciones() = autos.filter({ a => a.enCondiciones() })

  method mandarAutosATaller() {
    taller.recibirAutos(self.autosNoEnCondiciones())
  }

  method realizarPruebasDeVelocidad() = autos.forEach({ a => a.hacerPrueba() })

  method venderUnAuto(unAuto){
    autos.remove(unAuto)
  }

  method venderAutos() {
    autos.clear()
  }

  method promedioVelocidades() = if (autos.isEmpty()) 0 else autos.sum({ a => a.velocidadMaxima() }) / autos.size()

  method masRapido() = self.autosEnCondiciones().max({ a => a.velocidadMaxima() })

  method hayUnAutoMuyRapido() = self.autosEnCondiciones().notEmpty() and self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidades()
}

object taller {
  const autosAReparar = []

  method recibirAutos(listaDeAutos) {
    autosAReparar.addAll(listaDeAutos)
  }

  method repararAuto() {
    autosAReparar.forEach({ a => a.reparar() })
    autosAReparar.clear()
  }
}

// --- Los Autos ---

object laFerrari {
  var nivelFuncionamientoMotor = 87

  method enCondiciones() = nivelFuncionamientoMotor >= 65

  method reparar() {
    nivelFuncionamientoMotor = 100
  }

  method velocidadMaxima() = 110 + if (nivelFuncionamientoMotor > 75) 15 else 0

  method hacerPrueba() {
    nivelFuncionamientoMotor = (nivelFuncionamientoMotor - 30).max(0)
  }
}

object laFlechaRubi {
  var litrosCombustible = 100
  var tipoCombustible = gasolina
  var color = azul

  method cambiarCombustible(nuevoCombustible) {
    tipoCombustible = nuevoCombustible
  }

  //method enCondiciones() = color == rojo and (
    //  (tipoCombustible == gasolina and litrosCombustible > 85) or
     // (tipoCombustible == nafta and litrosCombustible > 50) or
     // (tipoCombustible == nitrogeno liquido and litrosCombustible > 0)
    //)

  method enCondiciones()= litrosCombustible > tipoCombustible.nivelMinimo()



  method reparar(){
    litrosCombustible = litrosCombustible * 2
    color = color.cambiarDeColor()
  }

  method hacerPrueba() {
    litrosCombustible = (litrosCombustible - 5).max(0)
  }

  method velocidadMaxima(){
  return litrosCombustible * 2 + tipoCombustible.calculoAdicional(litrosCombustible)
}
}

object elIntocable {
  var property estaEnCondiciones = true // Can vary

  method enCondiciones() = estaEnCondiciones

  method reparar() {
    estaEnCondiciones = true
  }

  method hacerPrueba() {
    estaEnCondiciones = false
  }

  method velocidadMaxima() = 45
}

object elTronador { 
  var durabilidadNeumaticos = 100 // 0 to 100
  var tieneAlarmaActivada = false

  method enCondiciones() = durabilidadNeumaticos >= 30 and !tieneAlarmaActivada

  method reparar() {
    durabilidadNeumaticos = 100
    tieneAlarmaActivada = false 
  }

  method velocidadMaxima() = 80 + (durabilidadNeumaticos / 2) 
}

object gasolina{
  method nivelMinimo() = 85
  method calculoAdicional(litros)=10
}
object nafta{
  method nivelMinimo() = 50
  method calculoAdicional(litros)= -1 * ((litros * 2) * 0.10)
}
object nitrogenoLiquido{
  method nivelMinimo() = 0
  method calculoAdicional(litros)=
 (litros * 2) * 10
}

object azul{
  method cambiarDeColor()=verde
}
object rojo{
  method cambiarDeColor()=azul
}
object verde{
  method cambiarDeColor()=rojo
}