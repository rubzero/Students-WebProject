package Data;

/**
 * @author Rubzer
 */

public class Student {
    
    private String name, surname, address, familyData;
    private int id, age, course;
    private boolean consent;
    
    public Student(String name, String surname, int age, String address
            , int course, String familyData, boolean consent, int id){
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.course = course;
        this.familyData = familyData;
        this.age = age;
        this.id = id;
        this.consent = consent;
    }
    
    public Student(String name, String surname, int age, String address
            , int course, String familyData, boolean consent){
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.course = course;
        this.familyData = familyData;
        this.age = age;
        this.consent = consent;
    }
    
    public Student(String name, String surname, int age){
        this.name = name;
        this.surname = surname;
        this.age = age;
    }
    
    public Student(){
        
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
    }

    public String getFamilyData() {
        return familyData;
    }

    public void setFamilyData(String familyData) {
        this.familyData = familyData;
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

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isConsent() {
        return consent;
    }

    public void setConsent(boolean consent) {
        this.consent = consent;
    }
    
}
