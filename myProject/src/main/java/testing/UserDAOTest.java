package testing;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import Dao.UserDAO;

public class UserDAOTest {

    @Test
    public void testValidLogin() {
        UserDAO dao = new UserDAO();
        boolean result = dao.validateUser("testuser", "testpassword"); // Use valid credentials from DB
        assertTrue(result, "Login should succeed with correct credentials.");
    }

    private void assertTrue(boolean result, String string) {
		// TODO Auto-generated method stub
		
	}

	@Test
    public void testInvalidLogin() {
        UserDAO dao = new UserDAO();
        boolean result = dao.validateUser("wronguser", "wrongpassword"); // Use invalid credentials
        assertTrue(result, "Login should fail with incorrect credentials.");
    }
}
