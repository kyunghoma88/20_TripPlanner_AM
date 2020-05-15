package com.kh.spring.hotSpot.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotSpot {

	private String hotspotName;
	private String hotspotAreaName;
	private String hotspotAddr;
	private String hotspotContent;
	private String hotspotImage;
	private int hotspotView;
}
