package com.booqueen.partner.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.booqueen.partner.hotel.HotelVO;
import com.booqueen.partner.member.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
//	
	private String nameSpace = "member.model.MemberMapper";
//		
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public MemberVO getMember(MemberVO vo) {
		return (MemberVO) sqlSessionTemplate.selectOne("MemberDAO.getMember", vo);
	}
	
	public MemberVO getPassword(MemberVO vo) {
		return (MemberVO) sqlSessionTemplate.selectOne("MemberDAO.getPassword", vo);
	}

	public void register(MemberVO vo) {
		sqlSessionTemplate.insert("MemberDAO.insertMember", vo);
	}

	public void changePassword(MemberVO vo) {
		sqlSessionTemplate.update("MemberDAO.updatePassword", vo);
		
	}

	public HotelVO selectSameHotelName(HotelVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.selectSameHotelName", vo);
	}

}

