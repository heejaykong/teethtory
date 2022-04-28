package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Dentist;

@Mapper
public interface DentistDao {
	public List<Dentist> selectByuserid(String userid);
	public List<Dentist> selectByDenname(String denname);
	public List<Dentist> selectByDenaddress(String denaddress);
	public void insert(Dentist dentist);
}
