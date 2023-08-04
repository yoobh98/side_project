package com.ybh.side.board.service;

import java.util.List;

import com.ybh.side.board.dto.BoardDTO;
import com.ybh.side.common.dto.PageDTO;

public interface BoardService {

	public int insertBoard(BoardDTO dto);

	public List<BoardDTO> selectLikeList(BoardDTO dto);

	public int updateLike(BoardDTO dto);

	public int deleteBoard(BoardDTO dto);

	public BoardDTO updateBoardWrite(BoardDTO dto);

	public PageDTO selectAllBoardList(BoardDTO dto);

}
