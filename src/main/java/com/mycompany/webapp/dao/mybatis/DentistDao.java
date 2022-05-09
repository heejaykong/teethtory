package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface DentistDao {
	public List<Dentist> selectByuserid(String userid);
	public int countByDenname(String denname);
	public List<Dentist> selectByDenname(@Param("denname") String denname, @Param("pager") Pager pager);
	public List<Dentist> selectByDenaddress(String denaddress);

//	public Dentist selectByDenenno(int denno);

	public Dentist selectByDendomain(String dendomain);
	public void insert(Dentist dentist);
}
