void listBooks(List<Map<String, dynamic>> books) {
  print('\n--- Lista de libros ---');

  if (books.isEmpty) {
    print('No hay libros registrados.');
    return;
  }

  for (int i = 0; i < books.length; i++) {
    print('\nLibro ${i + 1}');
    print('Título: ${books[i]['titulo']}');
    print('Autor: ${books[i]['autor']}');
    print('Año: ${books[i]['year']}');
  }
}