package com.kh.spring.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Like {

	int likeCheck;
	String memberId;
	int trSeq;
	
	
}
