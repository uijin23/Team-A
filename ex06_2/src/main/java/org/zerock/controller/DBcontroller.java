package org.zerock.controller;

import java.io.*;
import java.sql.*;
import java.util.LinkedList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBcontroller {
	private static final Logger logger = LoggerFactory.getLogger(DBcontroller.class);
	private static Connection con = null;
	private static LinkedList<String[]> questionData = new LinkedList();
	private static String[][] questionDataLIST;
	
	public DBcontroller() {
		connectDB();
	}

	private static void connectDB() {
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
        try {
        	Class.forName(driver);
            con = DriverManager.getConnection(url, "springtest", "1234");
    	} 
        catch (Exception e) {
        	e.printStackTrace();
    	}
	}
	
	public static void runQuery(String query) {
		try {
			connectDB();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static String[][] convertString(LinkedList<String[]> linkST) {
		String lists[][] = new String[linkST.size()][];
		for (int i=0; i<linkST.size(); i++) {
			lists[i] = linkST.get(i);
		}
		return lists;
	}
	
	private static boolean isExamNum(String examNum, String getNum) {
		if (getNum.equals(examNum)) {
			return true;
		}
		return false;
	}
	
	public static String[][] getAllData(String examNum) {
		try {
			connectDB();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM question_book ORDER BY quest_number");
			
			while (rs.next()) {
				if (!isExamNum(examNum, rs.getString(1)) && !examNum.equals("all")) {
					continue;
				}
				
				String[] qData = new String[10];
				qData[0] = rs.getString(1);
				qData[1] = rs.getString(2);
				qData[2] = String.valueOf(rs.getInt(3));
				qData[3] = rs.getString(4);
				qData[4] = rs.getString(5);
				qData[5] = rs.getString(6);
				qData[6] = rs.getString(7);
				qData[7] = rs.getString(8);
				qData[8] = rs.getString(9);
				qData[9] = String.valueOf(rs.getInt(10));
				questionData.add(qData);
			}
			questionDataLIST = convertString(questionData);
			return questionDataLIST;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String[][] setQuestion(String examNum) {
		if (questionDataLIST==null) {
			getAllData(examNum);
		}
		return questionDataLIST;
	}
	
	public static String[] getQuestionRow(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1];
	}

	public static String getQuestType(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][1];	
	}
	
	public static String getQuestion(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][3];	
	}

	public static String getQuestionImg(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][4];	
	}
	
	public static String getAnswer1(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][5];	
	}
	
	public static String getAnswer2(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][6];	
	}
	
	public static String getAnswer3(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][7];	
	}
	
	public static String getAnswer4(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][8];	
	}
	
	public static String getAnswer(String examNum, int qNum) {
		setQuestion(examNum);
		return questionDataLIST[qNum-1][9];	
	}
	
}

