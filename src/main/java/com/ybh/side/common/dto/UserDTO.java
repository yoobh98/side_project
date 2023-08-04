package com.ybh.side.common.dto;

import lombok.Data;

@Data
public class UserDTO {
	private String userId;
	private String userPw;
	private String userName;

	private String errMessage = "";
}
