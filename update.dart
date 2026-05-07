import 'dart:io';

void updateBook(List<Map<String, dynamic>> books) {
  print('\n--- Actualizar libro ---');

  if (books.isEmpty) {
    print('No hay libros para actualizar.');
    return;
  }

  for (int i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i]['titulo']}');
  }

  print("Seleccione el número del libro a actualizar: (1-${books.length})");

  int index = int.parse(stdin.readLineSync()!) - 1;

  if (index >= 0 && index < books.length) {

    print('Nuevo título del libro: ');
    String title = stdin.readLineSync()!;

    print('Nuevo autor: ');
    String author = stdin.readLineSync()!;

    print('Nuevo año de publicación: ');
    int year = int.parse(stdin.readLineSync()!);

    books[index] = {
      'titulo': title,
      'autor': author,
      'year': year
    };

    print('\nLibro actualizado correctamente.');

  } else {
    print('Número inválido.');
  }
}
