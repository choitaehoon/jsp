package p201432038;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO
{
	public static List<User> findAll() throws Exception {
		String sql = "select id,name from user";
		try (Connection connection = DB.getConnection("bbs2");
				PreparedStatement statement = connection.prepareStatement(sql)) {
			try (ResultSet resultSet = statement.executeQuery()) {
				ArrayList<User> list = new ArrayList<User>();
				while (resultSet.next()) {
					User user = new User();
					user.setId(resultSet.getInt("id"));
					user.setName(resultSet.getString("name"));
					list.add(user);
				}
				return list;
			}
		}
	}

}
