import java.sql.*;

public class cosc304final {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost/workson";
        String uid = "testuser";
        String pw = "304testpw";

        try (
        Connection con = DriverManager.getConnection(url, uid, pw);
        Statement stmt = con.createStatement();
        ) {
            // get list of depts
            String getDeptsQuery = "SELECT dept.dno, dept.dname, count(eno) as numEmp, sum(salary) as totalSalaries, avg(salary) as avgSalary FROM dept RIGHT JOIN emp ON emp.dno = dept.dno GROUP BY dept.dno, dept.dname ORDER BY numEmp DESC;";
            ResultSet depts = stmt.executeQuery(getDeptsQuery);
            
            // list each dept and for each project, write details about that dept
            Statement stmt2 = con.createStatement();
            while (depts.next()) {
                // output dept number, name, number of employees, totalsalaries, averagesalary
                // including null departments
                // order by number of employees desc
                String currentDept = depts.getString("dno");
                Double avgSalary = depts.getDouble("avgSalary");

                System.out.print(
                    "Department: " + currentDept + " " + depts.getString("dname") + " " +
                    "numEmp: " + depts.getInt("numEmp") + " " +
                    "Total salaries: " + depts.getInt("totalSalaries") + " " +
                    "Avg salary: " + depts.getDouble("avgSalary") + "\n"
                    );

                //get details for each dept about employees
                String getDeptDetailsQuery;
                if (currentDept == null) {
                    getDeptDetailsQuery = (
                    // list employee number, name, salary
                    "SELECT eno, ename, salary FROM emp WHERE salary < " + avgSalary + " AND dno IS NULL"
                    );
                } else {
                    getDeptDetailsQuery = (
                    // list employee number, name, salary
                    "SELECT eno, ename, salary FROM emp WHERE salary < " + avgSalary + " AND dno = '" + currentDept + "'"
                    );
                }
                
                System.out.print("Employees < Average Salary: \n");
                ResultSet deptDetails = stmt2.executeQuery(getDeptDetailsQuery);
                while (deptDetails.next()) {
                    System.out.print(
                    deptDetails.getString("eno") + "\t" +
                    deptDetails.getString("ename") + "\t" +
                    deptDetails.getDouble("salary") + "\t\n"
                    );
                }
            }

        } catch (SQLException ex) {
            System.err.println("SQLException: " + ex);
            // try with resources automatically closes connection if exception caught
        }
    }
}
