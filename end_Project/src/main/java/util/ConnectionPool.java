package util;

import java.sql.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionPool {
    private static DataSource _ds = null;
    
    public static Connection get() throws Exception {
        if (_ds == null) {
            _ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/wave");
        }
        return _ds.getConnection();
    }
}