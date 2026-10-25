import 'package:flutter/material.dart';

// 1. CLASE PELICULA CON SUS ATRIBUTOS
class Pelicula {
  String titulo;
  String genero;
  int duracion;
  String sinopsis;

  Pelicula(this.titulo, this.genero, this.duracion, this.sinopsis);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: const PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    List<Pelicula> peliculas = [
      Pelicula("Avengers Endgame", "Acción", 181, "Los Vengadores se enfrentan a Thanos para salvar el universo"),
      Pelicula("Toy Story 4", "Animación", 100, "Woody y sus amigos viven una nueva aventura"),
      Pelicula("Titanic", "Drama", 195, "Historia de amor a bordo del famoso barco hundido"),
      Pelicula("El Conjuro 2", "Terror", 134, "Los Warren investigan un caso paranormal en Londres"),
    ];

    return Scaffold(
      backgroundColor: Colors.black, // 1. FONDO NEGRO
      appBar: AppBar(
        title: const Text("Catálogo de Películas"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Películas Disponibles",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), // 2. TEXTO BLANCO
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: peliculas.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xFF1E1E1E), // 3. CARD GRIS OSCURO
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.movie, size: 50, color: Colors.red),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(peliculas[index].titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                              const SizedBox(height: 4),
                              Text("Género: ${peliculas[index].genero}", style: const TextStyle(color: Colors.white70)),
                              Text("Duración: ${peliculas[index].duracion} min", style: const TextStyle(color: Colors.white70)),
                              Text("Sinopsis: ${peliculas[index].sinopsis}", style: const TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.local_movies),
      ),
    );
  }
}