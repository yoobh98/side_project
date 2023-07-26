package com.ybh.side.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybh.side.board.dao.BoardDAO;
import com.ybh.side.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardDAO dao;

	@Override
	public int writeBoard(BoardDTO dto) {
		return dao.writeBoard(dto);
	}

	@Override
	public List<BoardDTO> selectBoardList() {
		return dao.selectBoardList();
	}

}
