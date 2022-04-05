package com.fwm.app.service;

import org.springframework.stereotype.Service;

import com.fwm.app.Repository.UserMemberRepo;
import com.fwm.app.vo.Member;

@Service
public class UserMemberServ {	
	
	private UserMemberRepo usermemberrepo;
	
	public UserMemberServ(UserMemberRepo usermemberrepo) {
		
		this.usermemberrepo = usermemberrepo;
		
	}
	

	public String servInsertMember(String loginId, String regDate, String loginPw, String name, String nickname,
			String email) {
		// TODO Auto-generated method stub
		Member existingMember = getMemberId(loginId);
		
		if (existingMember != null) {
			return "중복";
		}
		
		usermemberrepo.repoInsertMember(loginId, regDate, loginPw, name, nickname, email);
		
		return "가능";
		
	}


	private Member getMemberId(String loginId) {
		
		return usermemberrepo.repoSelectExistingMember(loginId);
	}


	public Member servSelectCheckLoginMember(String loginId) {
		
		System.out.println(usermemberrepo.repoSelectCheckLoginMember(loginId));
		
		return usermemberrepo.repoSelectCheckLoginMember(loginId);
	}


}
