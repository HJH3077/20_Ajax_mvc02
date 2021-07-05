package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class TextCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer sb = new StringBuffer();
		List<VO> list = DAO.getList();
		for (VO k : list) {
			sb.append(k.getIdx()+",");
			sb.append(k.getName()+",");
			sb.append(k.getTitle()+",");
			sb.append(k.getEmail()+",");
			sb.append(k.getContent()+",");
			sb.append(k.getPw()+",");
			sb.append(k.getReg().substring(0, 10));
			sb.append("/");
		}
		String msg = sb.toString().substring(0, sb.toString().length()-1); 
		return sb.toString();
	}
}
