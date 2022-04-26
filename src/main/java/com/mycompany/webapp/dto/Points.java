package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Points {
	private String userid;
	private boolean pointisplus;
	private int pointamount;
	private String pointdesc;
	private Date pointdate;
}
