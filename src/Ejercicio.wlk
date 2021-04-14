object macoWins {
	const ventas = []
	
	method ganancias(fecha) = self.ventasDe(fecha).sum({venta => venta.monto()})
	
	method ventasDe(fecha) = ventas.filter({unaVenta => unaVenta.conFecha(fecha)})
}

class Prenda { // Es una clase abstracta
	var precio
	
	var estado
	
	method precio() = estado.modificarPrecio(precio)
	
	method fraccionDePrecio(fraccion) = self.precio() * fraccion
}

class Saco inherits Prenda { // Es medio raro que queden las clases vacías o sin atributos ni comportamiento, pero creo que las reglas del negocio imponene la existencia de las mismas
	
}

class Pantalon inherits Prenda {
	
}

class Camisa inherits Prenda {
	
}

object nueva {
	method modificarPrecio(precioBase) = precioBase
}

class Promocion {
	const valorARestar
	
	method modificarPrecio(precioBase) = precioBase - valorARestar
}

object liquidacion {
	method porcentaje() = 0.5
	
	method modificarPrecio(precioBase) = precioBase - precioBase * self.porcentaje()
}

class Venta {
	const fecha
	
	const conceptosVendidos = []
	
	const formaDePago
	
	method conFecha(unaFecha) = unaFecha == fecha
	
	method monto() = formaDePago.calcularMonto(self)
	
	method montoDeConceptosVendidos() = conceptosVendidos.sum({concepto => concepto.monto()})
	
	method sumaDeFraccionesDeConceptos(fraccion) = conceptosVendidos.sum({concepto => concepto.fraccionDeMonto(fraccion)})
}

class Concepto {
	const prenda
	
	const cantidad
	
	method monto() = cantidad * prenda.precio()
	
	method fraccionDeMonto(fraccion) = cantidad * prenda.fraccionDePrecio(fraccion)
}

class Efectivo {
	method calcularMonto(venta) = venta.montoDeConceptosVendidos()
	
}

class Tarjeta inherits Efectivo{
	const cantCuotas
	
	const coeficiente
	
	method recargo(venta) = cantCuotas * coeficiente + self.fraccionDeConceptos(0.01, venta)
	
	method fraccionDeConceptos(fraccion, venta) = venta.sumaDeFraccionesDeConceptos(fraccion)
	
	override method calcularMonto(venta) = super(venta) + self.recargo(venta)
}



