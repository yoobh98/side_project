package com.ybh.side.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.ybh.side.board.dto.BoardDTO;
import com.ybh.side.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired BoardService bs;

	@GetMapping("/")
	public String goHome() {
		return "main";
	}

	@GetMapping("goWriteForm")
	public String goBoard() {
		return "board/writeForm";
	}

	@PostMapping("writeBoard")
	public String writeBoard(BoardDTO dto) {
		int result = 0 ;

		dto.setWriteId("ybh");

		result = bs.writeBoard(dto);

		if(result == 0) {
			return "errorPage";
		}
		return "redirect:goBoardList";
	}

	@GetMapping("goBoardList")
	public String goBoardList(Model model) {
		model.addAttribute("boardList", bs.selectBoardList());
		return "board/boardList";
	}

}
