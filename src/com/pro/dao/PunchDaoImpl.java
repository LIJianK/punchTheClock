package com.pro.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.pro.domain.Circle;
import com.pro.domain.Punch;
import com.pro.domain.User;

public class PunchDaoImpl extends BaseDao implements PunchDao {

	/**
	 * @author zjw
	 * 打卡dao
	 */
	@Override
	public void punchClick(Connection conn, Punch punch) throws Exception {
		String sql = "insert into a_punch(punchId,pubchMsg,punchTime,circleId,userId,punchFeel) values(seq.nextval,?,?,?,?,?)";
		Object[] param = {punch.getPunchMsg(),punch.getPunchTime(),punch.getCircle().getCircleId(),punch.getUser().getUserId(),punch.getPunchFeel()};
		this.exeSql(conn, sql, param);
	}

	@Override
	public int selectPunchId(Connection conn, Punch punch) throws Exception {
		String sql = "select p.PUNCHID from a_punch p,a_usercircle uc where "
				+ "p.CIRCLEID=uc.CIRCLEID and p.USERID=uc.USERID and p.userId=? and p.CIRCLEID=? and p.punchtime=?";
		Object[] param = {punch.getUser().getUserId(),punch.getCircle().getCircleId(),punch.getPunchTime()};
		ResultSet rs = this.getRs(conn, sql, param);
		int flag = 0;
		if(rs.next()){
			flag = 1;
		}
		return flag;
	}

	@Override
	public List<Punch> findCirclePunch(Connection conn, int circleId) throws Exception {
		String sql = "select * from a_users u,a_circle c,a_punch p where u.userId=p.userId and c.CIRCLEID=p.CIRCLEID and c.CIRCLEID=?";
		Object[] param = {circleId};
		List<Punch> punchList = new ArrayList<Punch>();
		ResultSet rs = this.getRs(conn, sql, param);
		while(rs.next()){
			Punch punch = new Punch();
			punch.setPunchId(rs.getInt("punchId"));
			punch.setPunchMsg(rs.getString("PUBCHMSG"));
			punch.setPunchFeel(rs.getInt("punchfeel"));
			punch.setPunchTime(rs.getString("punchtime"));
			punch.setUser(new User(rs.getInt("userId"),rs.getString("nickName")));
			punchList.add(punch);
		}
		return punchList;
	}

	@Override
	public List<Punch> selectUserPunch(Connection conn, int userId)
			throws Exception {
		String sql = "select c.CIRCLEID,c.CIRCLENAME,p.PUNCHID,p.PUBCHMSG,p.PUNCHTIME,p.PUNCHFEEL from a_circle c,a_punch p where c.CIRCLEID=p.CIRCLEID and c.USERID=?";
		Object[] param = {userId};
		List<Punch> punchList = new ArrayList<Punch>();
		ResultSet rs = this.getRs(conn, sql, param);
		while(rs.next()){
			Punch punch = new Punch();
			punch.setCircle(new Circle(rs.getInt("CIRCLEID"),rs.getString("CIRCLENAME")));
			punch.setPunchId(rs.getInt("PUNCHID"));
			punch.setPunchMsg(rs.getString("PUBCHMSG"));
			punch.setPunchTime(rs.getString("PUNCHTIME"));
			punch.setPunchFeel(rs.getInt("PUNCHFEEL"));
			punchList.add(punch);
		}
		return punchList;
		
	}

	@Override
	public void deletePunch(Connection conn, int circleId) throws Exception {

		String sql = "delete from A_PUNCH where CIRCLEID=?";
		Object param[] = {circleId};
		this.exeSql(conn, sql, param);
	}

}






