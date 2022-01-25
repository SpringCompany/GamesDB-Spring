package controller;

import entity.Jugadores;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import repository.JugadoresAPI;

import java.util.List;
import java.util.Optional;

@RestController
public class JugadoresController {
    @Autowired
    JugadoresAPI jugadoresAPI;

    // Devolver todos los jugadores
    @GetMapping("Jugadores")
    public List<Jugadores> getAllJugadores() {
        return jugadoresAPI.findAll();
    }

    // Devolver los jugadores con id pasado por URL.
    @GetMapping("Jugador/{id}")
    public ResponseEntity getJugadorID(@PathVariable("id") Integer id) {
        Optional<Jugadores> jugador = jugadoresAPI.findById(id);
        if (jugador.isEmpty()) {
            return new ResponseEntity("Jugador no encontrado", HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity(jugador.get(), HttpStatus.OK);
        }
    }
}
