package com.example.ProjectSpring.entity;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Generos {
    private Integer codGenero;
    private String nombre;
    private Collection<Juegos> juegosByCodGenero;

    @Id
    @Column(name = "cod_genero", nullable = false)
    public Integer getCodGenero() {
        return codGenero;
    }

    public void setCodGenero(Integer codGenero) {
        this.codGenero = codGenero;
    }

    @Basic
    @Column(name = "nombre", nullable = false, length = 30)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Generos generos = (Generos) o;
        return Objects.equals(codGenero, generos.codGenero) && Objects.equals(nombre, generos.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codGenero, nombre);
    }

    @OneToMany(mappedBy = "generosByGenero")
    public Collection<Juegos> getJuegosByCodGenero() {
        return juegosByCodGenero;
    }

    public void setJuegosByCodGenero(Collection<Juegos> juegosByCodGenero) {
        this.juegosByCodGenero = juegosByCodGenero;
    }
}
