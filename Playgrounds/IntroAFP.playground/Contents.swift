//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Todas las funciones de Swift son clausuras, es decir, pueden acceder a todo lo que se ha declarado anteriormente
let answer = 42
func whatIsTheAnswer() -> Int {
    return answer
}

// Sintaxis de clausura
func g(_ a: Int) -> Int {
    return a + 3
}

// Lo anterior es exactamente igual a ...
let gg = {(a:Int) -> Int in
    return a + 3
}

g(1)
gg(1)

// Versiones simplificadas
let clousures = [g,
                 {(a: Int) -> Int in return a * 2},
                 {a in return a + 34},
                 {a in a / 32},
                 {$0 * 42}
]


let f = {$0 + 4}
f(54)

// Iterar de forma funcional
let nums = [1,2,3,4,5,6,7,8]

let transformed = nums.map({$0 * 42})
transformed

// Trailing clousure
let transformedTrailing = transformed.map{$0 + 1}
transformedTrailing

// map
// Map recorre una colección y desempaqueta cada uno de sus elementos.
let cadenasAMinuscula = ["HOLA", "QUE","TAL"]
let minusculas = cadenasAMinuscula.map{$0.lowercased()}
minusculas

// flatMap
// Es un Map que desempaqueta opcionales y mapea el contenido. Si un opcional está vacío, se lo salta
let names: [String?] = ["hola",nil,"mundo"]
let NAMES = names.flatMap{$0?.uppercased()}
print(NAMES)

let limpieza = names.flatMap{$0}
print(limpieza)

// Una forma de ver que todos los elementos son nil, es esta
let niles : [String?] = [nil, nil, nil]
if (niles.flatMap{$0}).count == 0 {
    print("Todo vacíos")
}
