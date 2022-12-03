import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class FindSameSchool {
    //이거 잘 몰라서 그냥 적었습니다 ㅠㅠ
    static final String url="jdbc:mysql://localhost:3306/sys";
    static final String id="root";
    static final String pw="zxcvb12345";

    static String[] SchoolName =new String[20]; //학교 ID -> 학교 이름
    static int[] AcademicToSchool =new int[200]; //학력 ID -> 학교 ID
    static String[] SameSchoolName=new String[100]; //타겟과 같은 학교인 사람들의 ID 모음

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
            //조회할 사람의 이름을 입력
            System.out.print("조회할 사람의 이름을 입력 : ");
            targetName=sc.nextLine();
            //target 정보를 위해 db에서 찾음
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery("select * from Human");
            //이름을 찾는다.
            while(rset.next()){
                String hubo=rset.getString("name");
                if(targetName.equals(hubo)){
                    targetID=Integer.parseInt(rset.getString("ID"));
                    targetAcademicID=Integer.parseInt(rset.getString("academic_background"));
                    break;
                }
            }
            //그런 사람이 없으면 없다고 말해주자
            if(targetID<0){
                System.out.println("그런 사람 없습니다");
                System.exit(0);
            }
            //학교 찾는 함수 만들기
            rset = stmt.executeQuery("select * from School");
            while(rset.next()){
                int ID=Integer.parseInt(rset.getString("ID"));
                SchoolName[ID]=rset.getString("name");
            }
            //학교 찾는 함수 만들기2
            rset = stmt.executeQuery("select * from AcademicBackground");
            while(rset.next()){
                int ID=Integer.parseInt(rset.getString("ID"));
                int schoolID=Integer.parseInt(rset.getString("school_ID"));
                AcademicToSchool[ID]=schoolID;
            }
            //같은 학교 찾기
            int idx=0;
            rset = stmt.executeQuery("select * from Human");
            while(rset.next()){
                String huboName=rset.getString("name");
                int huboAcademicID=Integer.parseInt(rset.getString("academic_background"));
                if(targetName.equals(huboName)) continue;
                if(AcademicToSchool[targetAcademicID]==AcademicToSchool[huboAcademicID]){
                    SameSchoolName[idx++]=huboName;
                }
            }
            //출력 부분
            System.out.println(targetName+"님의 학교는 "+SchoolName[AcademicToSchool[targetAcademicID]]+"입니다");
            System.out.printf("같은 학교인 사람 : ");
            for(int i=0;i<idx;i++){
                System.out.printf(SameSchoolName[i]);
                if(i==idx-1) continue;
                System.out.printf(", ");
            }
            System.out.println("\n");
        }
        catch (Exception e){
            System.out.println("실패: "+e.getMessage());
        }
    }
}
