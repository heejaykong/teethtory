package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.mybatis.DentistDao;
import com.mycompany.webapp.dto.Dentist;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class DentistService {
	
	@Resource
	private DentistDao dentistDao;
	
	//이름으로 검색한 치과의 총 갯수를 가져오는 메소드
	public int getDentistNumByDenname(String denname) {
		log.info("실행");
		return dentistDao.countByDenname(denname);
	}
	
	//이름으로 검색한 치과 목록을 가져오는 메소드
	public List<Dentist> getDentistByDenname(String denname, Pager pager) {
		log.info("실행");
		return dentistDao.selectByDenname(denname, pager);
	}
	
	//주소로 검색한 치과 목록을 가져오는 메소드
	public List<Dentist> getDentistByDenaddress(String denaddress) {
		return dentistDao.selectByDenaddress(denaddress);
	}
	
	//사용자가 예약을 원하는 치과와 통신을 위해서, denno로 치과정보(dendomain) 가져오는 메소드.
	public Dentist getDentistByDenno(int denno) {
		return dentistDao.selectByDenenno(denno);
	}
	
	//사용자가 치료내역에서 후기를 작성한 뒤 해당 치과의 상세화면으로 넘기기 위해서,
	//dentist서버단에서 넘겨받은 dendomain값으로 치과객체를 찾아오는 메소드.
	public Dentist getDentistByDendomain(String dendomain) {
		return dentistDao.selectByDendomain(dendomain);
	}
	
	//치과 목록 만들어두기.(구현X. 더미 데이터 생성용.)
	public void addDentist(Dentist dentist) {
		dentistDao.insert(dentist);
	}
}
