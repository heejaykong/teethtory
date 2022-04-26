package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Point {
	private String userid;
	private boolean pointisplus;
	private int pointamount;
	private String pointdesc;
	private Date pointdate;
}
