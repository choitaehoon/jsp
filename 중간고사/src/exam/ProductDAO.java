package exam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
	public static Product createStudent(ResultSet resultSet) throws SQLException {
		Product product = new Product();
		product.setId(resultSet.getInt("id"));
		product.setTitle(resultSet.getString("title"));
		product.setCategoryId(resultSet.getInt("categoryId"));
		product.setUnitCost(resultSet.getInt("unitCost"));
		product.setQuantity(resultSet.getInt("quantity"));
		product.setName(resultSet.getString("name"));
		return product;
	}

	public static List<Product> findByName(String srchText) throws Exception {
		String sql = "SELECT p.*, c.name " + "FROM product p LEFT JOIN category c ON p.categoryId = c.id "
				+ "WHERE p.title like ?";
		try (Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, srchText + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				List<Product> list = new ArrayList<Product>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

	public static List<Product> findAll(int currentPage, int pageSize) throws Exception {
		String sql = "SELECT p.*, c.name " + "FROM product p LEFT JOIN category c ON p.categoryId = c.id"
				+ " LIMIT ?, ?";
		try (Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, (currentPage - 1) * pageSize);
			statement.setInt(2, pageSize);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Product> list = new ArrayList<Product>();
				while (resultSet.next()) {
					list.add(createStudent(resultSet));
				}
				return list;
			}
		}
	}

	public static int count() throws Exception {
		String sql = "SELECT COUNT(*) FROM product";
		try (Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql);
				ResultSet resultSet = statement.executeQuery()) {
			if (resultSet.next())
				return resultSet.getInt(1);
		}
		return 0;
	}

	public static List<Product> findByCategory(int category) throws Exception {
		String sql = "SELECT p.*, c.name " + "FROM product p LEFT JOIN category c ON p.categoryId = c.id "
				+ "WHERE p.categoryId = ?";
		try (Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, category);
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Product> list = new ArrayList<Product>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

	public static List<Product> findAllA() throws Exception {
		String sql = "SELECT p.*, c.name " + "FROM product p LEFT JOIN category c ON p.categoryId = c.id ";
		try (Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Product> list = new ArrayList<Product>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

	public static List<Product> findByCategoryIdZero() throws Exception {
		String sql = "SELECT p.*, c.name " + "FROM product p LEFT JOIN category c ON p.categoryId = c.id ";
		try (Connection connection = DB.getConnection("product");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<Product> list = new ArrayList<Product>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}

	public static List<Product> findByCategoryId(int categoryId) throws Exception {
		String sql = "SELECT p.*, c.name " + "FROM product p LEFT JOIN category c ON p.categoryId = c.id "
				+ "WHERE p.categoryId = ?";
		try (Connection connection = DB.getConnection("student1");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, categoryId);
			try (ResultSet resultSet = statement.executeQuery()) {
				List<Product> list = new ArrayList<Product>();
				while (resultSet.next())
					list.add(createStudent(resultSet));
				return list;
			}
		}
	}
}
