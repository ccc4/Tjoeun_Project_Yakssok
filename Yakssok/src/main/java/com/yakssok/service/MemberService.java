package com.yakssok.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yakssok.dao.MemberDAO;
import com.yakssok.model.DeleteMember;
import com.yakssok.model.Member;



@Service
public class MemberService {
	
	
	@Autowired
	private MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	
	public Member select (Member member) {
		return dao.select(member);
	}
	
	public Member findId(Member member) {
		return dao.findId(member);
	}
	
	public int editPw(Member member) {
		return dao.editPw(member);
	}
	
	public int deleteMember(Member member) {
		return dao.deleteMember(member);
	}
	
	public int insertdeleteMember(DeleteMember deletemember) {
		return dao.insertDeleteMember(deletemember);
	}
	
	public int updateMember(Member member) {
		return dao.update(member);
	}
}