package p201432038;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {
	public static List<Article> findAll(int currentPage, int pageSize, String ss, String st, String od)
			throws Exception {
		String sql = "call article_findAll(?, ?, ?, ?, ?)";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, (currentPage - 1) * pageSize); // firstRecordIndex
			statement.setInt(2, pageSize); // pageSize
			statement.setString(3, ss); // 조회 방법
			statement.setString(4, st + "%"); // 검색 문자열
			statement.setString(5, od); // 정렬 순서
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Article> list = new ArrayList<Article>();
				while (resultSet.next()) {
					Article article = new Article();
					article.setId(resultSet.getInt("id"));
					article.setNo(resultSet.getInt("no"));
					article.setBoardName(resultSet.getString("boardName"));
					article.setUserName(resultSet.getString("userName"));
					article.setWriteTime(resultSet.getTimestamp("writeTime"));
					article.setTitle(resultSet.getString("title"));
					list.add(article);
				}
				return list;
			}
		}
	}

	public static int count(String ss, String st) throws Exception {
		String sql = "call article_count(?, ?)";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, ss); // 조회 방법
			statement.setString(2, st + "%"); // 검색 문자열
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next())
					return resultSet.getInt(1);
			}
		}
		return 0;
	}

	public static Article findOne(int id) throws Exception {
		String sql = "select * from article where id = ?";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			Article article = new Article();
			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					article.setId(resultSet.getInt("id"));
					article.setBody(resultSet.getString("body"));
					article.setUserId(resultSet.getInt("userId"));
					article.setTitle(resultSet.getString("title"));
					article.setNotice(resultSet.getBoolean("notice"));
				}
				return article;
			}
		}
	}

	public static void update(Article article) throws Exception {
		String sql = "update article set title=?,body=?, userId=?, notice=?"
				+ " where id = ?";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, article.getTitle());
			statement.setString(2, article.getBody());
			statement.setInt(3, article.getUserId());
			statement.setBoolean(4, article.isNotice());
			statement.setInt(5, article.getId());
			statement.executeUpdate();
		}
	}

	public static void insert(Article article) throws Exception {
		String sql = "insert article (no, title, body, userId, boardId, writeTime)"
				+" values(?, ?, ?, ?, ?, now())";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, article.getNo());
			statement.setString(2, article.getTitle());
			statement.setString(3, article.getBody());
			statement.setInt(4, article.getUserId());
			statement.setInt(5, article.getBoardId());
			statement.executeUpdate();
		}
	}
}
