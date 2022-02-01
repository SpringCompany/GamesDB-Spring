package entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Companies {
    private Integer codCompany;
    private String nombre;
    private String nacionalidad;
    private Collection<Juegos> juegosByCodCompany;
    private Collection<Juegos> juegosByCodCompany_0;

    @Id
    @Column(name = "cod_company", nullable = false)
    public Integer getCodCompany() {
        return codCompany;
    }

    public void setCodCompany(Integer codCompany) {
        this.codCompany = codCompany;
    }

    @Basic
    @Column(name = "nombre", nullable = false, length = 50)
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "nacionalidad", nullable = false, length = 50)
    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Companies companies = (Companies) o;
        return Objects.equals(codCompany, companies.codCompany) && Objects.equals(nombre, companies.nombre) && Objects.equals(nacionalidad, companies.nacionalidad);
    }

    @Override
    public int hashCode() {
        return Objects.hash(codCompany, nombre, nacionalidad);
    }

    @JsonIgnore
    @OneToMany(mappedBy = "companiesByDesarrolladora")
    public Collection<Juegos> getJuegosByCodCompany() {
        return juegosByCodCompany;
    }

    public void setJuegosByCodCompany(Collection<Juegos> juegosByCodCompany) {
        this.juegosByCodCompany = juegosByCodCompany;
    }

    @JsonIgnore
    @OneToMany(mappedBy = "companiesByDistribuidora")
    public Collection<Juegos> getJuegosByCodCompany_0() {
        return juegosByCodCompany_0;
    }

    public void setJuegosByCodCompany_0(Collection<Juegos> juegosByCodCompany_0) {
        this.juegosByCodCompany_0 = juegosByCodCompany_0;
    }
}
