package com.example.ProjectSpring.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "jugadores_juegos", schema = "juegos_db", catalog = "")
//@IdClass(JugadoresJuegosPK.class)
public class JugadoresJuegos implements Serializable {
    private Integer codJugador;
    private Integer codJuego;
    private Jugadores jugadoresByCodJugador;
    private Juegos juegosByCodJuego;

    @Id
    @Column(name = "cod_jugador", nullable = false)
    public Integer getCodJugador() {
        return codJugador;
    }

    public void setCodJugador(Integer codJugador) {
        this.codJugador = codJugador;
    }

    @Id
    @Column(name = "cod_juego", nullable = false)
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
        JugadoresJuegos that = (JugadoresJuegos) o;
        return Objects.equals(codJugador, that.codJugador) && Objects.equals(codJuego, that.codJuego);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codJugador, codJuego);
    }

    @ManyToOne
    @JoinColumn(name = "cod_jugador", referencedColumnName = "cod_jugador", nullable = false)
    public Jugadores getJugadoresByCodJugador() {
        return jugadoresByCodJugador;
    }

    public void setJugadoresByCodJugador(Jugadores jugadoresByCodJugador) {
        this.jugadoresByCodJugador = jugadoresByCodJugador;
    }

    @ManyToOne
    @JoinColumn(name = "cod_juego", referencedColumnName = "cod_juego", nullable = false)
    public Juegos getJuegosByCodJuego() {
        return juegosByCodJuego;
    }

    public void setJuegosByCodJuego(Juegos juegosByCodJuego) {
        this.juegosByCodJuego = juegosByCodJuego;
    }
}
