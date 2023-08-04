package com.ybh.side.common.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ybh.side.common.dto.UserDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CommonDAOImpl implements CommonDAO{

	private final SqlSession sqlSession;

	@Override
	public List<UserDTO> selectAllUserList() {
		return sqlSession.selectList("CommonMapper.selectAllUserList");
	}

	@Override
	public int insertRegister(UserDTO dto) {
		return sqlSession.insert("CommonMapper.insertRegister", dto);
	}

	@Override
	public UserDTO selectOneUser(String userId) {
		return sqlSession.selectOne("CommonMapper.selectOneUser", userId);
	}

}
