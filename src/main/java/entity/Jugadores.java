package entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Jugadores {
    private Integer codJugador;
    private String avatar;
    private String nombre;
    private String correo;
    private Integer edad;
    private Collection<JugadoresJuegos> jugadoresJuegosByCodJugador;

    public Jugadores(String avatar, String nombre, String correo, Integer edad) {
        this.avatar = avatar;
        this.nombre = nombre;
        this.correo = correo;
        this.edad = edad;
    }

    public Jugadores() {

    }

    @Id
    @Column(name = "cod_jugador", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getCodJugador() {
        return codJugador;
    }

    public void setCodJugador(Integer codJugador) {
        this.codJugador = codJugador;
    }

    @Basic
    @Column(name = "avatar", nullable = false, length = 100)
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Basic
    @Column(name = "nombre", nullable = false, length = 30)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "correo", nullable = false, length = 30)
    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Basic
    @Column(name = "edad", nullable = false)
    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Jugadores jugadores = (Jugadores) o;
        return Objects.equals(codJugador, jugadores.codJugador) && Objects.equals(avatar, jugadores.avatar) && Objects.equals(nombre, jugadores.nombre) && Objects.equals(correo, jugadores.correo) && Objects.equals(edad, jugadores.edad);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codJugador, avatar, nombre, correo, edad);
    }

    @JsonIgnore
    @OneToMany(mappedBy = "jugadoresByCodJugador")
    public Collection<JugadoresJuegos> getJugadoresJuegosByCodJugador() {
        return jugadoresJuegosByCodJugador;
    }

    public void setJugadoresJuegosByCodJugador(Collection<JugadoresJuegos> jugadoresJuegosByCodJugador) {
        this.jugadoresJuegosByCodJugador = jugadoresJuegosByCodJugador;
    }
}
