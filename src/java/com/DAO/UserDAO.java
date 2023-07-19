package com.DAO;

import com.entity.User;

/**
 *
 * @author Rajarshi
 */

public interface UserDAO {
    public boolean userRegister(User u);
    
    public User login(String email,String password);
    
    public boolean checkPassword(String pas,int id);
    
    public boolean updateProfile(User u);
    
    public boolean checkUser(String em);
}
