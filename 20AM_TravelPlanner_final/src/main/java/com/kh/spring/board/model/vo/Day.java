package com.kh.spring.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Day {
	
	int trSeq;
	String memberId;
	int tvDate;
	String hotspotName;
	int order;
	String comment;
	int tvSeq;
	String hotspotAreaName;
	int totalDate;
	String hotspotAreaImg;
	String tvTitle;
	String hotspotImg;
	String hotspotAddr;
	String hotspotLat;
	String hotspotHar;
	
}
