<%-- 
    Document   : form
    Created on : 20-nov-2018, 9:59:36
    Author     : Rubzer
--%>

<%@page import="Data.StudentManager"%>
<%@page import="java.util.List"%>
<%@page import="Data.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <title>Form</title>
    </head>
    
    <%
        StudentManager studentManager = new StudentManager();
        List<Student> studentList = studentManager.getStudents();
        Student student = null;
        String action = request.getParameter("action").toString();
        String pageTitle = "";
        int id = -1;

        if(action.equals("Insert")){
            pageTitle = "Insertar estudiante";
        }
        else if(action.equals("Edit")){
            pageTitle = "Editar estudiante";
            if(request.getParameter("id")!=null)
                id = Integer.parseInt(request.getParameter("id"));

            for(int i=0; i<studentList.size(); i++){
                if(id != -1 && studentList.get(i).getId() == id)
                    student = studentList.get(i);
            }
        }
    %>
    
    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-sm-1"></div>
                <div class="col-lg-8 col-sm-10"></br><h1 class="display-5 text-center"><%out.print(pageTitle);%></h1></div>
                <div class="col-lg-2 col-sm-1"></div>
            </div>
        </div>
        <div class="container">
            <form name="myForm" method="get" action="index.jsp">  
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">
                        <div class="form-group">
                            <label>Nombre</label>
                            <%if(student == null){%>
                                <input type="text" class="form-control" name="name" placeholder="Nombre">
                            <%}
                            else{%>     
                                <input type="text" class="form-control" name="name" value="<%out.print(student.getName());%>">
                            <%}%> 
                        </div>
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">
                        <div class="form-group">
                            <label>Apellido</label>
                            <%if(student == null){%>
                                <input type="text" class="form-control" name="surname" placeholder="Apellido">
                            <%}
                            else{%>     
                                <input type="text" class="form-control" name="surname" value="<%out.print(student.getSurname());%>">
                            <%}%>   
                        </div>
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">    
                        <div class="form-group">
                            <label>Edad</label>
                            <%if(student == null){%>
                                <input type="text" class="form-control" name="age" placeholder="Edad">
                            <%}
                            else{%>     
                                <input type="text" class="form-control" name="age" value="<%out.print(student.getAge());%>">
                            <%}%>   
                        </div>
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">  
                        <div class="form-group">
                            <label>Dirección</label>
                            <%if(student == null){%>
                                <input type="text" class="form-control" name="address" placeholder="Dirección">
                            <%}
                            else{%>     
                                <input type="text" class="form-control" name="address" value="<%out.print(student.getAddress());%>">
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">  
                        <div class="form-group">
                            <label>Curso</label>
                            <%if(student == null){%>
                                <input type="text" class="form-control" name="course" placeholder="Curso">
                            <%}
                            else{%>     
                                <input type="text" class="form-control" name="course" value="<%out.print(student.getCourse());%>">
                            <%}%>
                        </div>
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">  
                        <div class="form-group">
                            <label>Datos familiares</label>
                            <%if(student == null)   {%>
                                <textarea rows="3" class="form-control" placeholder="Información familiar" name="familyData"></textarea>
                            <%}
                            else{%>     
                                <input type="text" class="form-control" name="familyData" value="<%out.print(student.getFamilyData());%>">
                            <%}%>   
                        </div>
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                        
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10">  
                        <%if(student == null || !student.isConsent()){%>
                            Consentimiento para fotografías <input type="checkbox" name="consent">
                        <%}
                        else {%>
                            Consentimiento para fotografías <input type="checkbox" name="consent" checked>
                        <%}%> 
                        
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>
                
                <div class="row">
                    <div class="form-group col-lg-2 col-sm-1"></div>
                    <div class="col-lg-8 col-sm-10"> </br>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Validar</button>
                        <input type="hidden" name="action" value="<%out.print(action);%>">
                        <input type="hidden" name="id" value="<%out.print(id);%>"
                    </div>
                    <div class="form-group col-lg-2 col-sm-1"></div>
                </div>                
            </form>
        </div>
    </body>
</html>
