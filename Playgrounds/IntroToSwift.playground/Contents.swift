//: # Intro a Swift

// Se importa la Framework Foundation
import Foundation

//: ## Variables y Constantes
// Variables Mutables (var)
var size: Double = 42.0
var answer = 42.0
size = size + 4
// Variables inmutables (let). Esto es lo recomendable
let name = "Anakin"

// Por defecto, usaremos siempre let.

//: ## Todo quisqui es un objeto
Int.max         // Propiedad
Double.abs(-45) // Método

//: ## Conversiones se hacen mediante inicializadores
let a = Int(size)

//: ## typealias: Darle un nombre normal a un tipo con nombre raro
//: Importante de cara al futuro.
typealias Integer = Int
let a1: Integer = 99

//: ## Colecciones
// La cadena
var swift = "Nuevo lenguaje "
swift = swift + "!"

// Arrays
let words = ["uno", "dos", "tres", "cuatro"]
words[0]

// Diccionarios
// [clave: valor]
let numberNames = [1: "one", 2: "two"]
numberNames[2]

// Sets (Conjuntos)


//: ## Iteraciones
var total = ""
// Iteración de una Colección
for element in [1,2,3,4,5,5,6,6] {
    total = "\(total) \(element + 1)"
}
// Lo más importante, es que para que la interpolación de cadenas funcione, el tipo ha de implementar un protocolo.
// Swift es un lenguaje creado a base de protocolos.

// Iteración de un Diccionario
for (key, value) in numberNames {
    print("\(key) -- \(value)")
}

//: ## Tuplas: Forma sencilla de asociar datos
let triplet = (1, "one", "Spanish")
triplet.0
triplet.1
triplet.2

//: ## Funciones
func h(perico a: Int, deLosPalotes b: Int) -> Int {
    return (a + b) * a
}
h(perico: 3, deLosPalotes: 5)

// Función sin nombre externo:
// la variable anónima
func f(_ a: Int, _ b: Int) -> Int {
    return a + b
}
f(8, 9)

// Ejemplo cuya llamada aporta mucha información,
// como los mensajes de Objective C
func sum(_ a: Int, _ b: Int, thenMultiplyBy c: Int) -> Int {
    return (a + b) * c
}
sum(3, 4, thenMultiplyBy: 8)

// Valores por defecto
func addSuffixTo(_ a: String, suffix: String = "ingly") -> String {
    return a + suffix
}
addSuffixTo("accord")
addSuffixTo("Objective-", suffix: "C")

// Valores de retorno
func namesOfNumbers(_ a: Int) -> (Int, String, String) {
    var val: (Int, String, String)
    
    switch a {
    case 1:
        val = (1, "one", "uno")
    case 2:
        val = (2, "two", "dos")
    default:
        val = (a, "got check Google translator", "vete a Google")
    }
    
    return val
}
let r = namesOfNumbers(45)
let (number, english, spanish) = namesOfNumbers(2)
print(number, english, spanish)
let (_, en, es) = namesOfNumbers(1)
print(en, es)

//: Funciones de alto nivel
typealias IntToIntFunc = (Int) -> Int
let z: IntToIntFunc

// Funciones como parámetros
func apply(f: IntToIntFunc, n: Int) -> Int {
    return f(n)
}

func doubler(a: Int) -> Int {
    return a * 2
}

func add42(a: Int) -> Int {
    return a + 42
}
apply(f: doubler, n: 5)

// Función que devuelve otra función (clausura)
func compose(_ f: @escaping IntToIntFunc,
             _ h: @escaping IntToIntFunc) -> IntToIntFunc {

    // Funciones dentro de funciones??? Sip!
    func comp(_ a: Int) -> Int {
        return f(h(a))
    }
    
    return comp
}

compose(doubler, add42)(8)

//: ## Sintáxis de Clausura (queda para después)


//: ## Optionals: son cajas
// Empaquetado - Meto dentro de la caja
var maybeString: String? = "Estoy encerrado en una cajarl!"
var maybeInt: Int?

// El operador ?? permite dar un valor por defecto, cuando el opcional está vacío
print(maybeString ?? "No hay nada")
print(maybeInt ?? "Soy un opcional vacío")

// Desempaquetado Seguro
if let certainlyAString = maybeString {
    // Seguro, seguro que hay un valor
    print("Ya te decía yo que era una cadena, joé")
    print(certainlyAString)
}

// Otra forma de desempaquetado seguro es el guard (queda para después)

// Desempaquetado Inseguro
var alláVoy = maybeString!
//var decabeza = maybeInt!  // Se cae la app

// Otra forma de desempaquetado seguro: optional chaining (queda para después)


//: ## Aggregate types: enums, structs, classes, tuples
// enum
enum LightSabreColor {
    case Blue, Red, Green, Purple
}

// struct
struct LightSabre {
    // Static or "class" property
    static let quote = "An elegant weapon for a more civilized time"
    
    // Instance Properties (Variables de Instancia)
    var color: LightSabreColor = .Green
    var isDoubleEdged = false
}

// class
class Jedi {
    var lightSabre = LightSabre()
    var name: String = ""
    
    // Inicializadores
    init(name: String, lightSabre: LightSabre) {
        self.name = name
        self.lightSabre = lightSabre
    }
}

//: ## Genéricos
// Ejemplos que ya conocemos
// Colecciones
let nums = [1,2,3,4,5]
let numss : Array<Int> = [1,2,3,4,5]
// Diccionarios
let dict : Dictionary<String, Int>?
let maybeADouble : Optional<Double>

// Ejemplo con clases, pero con funciones sería lo mismo
class Pair<Left, Right> {
    let left : Left
    let right : Right
    
    init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }
}
let p1 = Pair(left: 4, right: "hola")
let p2 = Pair(left: p1, right: nums)

// Genérico con restricciones
class Bucket<Value: Hashable> {
    let val: Value
    init(val: Value) {
        self.val = val
    }
}
let b1 = Bucket(val: 4)
// No cuela porque Bucket no implementa hashable
//let b2 = Bucket(val: p1)

//: # Value types y Reference types











