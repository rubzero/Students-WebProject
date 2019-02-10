<%-- 
    Document   : index
    Created on : 20-nov-2018, 10:01:21
    Author     : Rubzer
--%>

<%@page import="java.util.List"%>
<%@page import="Data.Student"%>
<%@page import="Data.StudentManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <title>Index</title>
    </head>
    
    <%  
        StudentManager studentManager = new StudentManager();
        Student student = null;
        String action = request.getParameter("action");
        int id = -1;
        
        if(action != null){
            id = Integer.parseInt(request.getParameter("id"));

            if(!action.equals("Delete")){
                boolean consent = false;
                if(request.getParameter("consent") != null)
                    consent = (request.getParameter("consent").equals("on")) ? true : false;
                student = new Student(request.getParameter("name")
                    , request.getParameter("surname")
                    , Integer.parseInt(request.getParameter("age"))
                    , request.getParameter("address")
                    , Integer.parseInt(request.getParameter("course"))
                    , request.getParameter("familyData")
                    , consent);
            }

            switch(action){
                case "Insert": 
                    if(studentManager.insertStudent(student)){
                    %> 
                       <div class="alert alert-success" role="alert">
                            Registro insertado <Strong>correctamente</Strong>.
                        </div>
                    <%
                    }
                    else{
                    %>
                        <div class="alert alert-danger" role="alert">
                            Ha habido un <Strong>error<Strong> de inserción.
                        </div>
                    <%
                    }
                    break;
                case "Edit": 
                    if(studentManager.updateStudent(id, student)){
                    %>
                        <div class="alert alert-success" role="alert">
                            Registro editado <Strong>correctamente<Strong>.
                        </div>
                    <%
                    }
                    else{
                    %>
                        <div class="alert alert-danger" role="alert">
                            Ha habido un <Strong>error<Strong> de inserción.
                        </div>
                    <%
                    }
                    break;
                case "Delete":
                    if(studentManager.deleteStudent(id)){
                    %>
                        <div class="alert alert-success" role="alert">
                            Registro eliminado <Strong>correctamente<Strong>.
                        </div>
                    <%
                    }
                    else{
                    %>
                        <div class="alert alert-danger" role="alert">
                            Ha habido un <Strong>error<Strong> al intentar eliminar el registro.
                        </div>
                    <%
                    }
                    break;
            }
        }

        List<Student> studentList = studentManager.getStudents();
        
    %>
    <body>
        <div class="container">
                <div class="row">
                    <div class="col-12">
                        </br><h1 class="display-5 text-center">Gestión de alumnos - IES El Rincón</h1></br>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                    <th scope="col">Edad</th>
                                    <th scope="col">Dirección</th>
                                    <th scope="col">Curso</th>
                                    <th scope="col">Datos familiares</th>
                                    <th scope="col">Consentimiento</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    
                                    for(int i=0; i<studentList.size(); i++){
                                        student = studentList.get(i);
                                        if(student!=null){
                                %>
                                    <tr>
                                        <th scope="row"><%out.print(student.getId());%></th>
                                        <td scope="row"><%out.print(student.getName());%></td>
                                        <td scope="row"><%out.print(student.getSurname());%></td>
                                        <td scope="row"><%out.print(student.getAge());%></td>
                                        <td scope="row"><%out.print(student.getAddress());%></td>
                                        <td scope="row"><%out.print(student.getCourse());%></td>
                                        <td scope="row"><%out.print(student.getFamilyData());%></td>

                                        <td scope="row"><%if(student.isConsent())out.print("Sí"); else out.print("No");%></td>
                                        <td scope="row">
                                            <form name="editButtonForm" method="post" action="form.jsp">
                                                <input type="hidden" name="action" value="Edit">
                                                <input type="hidden" name="id" value="<%out.print(student.getId());%>">
                                                <button type="submit" class="btn btn-warning" name="btnEdit">Editar</button>
                                            </form>
                                        </td>
                                        <td scope="row">
                                            <form name="deleteButtonForm" method="post" action="index.jsp">
                                                <input type="hidden" name="action" value="Delete">
                                                <input type="hidden" name="id" value="<%out.print(student.getId());%>">
                                                <button type="submit" class="btn btn-danger" name="btnDelete">Eliminar</button>
                                            </form>
                                        </td>
                                    </tr>
                                <%}
                                        else continue;
                                    }%>
                                    <tr>
                                        <td colspan="10">
                                            <form name="insertButtonForm" method="post" action="form.jsp">
                                                <input type="hidden" name="action" value="Insert">
                                                <button type="submit" class="btn btn-success btn-lg btn-block" name="btnInsert">Insertar</button>
                                            </form></td>
                                    </tr>
                            </tbody>
                        </table>   
                    </div>
            </div>
        </div>
    </body>
</html>
