package com.thenine.hrmsystem;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class sumkyunFunction {
    //이거 잘 몰라서 그냥 적었습니다 ㅠㅠ
    static final String url="jdbc:mysql://localhost:3306/sys";
    static final String id="root";
    static final String pw="zxcvb12345";

    public static void main(String[] args){
        //같은 학교만 찾는 기능만 구현
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url,id,pw);

            Scanner sc= new Scanner(System.in);
            //알아야 할 값들
            String targetName; //=어떤 사람
            int targetID=-1; //=어떤 사람의 ID
            int targetAcademicID=-1; //=어떤 사람의 academic_backgroundID
            int targetSchoolID=-1;
            //조회할 사람의 이름을 입력
            System.out.print("조회할 사람의 이름을 입력 : ");
            targetName=sc.nextLine();
            //target 정보를 위해 db에서 찾음
            Statement stmt = conn.createStatement();

            ResultSet rset = stmt.executeQuery("select * from Human where name="+'"'+targetName+'"');
            if(rset.next()) {
                targetID = Integer.parseInt(rset.getString("ID"));
                targetAcademicID = Integer.parseInt(rset.getString("academic_background"));
            }
            //그런 사람이 없으면 없다고 말해주자
            if(targetID<0){
                System.out.println("그런 사람 없습니다");
                System.exit(0);
            }
            rset = stmt.executeQuery("select * from AcademicBackground where ID="+'"'+targetAcademicID+'"');
            if(rset.next()) {
                targetSchoolID = Integer.parseInt(rset.getString("school_ID"));
            }
            rset = stmt.executeQuery("select * from school where ID="+'"'+targetSchoolID+'"');
            if(rset.next()) {
                String targetSchoolName = rset.getString("name");
                System.out.println(targetName+"님의 학교는 "+targetSchoolName+"입니다");
            }
            System.out.printf("같은 학교인 사람 : ");

            rset = stmt.executeQuery("select H.name freind from Human H inner join AcademicBackground A on H.academic_background=A.ID inner join School S on S.ID=A.school_ID where S.ID="+'"'+targetSchoolID+'"');

            while(rset.next()){
                String huboName=rset.getString("freind");
                System.out.printf(huboName+" ");
            }
            System.out.println("");
        }
        catch (Exception e){
            System.out.println("실패: "+e.getMessage());
        }
    }

    //임직원의 이름과 이동할 부서를 입력하면 도와주는 프로시저
    public static void mainf(String args[]){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url,id,pw);
            Scanner sc= new Scanner(System.in);

            String humanName;
            String departmentName;

            System.out.print("부서 이동할 사람의 이름을 입력 : ");
            humanName=sc.nextLine();
            System.out.print("이동할 부서의 이름을 입력 : ");
            departmentName=sc.nextLine();

            int humanID=-1;
            int WantDepartmentID=-1;
            int nowDepartmentID=-1;
            int employeeID=-1;
            
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery("select ID from Human where name="+'"'+humanName+'"');
            if(rset.next()) humanID=Integer.parseInt(rset.getString("ID"));
            rset = stmt.executeQuery("select ID from Department where name="+'"'+departmentName+'"');
            if(rset.next()) WantDepartmentID=Integer.parseInt(rset.getString("ID"));
            //얘가 임직원인지 확인해보자
            rset = stmt.executeQuery("select ID from Employee where humanID="+humanID);
            if(rset.next()) employeeID=Integer.parseInt(rset.getString("ID"));

            //그런 사람 없으면 안댐
            if(humanID<0){
                System.out.println("그런 사람 없습니다");
                System.exit(0);
            }
            if(WantDepartmentID<0){
                System.out.println("그런 부서 없습니다");
                System.exit(0);
            }
            if(employeeID<0){
                System.out.println("회사 사람은 맞는데 직원은 아닙니다");
                System.exit(0);
            }

            //얘 부서 어디지?
            rset = stmt.executeQuery("select department_ID from DepartmentMember where employee_ID="+employeeID);
            if(rset.next()) nowDepartmentID=Integer.parseInt(rset.getString("department_ID"));

            if(nowDepartmentID<0){
                System.out.println("얘 직원 맞는데 부서가 없어요");
                System.exit(0);
            }
        }
        catch (Exception e){
            System.out.println("실패: "+e.getMessage());
        }
    }
}
