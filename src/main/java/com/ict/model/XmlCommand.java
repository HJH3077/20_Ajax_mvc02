package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class XmlCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer sb = new StringBuffer();
		List<VO> list = DAO.getList();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		// idx, name, subject, content, email, pwd, regdate
		for (VO k : list) {
			sb.append("<member idx=\""+k.getIdx() +"\" title=\""+k.getTitle()+
			"\" email=\""+k.getEmail() +"\" reg=\""+
					k.getReg().substring(0, 10)+"\" >"+k.getName()+"</member>");
		}
		sb.append("</members>");
		return sb.toString();
	}
}