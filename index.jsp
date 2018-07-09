<%-- 
    Document   : index
    Created on : 04.Tem.2018, 10:26:51
    Author     : zeynep atlı
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Form</title>
    </head>
    <body>
        <h1>Login Forms</h1>
        
        <form name="form" action="text_al.jsp" method="POST">
            <table border="1">
                <tbody>
                    <tr>
                        <td>İsim:</td>
                        <td><input type="text" name="isim" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Soyisim:</td>
                        <td><input type="text" name="soyisim" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Bölüm:</td>
                        <td><input type="text" name="bolum" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>İl:</td>
                        <td><input type="text" name="il" value="" size="50" /></td> 
                    </tr>
                    <tr>
                        <td>Cinsiyet:</td>
                        <td><select name="cinsiyet">
                                <option>Kadın</option>
                                <option>Erkek</option>
                            </select></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="temizle" name="temizle" />
            <input type="submit" value="kaydet" name="kaydet" />
        </form>
    </body>
</html>
