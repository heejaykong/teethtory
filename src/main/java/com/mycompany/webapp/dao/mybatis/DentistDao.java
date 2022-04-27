package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import com.mycompany.webapp.dto.Dentist;

public interface DentistDao {
	public List<Dentist> selectByuserid(String userid);
	public List<Dentist> selectByDenname(String denname);
	public List<Dentist> selectByDenaddress(String denaddress);
}
