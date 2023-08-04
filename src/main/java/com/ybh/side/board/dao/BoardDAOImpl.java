package com.ybh.side.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ybh.side.board.dto.BoardDTO;
import com.ybh.side.common.dto.PageDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDAOImpl implements BoardDAO{

	private final SqlSession sqlSession;

	@Override
	public int insertBoard(BoardDTO dto) {
		return sqlSession.insert("BoardMapper.insertBoard", dto);
	}

	@Override
	public List<BoardDTO> selectLikeList(BoardDTO dto) {
		return sqlSession.selectList("BoardMapper.selectLikeList", dto);
	}

	@Override
	public String selectLikeIsYN(BoardDTO dto) {
		return sqlSession.selectOne("BoardMapper.selectLikeIsYN", dto);
	}

	@Override
	public int plusLikeCnt(BoardDTO dto) {
		return sqlSession.update("BoardMapper.plusLikeCnt", dto);
	}

	@Override
	public int insertLikeUser(BoardDTO dto) {
		return sqlSession.insert("BoardMapper.insertLikeUser", dto);
	}

	@Override
	public int minusLikeCnt(BoardDTO dto) {
		return sqlSession.update("BoardMapper.minusLikeCnt", dto);
	}

	@Override
	public int deleteLikeUser(BoardDTO dto) {
		return sqlSession.delete("BoardMapper.deleteLikeUser", dto);
	}

	@Override
	public List<BoardDTO> selectAllBoardList(BoardDTO dto) {
		return sqlSession.selectList("BoardMapper.selectAllBoardList", dto);
	}

	@Override
	public int deleteBoard(BoardDTO dto) {
		return sqlSession.delete("BoardMapper.deleteBoard", dto);
	}

	@Override
	public int updateBoardWrite(BoardDTO dto) {
		return sqlSession.update("BoardMapper.updateBoardWrite", dto);
	}

	@Override
	public BoardDTO selectBoardOne(BoardDTO dto) {
		return sqlSession.selectOne("BoardMapper.selectBoardOne", dto);
	}

	@Override
	public int selectAllBoardListTestCnt(BoardDTO dto) {
		return sqlSession.selectOne("BoardMapper.selectAllBoardListTestCnt", dto);
	}

	@Override
	public List<BoardDTO> selectAllBoardListTest(BoardDTO dto) {
		return sqlSession.selectList("BoardMapper.selectAllBoardListTest", dto);
	}
}
