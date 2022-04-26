package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Comments {
	private int commentno;
	private int boardno;
	private String commentcontent;
	private Date commentdate;
	private String commentwriter;
}
