package repository;

import entity.Jugadores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JugadoresRepository extends JpaRepository<Jugadores, Integer> {
    List<Jugadores> findAllByEdadGreaterThanOrderByCodJugador(int edad);
}
