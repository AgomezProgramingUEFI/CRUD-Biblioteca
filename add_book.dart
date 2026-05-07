import 'dart:io';
import 'dart:convert';

void addBook(List<Map<String, dynamic>> books) {
  print('\n--- Agregar libro ---');

  String title = readNonEmptyString('Título del libro: ');
  String author = readNonEmptyString('Autor: ');
  int year = readValidYear('Año de publicación: ');

  books.add({
    'titulo': title,
    'autor': author,
    'year': year,
  });

  print('\nLibro agregado correctamente.');
}

String readNonEmptyString(String message) {
  while (true) {
    stdout.write(message);

    String? input = stdin.readLineSync(encoding: utf8);

    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }

    print('El campo no puede estar vacío.');
  }
}

int readValidYear(String message) {
  while (true) {
    stdout.write(message);

    String? input = stdin.readLineSync(encoding: utf8);

    if (input == null || input.trim().isEmpty) {
      print('Debes ingresar un año.');
      continue;
    }

    int? year = int.tryParse(input);

    if (year == null) {
      print('Debes ingresar un número.');
      continue;
    }

    if (year < 0) {
      print('El año no puede ser negativo.');
      continue;
    }

    return year;
  }
}