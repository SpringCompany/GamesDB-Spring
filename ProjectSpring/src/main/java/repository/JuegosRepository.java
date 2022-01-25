package repository;
import entity.Juegos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface JuegosRepository extends JpaRepository<Juegos, Integer> {
    List<Juegos> findAllByNombreAndPrecioGreaterThanOrderByPrecioDesc(String nombre, double precio);
    List<Juegos> findJuegosByNombreOrderByCodJuegoAsc(String nombre);
    List<Juegos> findJuegosByPrecioOrderByCodJuegoAsc(double precio);
    Juegos findJuegosByCodJuegoOrderByCodJuegoAsc(int codigo);
}
