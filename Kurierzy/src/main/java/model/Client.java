/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Class is the java bean type - has all getters and setters
 *
 * @author Przemek
 */
// Entity informuje, ze jest to encja, automatycznie przy starcie aplikacji
// tworzona jest tabela w bazie (chyba, że już taka istnieje )
@Entity
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @NotEmpty
    @Email
    @Column(unique = true)
    private String email;

    private Integer enabled=1;

    @NotEmpty
    @Size(max = 15, min = 3)
    private String name;

    @NotEmpty
    private String password;

    @NotEmpty
    @Size(max = 25, min = 3)
    private String surname;

    @NotEmpty
    private String address;

    @Size(max = 15, min = 5)
    @NotEmpty
    private String phoneNumber;

    @ManyToOne
    @JoinColumn(name = "city_id")
    private City city = new City();

    @OneToMany(mappedBy = "client")
    private List<Request> requests = new ArrayList<Request>(0);
    
    public List<Request> getRequests() {
        return requests;
    }

    public void setRequests(List<Request> requests) {
        this.requests = requests;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String adress) {
        this.address = adress;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Client{" + "id=" + id + ", name=" + name + ", surname=" + surname + ", adress=" + address + ", email=" + email + ", phoneNumber=" + phoneNumber + '}';
    }

}
