package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class JugadoresJuegosPK implements Serializable {
    private Integer codJugador;
    private Integer codJuego;

    @Column(name = "cod_jugador", nullable = false)
    @Id
    public Integer getCodJugador() {
        return codJugador;
    }

    public void setCodJugador(Integer codJugador) {
        this.codJugador = codJugador;
    }

    @Column(name = "cod_juego", nullable = false)
    @Id
    public Integer getCodJuego() {
        return codJuego;
    }

    public void setCodJuego(Integer codJuego) {
        this.codJuego = codJuego;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        JugadoresJuegosPK that = (JugadoresJuegosPK) o;
        return Objects.equals(codJugador, that.codJugador) && Objects.equals(codJuego, that.codJuego);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codJugador, codJuego);
    }
}
