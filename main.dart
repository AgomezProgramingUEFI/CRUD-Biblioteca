import 'dart:io';
import 'dart:convert';
import 'add_book.dart';
import 'list_books.dart';
import 'update.dart';
import 'exit.dart';

void main() {
  stdout.encoding = utf8;

  final books = <Map<String, dynamic>>[];
  bool running = true;

  while (running) {
    print('\n=== Biblioteca - Gestión de Libros ===');
    print('1. Agregar libro');
    print('2. Listar libros');
    print('3. Buscar libro (pendiente)');
    print('4. Actualizar libro (pendiente)');
    print('5. Eliminar libro (pendiente)');
    print('6. Salir');

    stdout.write('Seleccione una opción: ');
    String? choice = stdin.readLineSync(encoding: utf8);

    switch (choice) {
      case '1':
        addBook(books);
        break;

      case '2':
        listBooks(books);
        break;

      case '3':
        print('\nFunción pendiente.');
        break;

      case '4':
        updateBook(books);
        break;

      case '5':
        print('\nFunción pendiente.');
        break;

      case '6':
        exit(books);
        running = false;
        break;

      default:
        print('\nOpción inválida.');
    }
  }
}
