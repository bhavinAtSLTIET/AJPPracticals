package Practical1;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

/**
 * WAP that will take fnm,snm,email from user. Store that data into DB and
 * display data from DB
 *
 * @author Bhavin Vasara
 */
public class Practical1 {

    Connection con;
    Statement stmt;
    ResultSet rs;

    public Practical1() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practical", "root", "");
    }

    public void insertData(String fname, String sname, String email) throws SQLException {
        stmt = con.createStatement();
        String query = String.format("INSERT INTO users VALUES(null, '%s', '%s', '%s')",
                fname, sname, email);
        if (stmt.executeUpdate(query) > 0) {
            System.out.println("Inserted Successfully!");
        } else {
            System.out.println("Data not inserted!");
        }
        stmt.close();
    }

    public void printData() throws SQLException {
        stmt = con.createStatement();
        stmt.execute("SELECT * FROM users");
        rs = stmt.getResultSet();
        System.out.println("Displaying table data!");
        System.out.println("id | fname | sname | email");
        System.out.println("----------------------------------");

        while (rs.next()) {
            System.out.printf("%d | %s | %s | %s %n",
                    rs.getInt("id"),
                    rs.getString("fname"),
                    rs.getString("sname"),
                    rs.getString("email"));
            System.out.println("----------------------------------");
        }
        stmt.close();
        rs.close();
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Scanner sc = new Scanner(System.in);
        Practical1 pr1 = new Practical1();

        System.out.print("Enter fname: ");
        String fname = sc.next();
        System.out.print("Enter sname: ");
        String sname = sc.next();
        System.out.print("Enter email: ");
        String email = sc.next();

        pr1.insertData(fname, sname, email);
        pr1.printData();
        sc.close();
    }
}
