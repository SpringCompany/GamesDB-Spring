package repository;


import entity.Jugadores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JugadoresAPI extends JpaRepository<Jugadores, Integer> {
    List<Jugadores> findJugadoresByEdadGreaterThan(int edad);

    List<Jugadores> findJugadoresByNombreEquals(String name);
}
