package com.ybh.side.board.service;

import java.util.List;

import com.ybh.side.board.dto.BoardDTO;

public interface BoardService {
	public int writeBoard(BoardDTO dto);
	public List<BoardDTO> selectBoardList();

}
