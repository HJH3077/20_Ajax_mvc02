package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class JSONCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer sb = new StringBuffer();
		List<VO> list = DAO.getList();
		sb.append("[");
		// idx, name, title, email, content, pw, reg
		for (VO k : list) {
			sb.append("{\"idx\" : \""+k.getIdx() +"\", \"name\" : \"" +k.getName()+"\", "+
		    "\"title\" : \""+ k.getTitle() +"\", \"email\" : \"" +k.getEmail()+"\","+
		    "\"reg\" : \"" + k.getReg().substring(0, 10) +"\" },") ;			
		}
		String msg = sb.toString().substring(0, sb.toString().length()-2);
		String msg2 = msg+"}]";
		return msg2;
	}
}