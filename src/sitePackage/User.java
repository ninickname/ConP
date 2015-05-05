package sitePackage;

public class User {

    private long id;
    private String username;
    private String salt;// salt is used to encrypt the password and it is random and inividual for each user
    private String password;

    private String firstName;
    private String lastName;
    private String email;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setUserName(String username) {

        this.username = username;
    }

    public long getId() {

        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    private String role;
    public boolean valid;

    public String getUserName() {
        return username;
    }


    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getSalt() {
        return salt;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String newPassword) {
        password = newPassword;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String newLastName) {
        lastName = newLastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean newValid) {
        valid = newValid;
    }

}
