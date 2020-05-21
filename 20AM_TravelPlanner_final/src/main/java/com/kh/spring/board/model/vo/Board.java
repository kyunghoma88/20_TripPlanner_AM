package com.kh.spring.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	int trSeq;
	String memberId;
	String tvTitle;
	String hotspotName;
	String hotspotAreaName;
	int viewCount;
	String hotspotAreaImg;
	String hotspotAreaLat;
	String hotspotAreaHar;
	int like_check;
	int like_up;
}
