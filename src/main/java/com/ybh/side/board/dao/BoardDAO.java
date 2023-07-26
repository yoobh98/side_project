package com.ybh.side.board.dao;

import java.util.List;

import com.ybh.side.board.dto.BoardDTO;

public interface BoardDAO {

	public int writeBoard(BoardDTO dto);

	public List<BoardDTO> selectBoardList();

}
