package com.booqueen.partner.room;

import java.util.HashMap;

public interface RoomService {

	public void addRoom(RoomVO vo);
	
	public RoomVO getIdBySerial(int serial);

	public FacilitiesBasicVO getBasicInfoByHotelSerial(int serial);

	public FacilitiesBathVO getBathInfoByHotelSerial(int serial);

	public FacilitiesMediaVO getMediaInfoByHotelSerial(int serial);

	public FacilitiesViewVO getViewInfoByHotelSerial(int serial);

	public FacilitiesAccessVO getAccessInfoByHotelSerial(int serial);

	public FacilitiesServiceVO getServiceInfoByHotelSerial(int serial);

	public void updateHotelService(HashMap<String, Object> attribute);

	public void updateFaciliteisBasic(HashMap<String, Object> attribute);

	public void updateFacilitiesAccess(HashMap<String, Object> attribute);

	public void updateFacilitiesMedia(HashMap<String, Object> attribute);

	public void updateFacilitiesView(HashMap<String, Object> attribute);

	public void updateFacilitiesBath(HashMap<String, Object> attribute);

	public void updateFacilitiesService(HashMap<String, Object> attribute);
}