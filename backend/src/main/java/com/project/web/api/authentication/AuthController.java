package com.project.web.api.authentication;

import com.project.config.security.jwt.JwtTokenUtil;
import lombok.Data;
import lombok.SneakyThrows;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Data
@RestController
@ConfigurationProperties(prefix = "jwt")
public class AuthController {

    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private UserDetailsService userDetailsService;

    private static final String USERNAME = "username";
    private static final String PASSWORD = "password";

    private String header;


    @SneakyThrows
    @PostMapping("/auth")
    public ResponseEntity createAuthenticationToken(@RequestBody String authData) {
        JSONObject jsonData = new JSONObject(authData);

        final Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        jsonData.getString(USERNAME),
                        jsonData.getString(PASSWORD)
                )
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);

        final UserDetails userDetails = userDetailsService.loadUserByUsername(jsonData.getString(USERNAME));
        final String token = jwtTokenUtil.generateToken(userDetails);
        final String username = userDetails.getUsername();

        return ResponseEntity.ok(String.format("{\"username\":\"%s\", \"token\":\"%s\"}", username, token));
    }

    @GetMapping("refresh")
    public ResponseEntity refreshAndGetAuthenticationToken(HttpServletRequest request) {
        String token = request.getHeader(header);
        String username = jwtTokenUtil.getUsernameFromToken(token);

        if (jwtTokenUtil.canTokenBeRefreshed(token, new Date())) {
            String refreshedToken = jwtTokenUtil.refreshToken(token);
            return ResponseEntity.ok(String.format("{\"username\":\"%s\", \"token\":\"%s\"}", username, refreshedToken));
        } else {
            return ResponseEntity.badRequest().body(null);
        }
    }

}
