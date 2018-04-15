package com.project.web.service.user;

import com.project.model.User;
import java.util.List;

public interface UserService {

    List<User> findAll();
    User findByUsername(String username);

}
