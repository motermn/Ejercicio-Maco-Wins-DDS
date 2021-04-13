object macoWins {
	const ventas = []
	
	method ganancias(fecha) = self.ventasDe(fecha).sum({venta => venta.monto()})
	
	method ventasDe(fecha) = ventas.filter({unaVenta => unaVenta.tieneFecha(fecha)})
}

class Prenda { // Es una clase abstracta
	var precio
	
	var estado
	
	method precio() = estado.modificarPrecio(precio) 
}

class Saco inherits Prenda {
	
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
	
	method tieneFecha(unaFecha) = unaFecha == fecha
	
	method monto() = 0
}

class Concepto {
	
}





