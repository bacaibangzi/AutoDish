package com.sc.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBConn {
	private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    
    //四个方法
    //method1: 创建数据库的连接
    public  Connection getConntion(){        
        try {
            //1: 加载连接驱动，Java反射原理
            Class.forName(Config.CLASS_NAME);
            //2:创建Connection接口对象，用于获取MySQL数据库的连接对象。三个参数：url连接字符串    账号  密码
            String url = Config.DATABASE_URL+"://"+Config.SERVER_IP+":"+Config.SERVER_PORT+"/"+Config.DATABASE_SID;
            conn = DriverManager.getConnection(url,Config.USERNAME,Config.PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return conn;
    }
    
    
    //method2：关闭数据库的方法
    public void closeConn(){
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(pstmt!=null){
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    
    /*
     * 解析ResultSet 表列数据
     */
    public Map<String,Object> getResultMap(ResultSet rs) throws SQLException{ 
        Map<String, Object> rawMap = new HashMap<String, Object>();
        ResultSetMetaData  rsmd = rs.getMetaData(); // 表对象信息
        int count = rsmd.getColumnCount();          // 列数
        // 遍历之前需要调用 next()方法
        for (int i = 1; i <= count; i++) {  
            String key = rsmd.getColumnLabel(i);
            Object value = rs.getObject(key);
            rawMap.put(key, value); 
        }
        return rawMap;
    }
    /*
     * 解析ResultSet 表数据
     */
    public List<Map<String,Object>> getResultList(ResultSet rs) throws SQLException{
        List<Map<String,Object>> rawList = new ArrayList<Map<String,Object>>();
        while(rs.next()){
            Map<String, Object> rawMap = getResultMap(rs);
            rawList.add(rawMap); 
        }
        return rawList;
    }
}
