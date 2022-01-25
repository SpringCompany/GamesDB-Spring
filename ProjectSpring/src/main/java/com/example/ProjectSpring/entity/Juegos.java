package com.example.ProjectSpring.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Juegos {
    private Integer codJuego;
    private String nombre;
    private Date fechaLanzamiento;
    private Double precio;
    private Integer pegi;
    private String portada;
    private Generos generosByGenero;
    private Companies companiesByDesarrolladora;
    private Companies companiesByDistribuidora;
    private Collection<JugadoresJuegos> jugadoresJuegosByCodJuego;

    @Id
    @Column(name = "cod_juego", nullable = false)
    public Integer getCodJuego() {
        return codJuego;
    }

    public void setCodJuego(Integer codJuego) {
        this.codJuego = codJuego;
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
    @Column(name = "fecha_lanzamiento", nullable = false)
    public Date getFechaLanzamiento() {
        return fechaLanzamiento;
    }

    public void setFechaLanzamiento(Date fechaLanzamiento) {
        this.fechaLanzamiento = fechaLanzamiento;
    }

    @Basic
    @Column(name = "precio", nullable = false, precision = 0)
    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    @Basic
    @Column(name = "pegi", nullable = false)
    public Integer getPegi() {
        return pegi;
    }

    public void setPegi(Integer pegi) {
        this.pegi = pegi;
    }

    @Basic
    @Column(name = "portada", nullable = false, length = 100)
    public String getPortada() {
        return portada;
    }

    public void setPortada(String portada) {
        this.portada = portada;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Juegos juegos = (Juegos) o;
        return Objects.equals(codJuego, juegos.codJuego) && Objects.equals(nombre, juegos.nombre) && Objects.equals(fechaLanzamiento, juegos.fechaLanzamiento) && Objects.equals(precio, juegos.precio) && Objects.equals(pegi, juegos.pegi) && Objects.equals(portada, juegos.portada);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codJuego, nombre, fechaLanzamiento, precio, pegi, portada);
    }

    @ManyToOne
    @JoinColumn(name = "genero", referencedColumnName = "cod_genero", nullable = false)
    public Generos getGenerosByGenero() {
        return generosByGenero;
    }

    public void setGenerosByGenero(Generos generosByGenero) {
        this.generosByGenero = generosByGenero;
    }

    @ManyToOne
    @JoinColumn(name = "desarrolladora", referencedColumnName = "cod_company", nullable = false)
    public Companies getCompaniesByDesarrolladora() {
        return companiesByDesarrolladora;
    }

    public void setCompaniesByDesarrolladora(Companies companiesByDesarrolladora) {
        this.companiesByDesarrolladora = companiesByDesarrolladora;
    }

    @ManyToOne
    @JoinColumn(name = "distribuidora", referencedColumnName = "cod_company", nullable = false)
    public Companies getCompaniesByDistribuidora() {
        return companiesByDistribuidora;
    }

    public void setCompaniesByDistribuidora(Companies companiesByDistribuidora) {
        this.companiesByDistribuidora = companiesByDistribuidora;
    }

    @OneToMany(mappedBy = "juegosByCodJuego")
    public Collection<JugadoresJuegos> getJugadoresJuegosByCodJuego() {
        return jugadoresJuegosByCodJuego;
    }

    public void setJugadoresJuegosByCodJuego(Collection<JugadoresJuegos> jugadoresJuegosByCodJuego) {
        this.jugadoresJuegosByCodJuego = jugadoresJuegosByCodJuego;
    }
}
