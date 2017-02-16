//: Playground - noun: a place where people can play

import UIKit

/*
 Deberes 18/01/2017
 Modificar la propiedad name para que sea de tipo String y no String?.  Arreglar el getter de la propiedad para que si ambos componentes están vacío, que devuelva una cadena vacía.
Pista. Recuerda el operador ?? o míralo en el libro que os ha puesto María.

* Crea una clase Book con propiedades Título y Autor.
* Crea dos inicializadores, el designado y otro para cunado el autor es desconocido (anónimo).
* Implementa el protocolo CustomStringRepresentation y comprueba que funciona
* Implemente el protocolo Equatable y comprueba que funciona
* Implementa el protocolo Comparable de tal forma que los libros se ordenen por título y luego por autor. Comprueba que funciona
*/

// Deberes 20/01/2017
// Juguetear con map. Intentar mapear sobre varias colecciones, como por ejemplo:
//   Un Array de cadenas que las transforma a minúsculas
// map
// Map recorre una colección y desempaqueta cada uno de sus elementos.
let arrayAMinuscula = ["HOLA", "QUE","TAL"]
let minusculas = arrayAMinuscula.map{$0.lowercased()}
minusculas


//Un Array de URLS de tipo variado (ftp, http, https, file). Transfórmalo en un array de protocolos (http, file, ftp, etc). Para eso necesitaras el método scheme de URL. Míralo en la ayuda.
let arrayURL = ["http:www.google.es", "","TAL"]
let URLs = arrayURL.map{$0.lowercased()}
URLs

/*
 Haz lo mismo con flatMap y comprueba que si hay un opcional vacio en el array, se lo salta a la torera.
Map y flatMap tienen dos amigas: filter y reduce. Averigua qué hacen.Lee la documentación sobre ambas funciones

Añade esta [función](https://gist.github.com/frr149/104425614894793890d6be6b1f6c89d8) a tu fichero JSONProcessing.swift
Asegúrate de entender lo que hace.
Lee la documentación sobre JSONSerialization
Usala para leer los ficheros JSON que tienes y probar tus funciones decode

Crea las funciones decode para [StarWarsCharacter] y [ForceSensitive]. Implementalas:
primero con un for
    luego con map
luego con flatMap (para evitar sustos si te viene un nil)
Asegúrate de que creas los objetos correctamente
 */