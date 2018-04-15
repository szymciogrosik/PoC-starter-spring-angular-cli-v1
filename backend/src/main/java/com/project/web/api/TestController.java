package com.project.web.api;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.model.User;
import com.project.web.service.user.UserService;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {

    @Autowired
    private UserService userService;
    @Autowired
    private ObjectMapper mapper;

    @SneakyThrows
    @PostMapping("/api/test/admin")
    @PreAuthorize("hasRole('ADMIN')")
    public String testForAdmin(@RequestBody String username) {
        JsonNode jsonNode = mapper.readTree(username);
        User admin = userService.findByUsername(jsonNode.get("username").asText());
        return mapper.writeValueAsString(admin);
    }

    @SneakyThrows
    @GetMapping("/api/test/user")
    @PreAuthorize("hasRole('USER')")
    public String testForUser() {
        List<User> users = userService.findAll();
        return mapper.writeValueAsString(users);
    }

}
