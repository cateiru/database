// List9-4　SQL文を実行するJavaプログラム

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect1 {
     public static void main(String[] args)
	         throws ClassNotFoundException, SQLException {

          /* 1) PostgreSQLへの接続情報 */
          Connection con;
          Statement st;
          ResultSet rs;

          String url = "jdbc:postgresql://localhost:5432/postgres";
          String user = "yuto_w";
          String password = "";

          /* 2) JDBCドライバの定義 */
          Class.forName("org.postgresql.Driver");

          /* 3) PostgreSQLへの接続 */
          con = DriverManager.getConnection(url, user, password);
          st = con.createStatement();

          /* 4) SELECT文の実行 */
          rs = st.executeQuery("SELECT CURRENT_TIMESTAMP AS c1");

          /* 5) 結果の画面表示 */
          rs.next();
          System.out.println("SELECT文の実行結果: " + rs.getString("c1"));

          /* 6) PostgreSQLとの接続を切断 */
          rs.close();
          st.close();
          con.close();
     }
}
