package com.ybh.side.board.dao;

import java.util.List;

import com.ybh.side.board.dto.BoardDTO;
import com.ybh.side.common.dto.PageDTO;

public interface BoardDAO {

	public int insertBoard(BoardDTO dto);

	public List<BoardDTO> selectLikeList(BoardDTO dto);

	public String selectLikeIsYN(BoardDTO dto);

	public int plusLikeCnt(BoardDTO dto);
	public int insertLikeUser(BoardDTO dto);

	public int minusLikeCnt(BoardDTO dto);
	public int deleteLikeUser(BoardDTO dto);

	public List<BoardDTO> selectAllBoardList(BoardDTO dto);

	public int deleteBoard(BoardDTO dto);

	public int updateBoardWrite(BoardDTO dto);

	public BoardDTO selectBoardOne(BoardDTO dto);

	public int selectAllBoardListTestCnt(BoardDTO dto);

	public List<BoardDTO> selectAllBoardListTest(BoardDTO dto);

}
