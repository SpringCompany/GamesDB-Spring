package controller;

import entity.Juegos;
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
import repository.JuegosRepository;

import java.awt.print.Book;
import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("Juegos") //http://localhost:8080/Juegos
public class JuegosController {
    @Autowired
    private JuegosRepository juegosRepository;

    //Devolver todos los juegos -> //http://localhost:8080/Juegos
    @Operation(summary = "Returns a game filtered by price and/or name or if both are null complete list")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Game Found", content = {@Content(mediaType = "application" +
            "/json", schema = @Schema(implementation = Book.class))}), @ApiResponse(responseCode = "400", description = "Invalid - " +
            "Object Game Invalid", content = @Content), @ApiResponse(responseCode = "404", description = "Game Not Found", content =
    @Content)})

    @GetMapping
    public List<Juegos> devolverJuegosNombrePrecioDesc(@RequestParam(value = "nombre", required = false) String nombre,
                                                       @RequestParam(value = "precio", required = false) Double precio) {
        if (precio == null && nombre != null) {
            return juegosRepository.findJuegosByNombreOrderByCodJuegoAsc(nombre);
        } else if (precio != null && nombre == null) {
            return juegosRepository.findJuegosByPrecioOrderByCodJuegoAsc(precio);
        } else if (nombre != null && precio != null) {
            return juegosRepository.findAllByNombreAndPrecioGreaterThanOrderByPrecioDesc(nombre, precio);
        } else {
            return juegosRepository.findAll();
        }
    }

    //Devolver juego con identificador -> //http://localhost:8080/Juegos/{CodJuego}
    @Operation(summary = "Returns a game filtered by code")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Game Found", content = {@Content(mediaType = "application" +
            "/json", schema = @Schema(implementation = Book.class))}), @ApiResponse(responseCode = "400", description = "Invalid - " +
            "Object Game Invalid", content = @Content), @ApiResponse(responseCode = "404", description = "Game Not Found", content =
    @Content)})

    @GetMapping("/{CodJuego}")
    public Optional<Juegos> devolverJuegosCodigo(@PathVariable("CodJuego") int idJuego) {
        return juegosRepository.findById(idJuego);
    }

    //insertar un juego nuevo -> http://localhost:8080/Juegos
    @Operation(summary = "Insert a Game")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Game Inserted", content = {@Content(mediaType = "application" +
            "/json", schema = @Schema(implementation = Book.class))}), @ApiResponse(responseCode = "400", description = "Invalid - " +
            "Object Game Invalid", content = @Content), @ApiResponse(responseCode = "404", description = "Inserted Game Not Found",
            content = @Content)})

    @PostMapping
    public Integer insertarJuego(@RequestBody Juegos newJuego) {
        Juegos saveJuego = this.juegosRepository.save(newJuego);
        return saveJuego.getCodJuego();
    }

    //borrar un juego -> http://localhost:8080/Juegos/{CodJuego}
    @Operation(summary = "Delete a Game by Code")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Game Found And " + "Deleted", content = {@Content(mediaType
            = "application/json", schema = @Schema(implementation = Book.class))}), @ApiResponse(responseCode = "400", description =
            "Invalid - Object Game Invalid", content = @Content), @ApiResponse(responseCode = "404", description = "Game Not Found",
            content = @Content)})

    @DeleteMapping("/{CodJuego}")
    public ResponseEntity<ErrorException> deleteJuego(@PathVariable("CodJuego") int idJuego) {
        Optional<Juegos> delJuego = this.juegosRepository.findById(idJuego);
        if (!delJuego.isPresent()) {
            return new ResponseEntity<ErrorException>(new ErrorException("Error al borrar", idJuego), HttpStatus.NOT_FOUND);
        }
        this.juegosRepository.deleteById(idJuego);
        return new ResponseEntity<ErrorException>(new ErrorException("Se ha borrado " + "correctamente", idJuego), HttpStatus.OK);
    }

    //modificar un juego -> http://localhost:8080/Juegos -> http://localhost:8080/Juegos/{CodJuego}
    @Operation(summary = "Updates a Game by Code")
    @ApiResponses(value = {@ApiResponse(responseCode = "200", description = "Game Found and " + "Updated", content = {@Content(mediaType
            = "application/json", schema = @Schema(implementation = Book.class))}), @ApiResponse(responseCode = "400", description =
            "Invalid - Object Game Invalid", content = @Content), @ApiResponse(responseCode = "404", description = "Game Not Found",
            content = @Content)})

    @PutMapping("/{CodJuego}")
    public String modJuego(@PathVariable("CodJuego") Integer idJuego, @RequestBody Juegos newJuego) {
        Optional<Juegos> old = juegosRepository.findById(idJuego);
        if (!old.isPresent()) {
            return "ERROR - El juego buscado no existe";
        } else {
            newJuego.setCodJuego(idJuego);
            this.juegosRepository.save(newJuego);
            return "Juego modificado correctamente";
        }
    }

}