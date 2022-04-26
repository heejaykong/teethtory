package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class Users {
	private String userid;
	private String username;
	private String userpassword;
	private String useremail;
	private String userphone;
	private int userpoint;
	private int userusedpoint;
	private boolean userallownoti;
	private boolean isdoctor;
	private String user_role;
	private boolean enabled;
	private String userssn;
}
