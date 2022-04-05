package com.fwm.app.Repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.fwm.app.vo.Member;

@Mapper
public interface UserMemberRepo {
	
	
	@Insert("""
			INSERT INTO Member
			SET
			loginId = #{loginId},
			loginPw = #{loginPw},
			name = #{name},
			nickname = #{nickname},
			email = #{email},
			regDate = now()			
			""")
	public void repoInsertMember(String loginId, String regDate, String loginPw, String name, String nickname, String email);
	
	
	@Select("""
			SELECT *
			FROM Member
			WHERE loginId = #{loginId}			
			""")
	public Member repoSelectExistingMember(String loginId);
	
	
	@Select("""
			SELECT *
			FROM Member
			WHERE loginId = #{loginId}	
			""")
	public Member repoSelectCheckLoginMember(String loginId);



}
