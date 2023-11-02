import java.sql.*;

public class cosc_304_midterm2 {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/workson";
        String uid = "testuser";
        String pw = "304testpw";

        try (
        Connection con = DriverManager.getConnection(url, uid, pw);
        Statement stmt = con.createStatement();
        ) {
            // get list of projects
            String getProjectsQuery = "SELECT proj.pno, pname, count(emp.eno) as numEmployees, sum(hours) as totalHours, sum(salary)/count(salary) as avgSalary FROM proj LEFT JOIN workson ON proj.pno = workson.pno LEFT JOIN emp ON workson.eno = emp.eno GROUP BY proj.pno ORDER BY totalHours DESC";
            ResultSet projects = stmt.executeQuery(getProjectsQuery);

            


            // list each project and for each project, write details about that project
            while (projects.next()) {
                // output project name, number, number of employees, total hours, average salary
                // including projects with no employees
                // order by total hours descending
                String currentProj = projects.getString("pno");
                System.out.print(
                    currentProj + "\t" +
                    projects.getString("pname") + "\t" +
                    projects.getInt("numEmployees") + "\t" +
                    projects.getInt("totalHours") + "\t" +
                    projects.getDouble("avgSalary") + "\n"
                    );

                //get details for each project
                // list employee number, name, salary, birthdate
                // order by salary descending
                String getProjectDetailsQuery = (
                    "SELECT emp.eno, ename, salary, bdate FROM emp RIGHT JOIN workson ON emp.eno = workson.eno WHERE pno = '" + currentProj + "'"
                    );
                ResultSet projectDetails = stmt.executeQuery(getProjectDetailsQuery);
                while (projectDetails.next()) {
                    System.out.print(
                    projectDetails.getString("eno") + "\t" +
                    projectDetails.getString("ename") + "\t" +
                    projectDetails.getDouble("salary") + "\t" +
                    projectDetails.getString("bdate") + "\n"
                    );
                } 
            }

        } catch (SQLException ex) {
            System.err.println("SQLException: " + ex);
            // try with resources automatically closes connection if exception caught
        }
    }
}
