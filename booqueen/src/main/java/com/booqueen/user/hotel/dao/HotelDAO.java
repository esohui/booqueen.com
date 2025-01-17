package com.booqueen.user.hotel.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.booqueen.partner.hotel.HotelPolicyVO;
import com.booqueen.user.hotel.vo.BestHotelVO;
import com.booqueen.user.hotel.vo.CityCountVO;
import com.booqueen.user.hotel.vo.CityVO;
import com.booqueen.user.hotel.vo.HotelAvailableVO;
import com.booqueen.user.hotel.vo.HotelImgVO;
import com.booqueen.user.hotel.vo.HotelMapVO;
import com.booqueen.user.hotel.vo.HotelServiceVO;
import com.booqueen.user.hotel.vo.HotelVO;
import com.booqueen.user.hotel.vo.RecentSearchVO;


@Repository
public class HotelDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<HotelVO> getHotelListByCity(String city) throws DataAccessException{
		List<HotelVO> hotelListByCity = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectHotels", city);
		return hotelListByCity;
	}
	
	public List<HotelVO> getHotelListWithImgByCity(HotelAvailableVO vo) throws DataAccessException{
		List<HotelVO> hotelListWithImg = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectHotelWithImg", vo);
		return hotelListWithImg;
	}
	
	public List<HotelVO> getUnavailableHotelListWithImgByCity(HotelAvailableVO vo) throws DataAccessException{
		List<HotelVO> hotelListWithImg = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectUnavailableHotelWithImg", vo);
		return hotelListWithImg;
	}
	
	public List<HotelVO> getHotelListByStar(HashMap<String, Object> map) throws DataAccessException{
		List<HotelVO> hotelListByStar = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectFilterByStar", map);
		return hotelListByStar;
	}
	
	public List<HotelVO> getUnavailableHotelListByStar(HashMap<String, Object> map) throws DataAccessException{
		List<HotelVO> hotelListByStar = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectUnavailableHotelByFilter", map);
		return hotelListByStar;
	}
	
	public HotelVO getHotelBySerialnumber(Integer serialNumber) throws DataAccessException{
		HotelVO vo = sqlSession.selectOne("com.booqueen.user.hotel.dao.hotelmapper.selectHotel", serialNumber);
		return vo;
	}
	
	public HotelImgVO getHotelImg(Integer serialnumber) throws DataAccessException{
		HotelImgVO vo = sqlSession.selectOne("com.booqueen.user.hotel.dao.hotelmapper.selectHotelImg", serialnumber);
		return vo;
	}
	
	public List<HotelVO> selectHotelByMap(HotelMapVO vo) throws DataAccessException{
		List<HotelVO> hotelListByMap = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectHotelByMap", vo);
		return hotelListByMap;
	}
	
	public HotelPolicyVO selectHotelPolicy(Integer serialNumber) throws DataAccessException{
		HotelPolicyVO vo = sqlSession.selectOne("com.booqueen.user.hotel.dao.hotelmapper.selectHotelPolicy", serialNumber);
		return vo;
	}
	
	public List<String> getAutocompleteCity() throws DataAccessException{
		List<String> city = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.autocompleteCity");
		return city;
	}

	public List<Integer> getHotelByDate(HotelAvailableVO hotelavailableVO) throws DataAccessException{
		List<Integer> hotelList = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.getHotelByDate", hotelavailableVO);
		return hotelList;
	}
	
	public CityVO getCityLocation(String city) throws DataAccessException{
		CityVO vo = sqlSession.selectOne("com.booqueen.user.hotel.dao.hotelmapper.getCityLocation", city);
		return vo;
	}
  
	// 최근 검색
	public int insertRecentSearch(RecentSearchVO recentSearchVO) throws DataAccessException{
		return sqlSession.insert("com.booqueen.user.hotel.dao.recentsearchmapper.insertRecentSearch", recentSearchVO);
	}
	
	public List<RecentSearchVO> selectRecentSearch(String userid) throws DataAccessException{
		List<RecentSearchVO> recentSearchVO = sqlSession.selectList("com.booqueen.user.hotel.dao.recentsearchmapper.selectRecentSearch", userid);
		return recentSearchVO;
  }
	
	// index - city
	public List<CityCountVO> selectCityList() throws DataAccessException{
		List<CityCountVO> cityCountVO = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectCityList");
		return cityCountVO;
	}
	
	// index - best hotel
	public List<BestHotelVO> selectBestHotelList() throws DataAccessException{
		List<BestHotelVO> selectBestHotelVO = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectBestHotelList");
		return selectBestHotelVO;
	}
	
	// index - all city
	public List<CityCountVO> selectCityListAll() throws DataAccessException{
		List<CityCountVO> cityCountVO = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectCityListAll");
		return cityCountVO;
	}
	
	// index - random hotel
	public List<BestHotelVO> selectRandomHotel() throws DataAccessException{
		List<BestHotelVO> hotelVO = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectRandomHotel");
		return hotelVO;
	}
	
	public List<HotelServiceVO> selectHotelService(int serialnumber) throws DataAccessException{
		List<HotelServiceVO> hotelServiceVO = sqlSession.selectList("com.booqueen.user.hotel.dao.hotelmapper.selectHotelService", serialnumber);
		return hotelServiceVO;
	}
	
	public void deleteDuplicatedRecentSearch() throws DataAccessException{
		sqlSession.delete("com.booqueen.user.hotel.dao.recentsearchmapper.deleteDuplicatedRecentSearch");
	}
}
