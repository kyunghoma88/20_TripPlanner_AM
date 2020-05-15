package com.kh.spring.plan.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Planner {
	
	private int tvSeq;
	private String day;
	private String hotspotName;
	private String placeImg;
	private Date tvDate;
	private String hotspotAreaName;
	private int tvCount;
}
