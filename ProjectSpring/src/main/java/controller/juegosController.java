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
public class juegosController {
    @Autowired
    JuegosRepository juegosRepository;

    //devolver todos los juegos -> //http://localhost:8080/Juegos
    @GetMapping
    public List<Juegos> devolverJuegosNombrePrecioDesc(@RequestParam(value = "nombre", required = false) String nombre, @RequestParam(value = "precio", required = false) Double precio) {
        if(precio == null && nombre != null){
            return juegosRepository.findJuegosByNombreOrderByCodJuegoAsc(nombre);
        }else if(precio != null && nombre == null){
            return juegosRepository.findJuegosByPrecioOrderByCodJuegoAsc(precio);
        }else if(nombre != null && precio != null) {
            return juegosRepository.findAllByNombreAndPrecioGreaterThanOrderByPrecioDesc(nombre, precio);
        }else{
            return juegosRepository.findAll();
        }
    }

    //devolver todos los juegos con un identificador-> //http://localhost:8080/Juegos{CodJuego}
    @GetMapping("/{CodJuego}")
    public Juegos devolverJuegosCodigo(@PathVariable("CodJuego") int idJuego) {
        return juegosRepository.findJuegosByCodJuegoOrderByCodJuegoAsc(idJuego);
    }

    //insertar un juego nuevo
    @PostMapping
    public Integer insertarJuego(@RequestBody Juegos newJuego) {
        Juegos saveJuego = this.juegosRepository.save(newJuego);
        return saveJuego.getCodJuego();
    }

    //borrar un juego
    @DeleteMapping("/{CodJuego}")
    public ResponseEntity<ErrorException> deleteJuego(@PathVariable("CodJuego") int idJuego) {
        Optional<Juegos> delJuego = this.juegosRepository.findById(idJuego);
        if (!delJuego.isPresent()) {
            return new ResponseEntity<ErrorException>(new ErrorException("Error al borrar", idJuego), HttpStatus.NOT_FOUND);
        }
        this.juegosRepository.deleteById(idJuego);
        return new ResponseEntity<ErrorException>(new ErrorException("Se ha borrado correctamente", idJuego), HttpStatus.OK);
    }

    //modificar un juego
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
