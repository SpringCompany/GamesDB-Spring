package repository;


import entity.Jugadores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JugadoresAPI extends JpaRepository<Jugadores, Integer> {

}
