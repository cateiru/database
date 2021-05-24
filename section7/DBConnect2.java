// List9-6 商品テーブルから「商品ID」と「商品名」の2列を全行選択するJavaプログラム

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnect2{
     public static void main(String[] args) throws Exception {

          /* 1) PostgreSQLへの接続情報 */
          Connection con;
          Statement st;
          ResultSet rs;

          String url = "jdbc:postgresql://localhost:5432/shop";
          String user = "postgres";
          String password = "";

          /* 2) JDBCドライバの定義 */
          Class.forName("org.postgresql.Driver");

          /* 3) PostgreSQLへの接続 */
          con = DriverManager.getConnection(url, user, password);
          st = con.createStatement();

          /* 4) SELECT文の実行 */
          rs = st.executeQuery("SELECT 商品ID, 商品名, 販売単価 FROM 商品");

          /* 5) 結果の画面表示 */
          while(rs.next()) {
               System.out.print(rs.getString("商品ID") + ", ");
               System.out.print(rs.getString("商品名") + ", ");
               System.out.println(rs.getInt("販売単価"));
          }

          /* 6) PostgreSQLとの接続を切断 */
          rs.close();
          st.close();
          con.close();
     }
}