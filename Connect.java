import java.sql.*;
import java.util.*;

public class Connect {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String empname, designation;
        int empno, age, salary, choice;

        try {
            // JDBC Driver and Connection Setup
            String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
            Class.forName(DRIVER_CLASS);

            String DB_URL = "jdbc:mysql://172.23.128.188:3306/student1"; // your database name
            String UID = "root";
            String PWD = "admin123";

            Connection conn = DriverManager.getConnection(DB_URL, UID, PWD);
            Statement stmt = conn.createStatement();

            do {
                System.out.println("\n~~~~~ OPERATIONS ~~~~~");
                System.out.println("1. INSERT NEW ENTRY IN THE DATABASE");
                System.out.println("2. UPDATE SOME VALUE");
                System.out.println("3. DISPLAY ALL RECORDS");
                System.out.println("4. DELETE A RECORD");
                System.out.println("5. EXIT");
                System.out.print("ENTER YOUR OPTION: ");
                choice = sc.nextInt();
                sc.nextLine(); // consume newline

                switch (choice) {
                    case 1:
                        System.out.println("\n--- INSERT NEW RECORD ---");
                        System.out.print("Enter Employee No: ");
                        empno = sc.nextInt();
                        sc.nextLine();
                        System.out.print("Enter Employee Name: ");
                        empname = sc.nextLine();
                        System.out.print("Enter Designation: ");
                        designation = sc.nextLine();
                        System.out.print("Enter Age: ");
                        age = sc.nextInt();
                        System.out.print("Enter Salary: ");
                        salary = sc.nextInt();

                        String insertSQL = "INSERT INTO employee VALUES (" + empno + ", '" + empname + "', '" + designation + "', " + age + ", " + salary + ")";
                        stmt.executeUpdate(insertSQL);
                        System.out.println("Record inserted successfully!");
                        break;

                    case 2:
                        System.out.println("\n--- UPDATE RECORD ---");
                        System.out.print("Enter Employee No to Update: ");
                        empno = sc.nextInt();
                        sc.nextLine();
                        System.out.print("Enter new Designation: ");
                        designation = sc.nextLine();
                        System.out.print("Enter new Salary: ");
                        salary = sc.nextInt();

                        String updateSQL = "UPDATE employee SET designation='" + designation + "', salary=" + salary + " WHERE empno=" + empno;
                        int rowsUpdated = stmt.executeUpdate(updateSQL);
                        if (rowsUpdated > 0)
                            System.out.println("Record updated successfully!");
                        else
                            System.out.println("No record found with that Employee No.");
                        break;

                    case 3:
                        System.out.println("\n--- DISPLAY ALL RECORDS ---");
                        ResultSet rs = stmt.executeQuery("SELECT * FROM employee");
                        System.out.println("EmpNo\tName\tDesignation\tAge\tSalary");
                        System.out.println("---------------------------------------------------");
                        while (rs.next()) {
                            System.out.println(rs.getInt("empno") + "\t" + rs.getString("empname") + "\t" +
                                    rs.getString("designation") + "\t" + rs.getInt("age") + "\t" +
                                    rs.getInt("salary"));
                        }
                        break;

                    case 4:
                        System.out.println("\n--- DELETE RECORD ---");
                        System.out.print("Enter Employee No to Delete: ");
                        empno = sc.nextInt();
                        String deleteSQL = "DELETE FROM employee WHERE empno=" + empno;
                        int rowsDeleted = stmt.executeUpdate(deleteSQL);
                        if (rowsDeleted > 0)
                            System.out.println("Record deleted successfully!");
                        else
                            System.out.println("No record found with that Employee No.");
                        break;

                    case 5:
                        System.out.println("Exiting program...");
                        break;

                    default:
                        System.out.println("Invalid choice!");
                }
            } while (choice != 5);

            stmt.close();
            conn.close();
            sc.close();

        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
