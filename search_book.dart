import 'dart:io';
import 'dart:convert';

void searchBook(List<Map<String, dynamic>> books) {
  print('\n--- Buscar Libro ---');

  if (books.isEmpty) {
    print('No hay libros registrados para buscar.');
    return;
  }

  print('¿Cómo deseas buscar?');
  print('1. Por índice');
  print('2. Por nombre del libro');
  stdout.write('Seleccione una opción: ');
  String? option = stdin.readLineSync(encoding: utf8);

  switch (option) {
    case '1':
      _searchByIndex(books);
      break;
    case '2':
      _searchByName(books);
      break;
    default:
      print('Opción no válida.');
  }
}


void _searchByIndex(List<Map<String, dynamic>> books) {
  stdout.write('Ingrese el número del libro (índice): ');
  String? input = stdin.readLineSync(encoding: utf8);

  // Validar que sea un número
  int? index = int.tryParse(input ?? '');

  if (index == null) {
    print('Error: Debe ingresar un número válido.');
    return;
  }

  
  int realIndex = index - 1;

  if (realIndex < 0 || realIndex >= books.length) {
    print('Error: El índice está fuera de rango. Hay ${books.length} libros.');
  } else {
    print('\n--- Libro Encontrado ---');
    print('Título: ${books[realIndex]['titulo']}');
    print('Autor: ${books[realIndex]['autor']}');
    print('Año: ${books[realIndex]['year']}');
  }
}


void _searchByName(List<Map<String, dynamic>> books) {
  stdout.write('Ingrese el título o parte del título: ');
  String? query = stdin.readLineSync(encoding: utf8);

  if (query == null || query.trim().isEmpty) {
    print('Error: Debe ingresar un texto para buscar.');
    return;
  }

  List<Map<String, dynamic>> results = books.where((book) => 
    book['titulo'].toString().toLowerCase().contains(query.toLowerCase())
  ).toList();

  if (results.isEmpty) {
    print('No se encontraron libros con ese título.');
  } else {
    print('\n--- Resultados de la búsqueda ---');
    for (var book in results) {
      print('Título: ${book['titulo']}');
      print('Autor: ${book['autor']}');
      print('Año: ${book['year']}');
      print('-----------------------------');
    }
  }
}