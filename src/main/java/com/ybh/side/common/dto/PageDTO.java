package com.ybh.side.common.dto;

import java.util.List;

import lombok.Data;

@Data
public class PageDTO {
	// 페이징
	private int pageNum;		// 페이지번호
	private int pageResultCnt;	// 1페이지 결과건수
	private int resultCnt;		// 결과건수
	private List<?> result;		// 결과
}
