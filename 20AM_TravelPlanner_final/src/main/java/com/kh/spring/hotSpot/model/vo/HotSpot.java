package com.kh.spring.hotSpot.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HotSpot {

	private String hotSpot_Name;
	private String hotSpot_Area_Name;
	private String hotSpot_Addr;
	private String hotSpot_Content;
	private String hotSpot_Image;
	private int hotSpot_View;
	private int hotSpot_Lat;
	private int hotSpot_Har;
}
