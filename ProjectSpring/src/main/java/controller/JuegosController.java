package controller;

import entity.Juegos;
import exception.ErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import repository.JuegosRepository;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/juegos") //http://localhost:8080/Juegos
public class JuegosController {
    @Autowired
    JuegosRepository juegosRepository;

    //devolver todos los juegos -> //http://localhost:8080/Juegos
    @GetMapping
    public List<Juegos> devolverJuegosNombrePrecioDesc(@RequestParam(value = "nombre", required = false) String nombre, @RequestParam(value = "precio", required = false) Double precio) {
        if (precio == null && nombre != null) {
            return juegosRepository.findJuegosByNombreOrderByCodJuegoAsc(nombre);
        } else if (precio != null && nombre == null) {
            /* TODO: esto devuelve los juegos que tengan el mismo precio que el pasado por parametro,
             *  En vez de aquellos juegos con el precio mayor al pasado por parametro. */
            return juegosRepository.findJuegosByPrecioOrderByCodJuegoAsc(precio);
        } else if (nombre != null && precio != null) {
            return juegosRepository.findAllByNombreAndPrecioGreaterThanOrderByPrecioDesc(nombre, precio);
        } else {
            return juegosRepository.findAll();
        }
    }

    //Devolver juego con id-> //http://localhost:8080/Juegos/{CodJuego}
    @GetMapping("/{CodJuego}")
    public ResponseEntity devolverJuegosCodigo(@PathVariable("CodJuego") int idJuego) {
        Optional<Juegos> juego = juegosRepository.findById(idJuego);
        if (juego.isEmpty()) {
            return new ResponseEntity("juego no encontrado", HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity(juego.get(), HttpStatus.OK);
        }
    }

    //insertar un juego nuevo -> //http://localhost:8080/Juegos
    @PostMapping
    public Integer insertarJuego(@RequestBody Juegos newJuego) {
        Juegos saveJuego = this.juegosRepository.save(newJuego);
        return saveJuego.getCodJuego();
    }

    //borrar un juego -> //http://localhost:8080/Juegos/{CodJuego}
    @DeleteMapping("/{CodJuego}")
    public ResponseEntity<ErrorException> deleteJuego(@PathVariable("CodJuego") int idJuego) {
        Optional<Juegos> delJuego = this.juegosRepository.findById(idJuego);
        if (!delJuego.isPresent()) {
            return new ResponseEntity<ErrorException>(new ErrorException("Error al borrar", idJuego), HttpStatus.NOT_FOUND);
        }
        this.juegosRepository.deleteById(idJuego);
        return new ResponseEntity<ErrorException>(new ErrorException("Se ha borrado correctamente", idJuego), HttpStatus.OK);
    }

    //modificar un juego -> //http://localhost:8080/Juegos/{CodJuego}
    @PutMapping("/{CodJuego}")
    public String modJuego(@PathVariable("CodJuego") Integer idJuego, @RequestBody Juegos newJuego) {
        Optional<Juegos> old = juegosRepository.findById(idJuego);
        if (old.isEmpty()) {
            return "ERROR - El juego buscado no existe";
        } else {
            newJuego.setCodJuego(idJuego);
            this.juegosRepository.save(newJuego);
            return "Juego modificado correctamente";
        }
    }

}
