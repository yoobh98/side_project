package com.ybh.side.common.dao;

import java.util.List;

import com.ybh.side.common.dto.UserDTO;

public interface CommonDAO {

	public List<UserDTO> selectAllUserList();

	public int insertRegister(UserDTO dto);

	public UserDTO selectOneUser(String userId);

}
