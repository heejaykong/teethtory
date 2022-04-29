package com.mycompany.webapp.dao.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.MyDentist;

@Mapper
public interface MyDentistDao {
	public List<MyDentist> selectByUserid(String userid);
	public int countByuseridNDenno(@Param("userid") String userid, @Param("denno") int denno);
	//사용자가 치과 검색 후, 내 치과로 등록.
	public int insert(@Param("userid") String userid, @Param("denno") int denno);
	//사용자가 내 치과 목록에서 특정 치과 삭제.
	public int delete(@Param("userid") String userid, @Param("denno") int denno);
}
