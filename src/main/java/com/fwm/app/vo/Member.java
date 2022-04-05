package com.fwm.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private String loginId;
	private String regDate;
	private String loginPw;
	private String name;
	private String nickname;
	private String email;
}
