// example.wlk
// example.wlk
// example.wlk
// example.wlk
object dominic {
  //la coleccion de autos es de dominic
  const autos = []

  //para agregar un elemento a una coleccion
  //mensaje de orden
  method comprar(unAuto){autos.add(unAuto)}

  //encontrar es porque tengo que buscar algo en algun lado
  //c coleccione en este caso el auto
  method autosNoEnCondiciones()= autos.filter({a => !a.enCondiciones()})

  method autoEnCondiciones()= autos.filter({a=>a.enCondiciones()})

  method mandarAutosATaller(){
    taller.recibirAutos(self.autosNoEnCondiciones())
  }

  //indicacion, hacer prueba lo entinden los autos
  method realizarPruebasDeVelocidad()=autos.forEach({a => a.hacerPrueba()})
  

  method venderAutos(){
    autos.clear()
  }

  //asi los recorro con el clousure
  method promedioVelocidades() = autos.sum({a=> a.velocidadMaxima()}) / autos.size()

  //sublista me retorn
  method masRapido() = if(autos.autoEnCondiciones()) 
  autos.max({a => a.velocidadMaxima()})

  //verdadero o falso
  method hayUnAutoMuyRapido()= self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidades()
}

//taller hace cosas es otro objeto
object taller{
  const autosAReparar = []

  method recibirAutos(listaDeAutos){
    autosAReparar.addAll(listaDeAutos)
  }

  //sublista
  method repararAuto(){
    autosAReparar.forEach({a => a.reparar()})//clousore
    autosAReparar.clear()
  }


}

object ferrari {
  var motor = 87
  method enCondiciones() = motor >= 65
  method reparar(){motor = 100}
  method velocidadMaxima() = 110 + if(motor>75) 15 else 0
  method hacerPrueba(){motor = (motor - 30).max(0)}
}

object flecha{
  //inicial es var
  var cantidadLitrosCombustible = 100

  var color = azul
  //getter consulta el valor del estado
  var property combustible = gasolina
  //setter cambiar el atributo
  //method conbustible(unValor){combustible = unValor}

  method enCondiciones()= cantidadLitrosCombustible > combustible.nivelMinimo() 

  method hacerPrueba(){
    cantidadLitrosCombustible = (cantidadLitrosCombustible -5).max(0)
  }

  method reparar(){
    cantidadLitrosCombustible = cantidadLitrosCombustible * 2
    color = color.cambiarDeColor()
  }

  method velocidadMaxima(){
    return cantidadLitrosCombustible * 2 + combustible.calculoAdicional(cantidadLitrosCombustible)
  }


}

object gasolina{
  method nivelMinimo() = 85
  method calculoAdicional(litros)=10
}
object nafta{
  method nivelMinimo() = 50
  method calculoAdicional(litros)= -1 * ((litros * 2) * 0.10)
}
object nitrogeno{
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
