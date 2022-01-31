package controller;

import entity.Jugadores;
import exception.ErrorException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import repository.JugadoresRepository;

import java.awt.print.Book;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/jugadores") //http://localhost:8080/jugadores
public class JugadoresController {

    @Autowired
    JugadoresRepository jugadoresRepository;

    //Devolver todos los jugadores -> http://localhost:8080/jugadores
    @Operation(summary = "Returns a player filtered by age or if null, a complete list")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Player Found", content =
            {@Content(mediaType = "application/json", schema = @Schema(implementation = Book.class))}),
            @ApiResponse(responseCode = "400", description = "Invalid - Object Player Invalid", content = @Content),
            @ApiResponse(responseCode = "404", description = "Player Not Found", content = @Content)})

    @GetMapping
    public List<Jugadores> getAllJugadores(@RequestParam(value = "age", required = false) Integer age) {
        if (age != null) {
            return jugadoresRepository.findAllByEdadGreaterThanOrderByCodJugador(age);
        } else {
            return jugadoresRepository.findAll();
        }

    }

    //Devolver jugador con id -> http://localhost:8080/jugadores/{id}
    @Operation(summary = "Returns a Player filtered by id")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Player Found", content =
            {@Content(mediaType = "application/json", schema = @Schema(implementation = Book.class))}),
            @ApiResponse(responseCode = "400", description = "Invalid - Object Player Invalid", content = @Content),
            @ApiResponse(responseCode = "404", description = "Player Not Found", content = @Content)})

    @GetMapping("/{id}")
    public ResponseEntity getJugadorID(@PathVariable("id") Integer id) {
        Optional<Jugadores> jugador = jugadoresRepository.findById(id);
        if (jugador.isEmpty()) {
            return new ResponseEntity("Player Not Found", HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity(jugador.get(), HttpStatus.OK);
        }
    }

    //insertar un jugador nuevo -> http://localhost:8080/jugadores
    @Operation(summary = "Insert a Player")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Player Inserted", content =
            {@Content(mediaType = "application/json", schema = @Schema(implementation = Book.class))}),
            @ApiResponse(responseCode = "400", description = "Invalid - Object Player Invalid", content = @Content),
            @ApiResponse(responseCode = "404", description = "Inserted Player Not Found", content = @Content)})

    @PostMapping
    public Integer newJugador(@RequestBody Jugadores jugador) {
        Jugadores insert = jugadoresRepository.save(jugador);
        return insert.getCodJugador();
    }

    //borrar un juego -> http://localhost:8080/Juegos/{id}
    @Operation(summary = "Delete a Player by Id")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Player Found And Deleted", content =
            {@Content(mediaType = "application/json", schema = @Schema(implementation = Book.class))}),
            @ApiResponse(responseCode = "400", description = "Invalid - Object Player Invalid", content = @Content),
            @ApiResponse(responseCode = "404", description = "Player Not Found", content = @Content)})

    @DeleteMapping("/{id}")
    public ResponseEntity<ErrorException> deleteJugador(@PathVariable("id") int id) {
        Optional<Jugadores> delJugador = jugadoresRepository.findById(id);
        if (!delJugador.isPresent()) {
            return new ResponseEntity<ErrorException>(new ErrorException("Player Not Found", id), HttpStatus.NOT_FOUND);
        }
        jugadoresRepository.deleteById(id);
        return new ResponseEntity<ErrorException>(new ErrorException("Player Found And Deleted", id), HttpStatus.OK);
    }

    //modificar un juego -> http://localhost:8080/Juegos/{id}
    @Operation(summary = "Updates a Player by ID")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Player Found and Updated", content =
            {@Content(mediaType = "application/json", schema = @Schema(implementation = Book.class))}),
            @ApiResponse(responseCode = "400", description = "Invalid - Object Player Invalid", content = @Content),
            @ApiResponse(responseCode = "404", description = "Player Not Found", content = @Content)})

    @PutMapping("/{id}")
    public String modJuego(@PathVariable("id") Integer idjugador, @RequestBody Jugadores newJugador) {
        Optional<Jugadores> old = jugadoresRepository.findById(idjugador);
        if (!old.isPresent()) {
            return "Player Not Found";
        } else {
            newJugador.setCodJugador(idjugador);
            this.jugadoresRepository.save(newJugador);
            return "Juego modificado correctamente";
        }
    }

}
