package controller;

import entity.Jugadores;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import repository.JugadoresAPI;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/jugadores") //http://localhost:8080/jugadores
public class JugadoresController {

    @Autowired
    JugadoresAPI jugadoresAPI;

    //devolver todos los jugadores -> http://localhost:8080/jugadores
    @GetMapping
    public List<Jugadores> getAllJugadores() {
        return jugadoresAPI.findAll();
    }

    // Devolver jugador con id -> http://localhost:8080/jugadores/{id}
    @GetMapping("/{id}")
    public ResponseEntity getJugadorID(@PathVariable("id") Integer id) {
        Optional<Jugadores> jugador = jugadoresAPI.findById(id);
        if (jugador.isEmpty()) {
            return new ResponseEntity("Jugador no encontrado", HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity(jugador.get(), HttpStatus.OK);
        }
    }

    //insertar un jugador nuevo -> http://localhost:8080/jugadores
    @PostMapping
    public Jugadores newJugador(@RequestBody Jugadores jugador) {
        return jugadoresAPI.save(jugador);
    }
}
