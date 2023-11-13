package ra.academy.model;

import java.time.LocalDate;
import java.util.Date;

public class Customer {
    private long id;
    private String name;
    private String email;
    private String phone;
    private boolean gen;
    private Date birthday;
    private String bios;
    private String imageUrl;
    public Customer() {
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Customer(long id, String name, String email, String phone, boolean gen, Date birthday, String bios, String imageUrl) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.gen = gen;
        this.birthday = birthday;
        this.bios = bios;
        this.imageUrl = imageUrl;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGen() {
        return gen;
    }

    public void setGen(boolean gen) {
        this.gen = gen;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getBios() {
        return bios;
    }

    public void setBios(String bios) {
        this.bios = bios;
    }
}
