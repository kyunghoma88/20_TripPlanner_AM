package com.kh.spring.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardComment {
	
	int boardCommentNo;
	int boardCommentLevel;
	String boardCommentWriter;
	String boardCommentContent;
	Date boardCommentDate;
	int trSeq;
	String memberId;
	int boardCommentRef;
}
