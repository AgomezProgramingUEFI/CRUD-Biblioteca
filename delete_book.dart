import 'dart:io';

void deleteBook(List<Map<String, dynamic>> books) {
  print("=== Eliminar Libro ===");

  if (books.isEmpty) {
    print("No hay libros para eliminar.");
    return;
  }

  print("Ingrese el índice del libro a eliminar (1-${books.length}): ");
  int indexBook = int.parse(stdin.readLineSync()!);

  if(0 <= indexBook && indexBook < books.length) {
    books.removeAt(indexBook);
    print("Libro eliminado con éxito.");
  } else {
    print("Índice de libro inválido.");
  }
  
}