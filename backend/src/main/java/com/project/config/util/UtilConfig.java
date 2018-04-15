package com.project.config.util;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;

public class UtilConfig {

    @Bean
    ObjectMapper mapper() {
        return new ObjectMapper();
    }

}
