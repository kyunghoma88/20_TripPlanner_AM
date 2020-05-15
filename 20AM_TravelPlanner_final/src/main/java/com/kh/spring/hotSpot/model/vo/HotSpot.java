package com.kh.spring.hotSpot.model.vo;

public class HotSpot {
	
	private String hotspot_name;
	private String hotspot_area_name;
	private String hotspot_addr;
	private String hotspot_content;
	private String hotspot_image;
	private int hotspot_view;
	
	public HotSpot() {
		// TODO Auto-generated constructor stub
	}
	
	

	public HotSpot(String hotspot_name, String hotspot_area_name, String hotspot_addr, String hotspot_content,
			String hotspot_image, int hotspot_view) {
		super();
		this.hotspot_name = hotspot_name;
		this.hotspot_area_name = hotspot_area_name;
		this.hotspot_addr = hotspot_addr;
		this.hotspot_content = hotspot_content;
		this.hotspot_image = hotspot_image;
		this.hotspot_view = hotspot_view;
	}



	public String getHotspot_name() {
		return hotspot_name;
	}

	public void setHotspot_name(String hotspot_name) {
		this.hotspot_name = hotspot_name;
	}

	public String getHotspot_area_name() {
		return hotspot_area_name;
	}

	public void setHotspot_area_name(String hotspot_area_name) {
		this.hotspot_area_name = hotspot_area_name;
	}

	public String getHotspot_addr() {
		return hotspot_addr;
	}

	public void setHotspot_addr(String hotspot_addr) {
		this.hotspot_addr = hotspot_addr;
	}

	public String getHotspot_content() {
		return hotspot_content;
	}

	public void setHotspot_content(String hotspot_content) {
		this.hotspot_content = hotspot_content;
	}

	public String getHotspot_image() {
		return hotspot_image;
	}

	public void setHotspot_image(String hotspot_image) {
		this.hotspot_image = hotspot_image;
	}

	public int getHotspot_view() {
		return hotspot_view;
	}

	public void setHotspot_view(int hotspot_view) {
		this.hotspot_view = hotspot_view;
	}



	@Override
	public String toString() {
		return "HotSpot [hotspot_name=" + hotspot_name + ", hotspot_area_name=" + hotspot_area_name + ", hotspot_addr="
				+ hotspot_addr + ", hotspot_content=" + hotspot_content + ", hotspot_image=" + hotspot_image
				+ ", hotspot_view=" + hotspot_view + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
