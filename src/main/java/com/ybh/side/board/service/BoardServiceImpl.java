package com.ybh.side.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ybh.side.board.dao.BoardDAO;
import com.ybh.side.board.dto.BoardDTO;
import com.ybh.side.common.dto.PageDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

	private final BoardDAO dao;

	@Override
	public int insertBoard(BoardDTO dto) {
		return dao.insertBoard(dto);
	}

	@Override
	public List<BoardDTO> selectLikeList(BoardDTO dto) {
		return dao.selectLikeList(dto);
	}

	@Override
	public int updateLike(BoardDTO dto) {
		String YN = dao.selectLikeIsYN(dto);
		int result = 0 ;
		if(YN == null) {
			dao.plusLikeCnt(dto);
			dao.insertLikeUser(dto);
			result = 1;
		}else {
			dao.minusLikeCnt(dto);
			dao.deleteLikeUser(dto);
			result = 2;
		}
		return result;
	}

	@Override
	public int deleteBoard(BoardDTO dto) {
		return dao.deleteBoard(dto);
	}

	@Override
	public BoardDTO updateBoardWrite(BoardDTO dto) {
		BoardDTO addObject = new BoardDTO();
		if(dao.updateBoardWrite(dto) ==1) {
			addObject = dao.selectBoardOne(dto);
		}
		return addObject;
	}

	@Override
	public PageDTO selectAllBoardList(BoardDTO dto) {
		PageDTO pageDTO= new PageDTO();
		pageDTO.setPageNum(dto.getPageNum());
		pageDTO.setPageResultCnt(dto.getPageResultCnt());
		pageDTO.setResultCnt(dao.selectAllBoardListCnt(dto));
		pageDTO.setResult(dao.selectAllBoardList(dto));
		return pageDTO;
	}

	@Override
	public List<BoardDTO> selectReplyByboardNum(BoardDTO dto) {
		return dao.selectReplyByboardNum(dto);
	}

	@Override
	public BoardDTO selectBoardOne(BoardDTO dto) {
		return dao.selectBoardOne(dto);
	}

	@Override
	public int replySave(BoardDTO dto) {
		dao.plusReplyCnt(dto);
		return dao.replySave(dto);
	}

}
