/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package tp.Java_BOURLETTE_Timothe;

import static java.lang.System.exit;
import java.sql.DriverManager;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JTextField;
import javax.swing.*;


public class Model {
    
    public Connection seConnecter(String url,String user,String password) throws SQLException {
        Connection conn=null;
        try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
        }
        catch (ClassNotFoundException e){
                System.out.println("Erreur lors du chargement"+e.getMessage());
                exit(0);
        }
        return conn;
    }
    public ResultSet traiterRequete(String req) throws SQLException{
        Statement stmt=null;
        Connection connexion=null;
        ResultSet result=null;
        
        try{
            String url = "http://localhost/phpmyadmin/index.php?route=/database/structure&server=1&db=bdd_partiel";
            String user= "Tim_BOU";
            String password ="BOU_Tim";
            connexion = this.seConnecter(url, user, password);
            stmt = (Statement) connexion.createStatement();
            result = stmt.executeQuery(req);
        }
        catch (SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
    
    public void remplirCombo(JComboBox<String> comb ,String req) throws SQLException{
        try{
            ResultSet rst = traiterRequete(req);
            while (rst.next()){
                String champ = rst.getString(1);
                comb.addItem(champ);
            }
        }
        catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        
    }
    public void remplirCombo3(JComboBox<String> combo ,String req) throws SQLException{
        Statement stmt =null;
        Connection connexion=null;
        
        try{
            String url = "jdbc:mysql://localhost:3306/tp_interface";
            String user = "root";
            String password = "";
            
            connexion = this.seConnecter(url, user, password);
            stmt= (Statement) connexion.createStatement();
            ResultSet result = stmt.executeQuery(req);
            
            while (result.next()){
                combo.addItem(result.getString(1));
            }
            connexion.close();
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
    }
    
    
    public int verifLogin(String req) throws SQLException{
        Statement stmt = null;
        Connection connexion = null;
        int nombre=0;
        try{
            String url = "jdbc:mysql://localhost:3306/concours";
            String user = "root";
            String password ="";
            connexion = this.seConnecter(url, user, password);
            stmt = (Statement) connexion.createStatement();
            ResultSet result = stmt.executeQuery(req);
            
            while (result.next()){
                nombre = result.getInt(1);
            }
        }
        catch (SQLException e){
            System.out.println("Connection error");
        }
        return nombre;
        
    }
    
}
