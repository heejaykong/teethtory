package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.DentistDao;
import com.mycompany.webapp.dao.mybatis.MyDentistDao;
import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.MyDentist;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class DentistService {
	
	@Resource
	private DentistDao dentistDao;
	
	//이름으로 검색한 치과 목록을 가져오는 메소드
	public List<Dentist> getDentistByDenname(String denname) {
		return dentistDao.selectByDenname(denname);
	}
	
	//주소로 검색한 치과 목록을 가져오는 메소드
	public List<Dentist> getDentistByDenaddress(String denaddress) {
		return dentistDao.selectByDenaddress(denaddress);
	}
	
	//치과 목록 만들어두기.(구현X. 더미 데이터 생성용.)
	public void addDentist(Dentist dentist) {
		dentistDao.insert(dentist);
	}
}
