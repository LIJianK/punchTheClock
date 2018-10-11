package com.pro.service;

import java.util.List;

import com.pro.domain.Circle;

public interface CircleService {
	
	public void addCircle(Circle circle);
	public void updateCircle(Circle circle);
	public List<Circle> findCircleAll(int userId);
	public Circle findCircleSingle(int circleId);
	public List<Circle> findCircleOfCircleType(int typeId);
	public List<Circle> findMyCircle(int userId);
	public List<Circle> findAllCircleInHomePage();
	public void deleteUserCircle(int circleId);
}
