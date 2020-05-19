package com.kh.spring.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	private String memberId;
	private String password;
	private String memberName;
	private String email;
	private String phone;
	private String address;
	private Date enrollDate;
	private String status;
	private String postCode;
	private String addressDetail;
	

}
