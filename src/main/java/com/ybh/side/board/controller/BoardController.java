package com.ybh.side.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ybh.side.board.dto.BoardDTO;
import com.ybh.side.board.service.BoardService;
import com.ybh.side.common.dto.PageDTO;

import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequiredArgsConstructor
public class BoardController {

	private final BoardService bs;

	@GetMapping("goBoardList")
	public String goBoardList() {
		return "board/boardList.page";
	}

	@ResponseBody
	@PostMapping("selectLikeList")
	public List<BoardDTO> selectLikeList(@RequestBody BoardDTO dto){
		return bs.selectLikeList(dto);
	}

	@ResponseBody
	@PostMapping("insertBoard")
	public int insertBoard(@RequestBody BoardDTO dto) {
		return bs.insertBoard(dto);
	}

	@ResponseBody
	@PostMapping("updateLike")
	public int updateLike(@RequestBody BoardDTO dto) {
		return bs.updateLike(dto);
	}

	@ResponseBody
	@PostMapping("selectAllBoardList")
	public List<BoardDTO> selectAllBoardList(@RequestBody BoardDTO dto){
		return bs.selectAllBoardList(dto);
	}

	@ResponseBody
	@PostMapping("deleteBoard")
	public int deleteBoard(@RequestBody BoardDTO dto) {
		return bs.deleteBoard(dto);
	}

	@GetMapping("openBoardEditForm")
	public String openBoardEditForm() {
		return "board/boardEditPopup";
	}

	@ResponseBody
	@PostMapping("updateBoardWrite")
	public BoardDTO updateBoardWrite(@RequestBody BoardDTO dto) {
		return bs.updateBoardWrite(dto);
	}

	@GetMapping("goBoardListTest")
	public String goBoardListTest() {
		return "board/boardListTest.page";
	}

	@ResponseBody
	@PostMapping("selectAllBoardListTest")
	public PageDTO selectAllBoardListTest(@RequestBody BoardDTO dto){
		return bs.selectAllBoardListTest(dto);
	}

}
