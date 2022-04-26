package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Boards {
	private int boardno;
	private String boardwriter;
	private String boardtitle;
	private String boardcontent;
	private Date boarddate;
	private String bimagecontenttype;
	private String bimageoriginalname;
	private String bimagesavedfilename;
}
