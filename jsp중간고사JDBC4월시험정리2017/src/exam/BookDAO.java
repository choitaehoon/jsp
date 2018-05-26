package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO
{
	public static Book createStudent(ResultSet resultSet) throws SQLException {
		Book book = new Book();
		book.setId(resultSet.getInt("id"));
		book.setTitle(resultSet.getString("title"));
		book.setAuthor(resultSet.getString("author"));
		book.setCategoryId(resultSet.getInt("categoryId"));
		book.setPrice(resultSet.getInt("price"));
		book.setPublisher(resultSet.getString("publisher"));
		book.setCategoryName(resultSet.getString("categoryName"));
		return book;
	}

	public static List<Book> findBycategoryId(int categoryId) throws Exception {
		String sql = "SELECT b.*, c.categoryName " + "FROM book b LEFT JOIN category c ON b.categoryId = c.id "
				+ "WHERE b.categoryId = ?";
		try (Connection connection = DB.getConnection("book");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, categoryId);
			try (ResultSet resultSet = statement.executeQuery()) {
				List<Book> list = new ArrayList<Book>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

	public static List<Book> findByAll() throws Exception {
		String sql = "SELECT b.*, c.categoryName " + "FROM book b LEFT JOIN category c ON b.categoryId = c.id ";
		try (Connection connection = DB.getConnection("book");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			try (ResultSet resultSet = statement.executeQuery()) {
				List<Book> list = new ArrayList<Book>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

}
