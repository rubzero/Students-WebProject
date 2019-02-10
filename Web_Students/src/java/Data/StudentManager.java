package Data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Connection.MyConnection;

/**
 * @author Rubzer
 */

public class StudentManager {
    
    private final Connection connection;
    
    public StudentManager(){
        this.connection = new MyConnection().getConnection();
    }
    
    public boolean insertStudent(Student student){
        try{
            String sql = "insert into students (name, surname, age, address"
                    + ", course, familyData, consent) values (?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getSurname());
            preparedStatement.setInt(3, student.getAge());
            preparedStatement.setString(4, student.getAddress());           
            preparedStatement.setInt(5, student.getCourse());
            preparedStatement.setString(6, student.getFamilyData());
            preparedStatement.setBoolean(7, student.isConsent());
            return preparedStatement.executeUpdate() == 1;
        }
        catch(SQLException e){
            System.out.println("Error trying to insert new Student");
            return false;
        }
    }
    
    public boolean updateStudent(int id, Student student){
        try{
            String sql = "update students set name = ?"
                            + ", surname = ?, course = ?, address = ?, "
                            + "familyData = ?, age = ?, consent = ? where id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setString(2, student.getSurname());
            preparedStatement.setInt(3, student.getCourse());
            preparedStatement.setString(4, student.getAddress());
            preparedStatement.setString(5, student.getFamilyData());
            preparedStatement.setInt(6, student.getAge());
            preparedStatement.setBoolean(7, student.isConsent());
            preparedStatement.setInt(8, id);
            return preparedStatement.executeUpdate() == 1;
        }
        catch(SQLException e){
            System.out.println("Error trying to update student. "
                    + "\nStudent ID: "+student.getId());
            return false;
        }
    }
    
    public boolean deleteStudent(int id){
        try{
            String sql = "delete from students where id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate() == 1;
        }
        catch(SQLException e){
            System.out.println("Error trying to delete student. "
                    + "\nStudent ID: "+id);
            return false;
        }
    }
    
    public Student getStudent(int id){
        Student student = new Student();
        try{
            String sql = "select * from students where id=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.first();
            
            student.setId(resultSet.getInt("id"));
            student.setName(resultSet.getString("name"));
            student.setSurname(resultSet.getString("surname"));
            student.setCourse(resultSet.getInt("course"));
            student.setAddress(resultSet.getString("address"));
            student.setFamilyData(resultSet.getString("familyData"));
            student.setAge(resultSet.getInt("age"));
            student.setConsent(resultSet.getBoolean("consent"));
            return student;
        }
        catch(SQLException e){
            System.out.println("Error trying to get Student.\nID: "+id);
            return null;
        }
    }
    
    public List<Student> getStudents(){
        ArrayList<Student> students = new ArrayList<>();
        try{
            String sql = "select * from students";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Student student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setSurname(resultSet.getString("surname"));
                student.setCourse(resultSet.getInt("course"));
                student.setAddress(resultSet.getString("address"));
                student.setFamilyData(resultSet.getString("familyData"));
                student.setAge(resultSet.getInt("age"));
                student.setConsent(resultSet.getBoolean("consent"));
                students.add(student);
            }
            return students;
        }
        catch(SQLException e){
            System.out.println("Error getting all students.");
            return null;
        }
    }
    
    public void closeConnection(){
        try{
            connection.close();
        }
        catch(SQLException e){
            System.out.println("Error trying to close connection.");
        }
    }
}
