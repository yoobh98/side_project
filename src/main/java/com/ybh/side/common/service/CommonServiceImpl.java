package com.ybh.side.common.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ybh.side.common.dao.CommonDAO;
import com.ybh.side.common.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommonServiceImpl implements CommonService{

	private final CommonDAO cd;

	@Override
	public UserDTO loginChk(UserDTO dto) {
		List<UserDTO> list = cd.selectAllUserList();

		for(int i = 0 ; i < list.size() ; i++) {
			if(list.get(i).getUserId().equals(dto.getUserId())) {
				if(list.get(i).getUserPw().equals(dto.getUserPw())) {
					return cd.selectOneUser(dto.getUserId());
				}else {
					dto.setErrMessage("비밀번호가 일치하지 않습니다");
					return dto;
				}
			}
		}
		dto.setErrMessage("존재하지 않는 아이디 입니다.");
		return dto;
	}

	// 2 : 아이디 중복 , 1 : 성공
	@Override
	public int registerChk(UserDTO dto) {
		List<UserDTO> list = cd.selectAllUserList();
		for(int i = 0 ; i < list.size() ; i++) {
			if(list.get(i).getUserId().equals(dto.getUserId())) {
				return 2;
			}
		}
		return cd.insertRegister(dto);
	}

}
