package guestbook.service;

import java.sql.Connection;
import java.sql.SQLException;

import guestbook.dao.MessageDao;
import guestbook.model.Message;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class DeleteMessageService {
	private static DeleteMessageService instance=new DeleteMessageService();
	private DeleteMessageService() {}
	public static DeleteMessageService getInstance() {
		return instance;
	}
	public void deleteMessage(int messageId, String password) {
		Connection conn=null;
		try {
			conn=ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			MessageDao messageDao=MessageDao.getInstance();
			Message message=messageDao.select(conn, messageId);
			if(message==null) {
				throw new ServiceException("메세지 없음");
			}
			if(!message.matchPassword(password)) {
				throw new ServiceException("bad password");
			}
			messageDao.delete(conn, messageId);
			conn.commit();
		}
		catch(SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패:"+ex.getMessage(),ex);
		}
		finally {
			JdbcUtil.close(conn);
		}
	}
}
