package com.ybh.side.board.dto;

import com.ybh.side.common.dto.PageDTO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardDTO extends PageDTO{
	private int boardNum;
	private int boardParentNum;
	private String content;
	private String writeId;
	private String writeDate;
	private int orderNo;
	private int replyCnt;
	private int likeCnt;

	private String errMessage;

	private String userName;
	private int rowNum;
	private int likeNum;
	private String sessUserId;

	private String likeMyGubun;
}
