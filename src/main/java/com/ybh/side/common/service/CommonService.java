package com.ybh.side.common.service;

import com.ybh.side.common.dto.UserDTO;

public interface CommonService {

	public UserDTO loginChk(UserDTO dto);

	public int registerChk(UserDTO dto);

}
