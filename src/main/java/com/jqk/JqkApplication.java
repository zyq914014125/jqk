package com.jqk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.jqk.mapper")
public class JqkApplication {

    public static void main(String[] args) {
        SpringApplication.run(JqkApplication.class, args);
    }

}
